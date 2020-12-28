//
//  AnalysisChart.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/23.
//

import SwiftUI

struct AnalysisChart: View {
    //    @EnvironmentObject var Classdata :ClasseData
    @ObservedObject var Classdata = ClasseData()
    //    @ObservedObject var wordsData = WordData()
    var index:Double = 0
    var percentAmount:[Double] = [0, 0, 0, 0, 0,0]
    var countType:[Double] = [0, 0, 0, 0, 0, 0]
    var anglesAmount = [Angle]()
    var HeightAmount : [Int] = [0, 0, 0, 0, 0, 0]
    var startDegree: Double = 0
    var process:Double=0
    var chart = ["圓餅圖", "長條圖"]
    @State private var selectChart: String = "圓餅圖"
    let roles = ["星期一","星期二","星期三","星期四","星期五","星期六"]
    init(Classdata: ClasseData) {
        for Classdata in Classdata.Classes {
            index += 1;
            if Classdata.ClassTime == 0 {
                countType[0] += 1;
                HeightAmount[0] += 10;
            } else if Classdata.ClassTime == 1 {
                countType[1] += 1;
                HeightAmount[1] += 10;
            } else if Classdata.ClassTime == 2 {
                countType[2] += 1;
                HeightAmount[2] += 10;
            } else if Classdata.ClassTime == 3 {
                countType[3] += 1;
                HeightAmount[3] += 10;
            } else if Classdata.ClassTime == 4 {
                countType[4] += 1;
                HeightAmount[4] += 10;
            }
            else {
                countType[5] += 1;
                HeightAmount[5] += 10;
            }
        }
        
        percentAmount[0] = countType[0] / index
        percentAmount[1] = countType[1] / index
        percentAmount[2] = countType[2] / index
        percentAmount[3] = countType[3] / index
        percentAmount[4] = countType[4] / index
        percentAmount[5] = countType[5] / index
        process /= index
        for percent in percentAmount {
            anglesAmount.append(.degrees(startDegree))
            startDegree += 360 * percent
        }
        
    }
    var body: some View {
        VStack{
            List{
                Section(header: Text("修課資料")) {
                    ForEach(Classdata.Classes.indices , id: \.self){ ClassIndex in
                        HStack{
                            Text("\(ClassIndex + 1).")
                            AnalysisRow(Classes: Class(ClassName: Classdata.Classes[ClassIndex].ClassName, ClassTime: Classdata.Classes[ClassIndex].ClassTime, ClassTimeInterval: Classdata.Classes[ClassIndex].ClassTimeInterval, DayTime: Classdata.Classes[ClassIndex].DayTime))
                        }
                        
                    }
                    
                }
                Section(header: Text("圖表分析")) {
                    VStack {
                        Picker(selection: self.$selectChart, label: Text("請選擇統計項目：")) {
                            ForEach(self.chart, id: \.self) {
                                (text) in Text(text)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(20)
                        if self.selectChart == "圓餅圖" {
                            VStack {
                                Spacer()
                                PieChartView(startAngle: anglesAmount)
                                    .frame(width: 300, height: 300)
                                Spacer()
                                HStack(alignment: .top){
                                    Group{
                                        Color.red.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期一 \n" + String(format: "%.1f", percentAmount[0] * 100) + "%")
                                        Color.orange.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期二 \n" + String(format: "%.1f", percentAmount[1] * 100) + "%")
                                        Color.yellow.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期三 \n" + String(format: "%.1f", percentAmount[2] * 100) + "%")}}
                                HStack(alignment: .top){
                                    Color.green.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期四 \n" + String(format: "%.1f", percentAmount[3] * 100) + "%")
                                    Color.blue.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期五 \n" + String(format: "%.1f", percentAmount[4] * 100) + "%")
                                    Color.purple.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期六 \n" + String(format: "%.1f", percentAmount[5] * 100) + "%")
                                }
                            }
                            .padding()
                            
                        } else if self.selectChart == "長條圖" {
                            VStack{
                                Spacer()
                                BarGraphView(BarHight: HeightAmount)
                                    .frame(width: 300, height: 300)
                                Spacer()
                                HStack(alignment: .top){
                                    Group{
                                        Color.red.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期一 \n" + String(format: "%.1f", percentAmount[0] * 100) + "%")
                                        Color.orange.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期二 \n" + String(format: "%.1f", percentAmount[1] * 100) + "%")
                                        Color.yellow.frame(width: 10, height: 10)
                                            .offset(y:7)
                                        Text("星期三 \n" + String(format: "%.1f", percentAmount[2] * 100) + "%")}}
                                HStack(alignment: .top){
                                    Color.green.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期四 \n" + String(format: "%.1f", percentAmount[3] * 100) + "%")
                                    Color.blue.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期五 \n" + String(format: "%.1f", percentAmount[4] * 100) + "%")
                                    Color.purple.frame(width: 10, height: 10)
                                        .offset(y:7)
                                    Text("星期六 \n" + String(format: "%.1f", percentAmount[5] * 100) + "%")
                                }

                            }
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}




struct AnalysisChart_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisChart(Classdata: ClasseData())
    }
}
