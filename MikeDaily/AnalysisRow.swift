//
//  AnalysisRow.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/23.
//

import SwiftUI




struct AnalysisRow: View {
    
    let Week = [
        "一",
        "二",
        "三",
        "四",
        "五",
        "六",
        "日",
    ]
    
    let ClassesTime01 = [
        "8:20",
        "9:20",
        "10:20",
        "11:15",
        "12:10",
        "13:10",
        "14:10",
        "15:10",
        "16:05",
        "17:30",
        "18:30",
        "19:25",
        "20:20",
        "21:15",
    ]
    let ClassesTime02 = [
        "9:10",
        "10:10",
        "11:10",
        "12:05",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "16:55",
        "18:20",
        "19:20",
        "20:15",
        "21:10",
        "22:05",
    ]

    
    var Classes :Class
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Text("課程名稱："+Classes.ClassName)
                Text("時間：星期\(Week[Classes.ClassTime]) \(ClassesTime01[Classes.DayTime])-\(ClassesTime02[Classes.DayTime])")
            }
        }
    }
}

struct AnalysisRow_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisRow(Classes: Class(ClassName: "工程數學", ClassTime: 2, ClassTimeInterval: 2, DayTime: 3))
    }
}
