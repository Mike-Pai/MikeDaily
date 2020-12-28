//
//  ClassesEditor.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/20.
//

import SwiftUI

struct ClassesEditor: View {
    
    @Environment(\.presentationMode) var presentationMode
    var Classes: ClasseData
    @State var WeekTime1 :Int
    @State var DailyTime :Int
    
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
    
    @State private var name = "課程"
    @State private var Time = 1
    
    @State  var BackTime : Int
    var editClassIndex: Int?
    
    var body: some View {
      
            Form {
                HStack{
                    TextField("課名", text: $name)
                    //                    Stepper("節數\(Time)", value: $Time, in: 1...10)
                }
                HStack{
                    
                    Picker("星期", selection: $WeekTime1) {
                        ForEach(Week.indices) { (index) in
                            Text("\(Week[index])")
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    
                }
                HStack{
                Picker("節次", selection: $DailyTime) {
                    ForEach(ClassesTime01.indices) { (index) in
                        Text("\(ClassesTime01[index])"+"-"+"\(ClassesTime02[index])")
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                    Stepper("節數\(Time)", value: $Time, in: 1...10)
                }
            }
            .onAppear(perform: {
                if let editClassesIndex = editClassIndex {
                    
                    if(BackTime == 0){
                        let editClasses = Classes.Classes[editClassesIndex]
                        name = editClasses.ClassName
                        WeekTime1 = editClasses.ClassTime
                        DailyTime = editClasses.DayTime
                        Time = editClasses.ClassTimeInterval
                    }
                    
                }
                BackTime = 1
            })
            .navigationBarTitle(editClassIndex == nil ? "新增課表" : "編輯課表")
            .toolbar(content: {
                ToolbarItem{
                    Button("save"){
                        let classes = Class(ClassName: name, ClassTime: WeekTime1, ClassTimeInterval: Time, DayTime: DailyTime)
                        if let editClassIndex = editClassIndex {
                            Classes.Classes[editClassIndex] = classes
                        }else{
                            Classes.Classes.insert(classes, at: 0)
                        }
                       
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            })
        
    }
}


struct ClassesEditor_Previews: PreviewProvider {
    static var previews: some View {
        ClassesEditor(Classes: ClasseData(), WeekTime1: 0, DailyTime: 0 ,BackTime: 0)
    }
}
