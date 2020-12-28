//
//  ContentView.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/14.
//

import SwiftUI

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



struct ContentView: View {
    
    @State private var WeekTime = 0
    @State private var DayTime = 0
    @State private var showEditClass = false
//    @EnvironmentObject var Classdata :ClasseData
    @ObservedObject var Classdata = ClasseData()
    @State private var Isdelete = false
    @State private var EditState = "Edit"
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Image("新一")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 50)
                        .clipped()
                    
                    ForEach(Week.indices){index in
                        Text("\(Week[index])")
                            .font(.title)
                            .frame(width: 40, height: 35)
                        
                        
                    }
                }
                .background(
                    ZStack{
                        Rectangle()
                            .stroke()
                        
                    }
                    
                )
                
                Spacer()
                
                ScrollView(){
                    
                    HStack(alignment: .top){
                        VStack(alignment: .center){
                            ForEach(ClassesTime01.indices){(int) in
                                VStack{
                                    Text("\(ClassesTime01[int])"+"\n|"+"\n\(ClassesTime02[int])")
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 35, height: 50)
                                        .background(
                                            Rectangle()
                                                .stroke()
                                        )
                                    Spacer()
                                    
                                }
                            }
                        }
                        
                        ForEach(Range(1...7)){ index in
                            VStack(alignment: .center){
                                
                                
                                ForEach(Range(1...14)){(int) in
                                    ZStack{
                                        
                                        Button(action: {
                                            WeekTime = index - 1
                                            DayTime = int - 1
                                            showEditClass = true
                                        }){
                                            Text("")
                                                .frame(width: 40, height: 50)
                                                .background(
                                                    Rectangle()
                                                        .stroke()
                                                    
                                                )
                                            
                                        }.foregroundColor(.black)
                                        ForEach(Classdata.Classes.indices, id: \.self){ ClassIndex in
                                            
                                            if (Classdata.Classes[ClassIndex].ClassTime + 1  == index){
                                                if (Classdata.Classes[ClassIndex].DayTime + 1 == int ){
                                                    NavigationLink(
                                                        destination: ClassesEditor(Classes: Classdata, WeekTime1: Classdata.Classes[ClassIndex].ClassTime, DailyTime: Classdata.Classes[ClassIndex].DayTime, BackTime: 0, editClassIndex: ClassIndex),
                                                        label: {
                                                            ClassRowView(Classes: Classdata.Classes[ClassIndex])
                                                        }
                                                        
                                                    ).foregroundColor(.black)
                                                    if( Isdelete ) {
                                                        Button(action: {
                                                            Classdata.Classes.remove(at: ClassIndex)
//                                                            Isdelete = false
                                                        }, label: {
                                                            Image(systemName: "minus.circle.fill")
                                                                .foregroundColor(.red)
                                                                .frame(width: 35.0, height: 50.0)
                                                        })
                                                    }

                                                    
                                                    
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }
                }
                
            }
            .navigationTitle("課表")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        
                        showEditClass = true
                        
                        
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        if (Isdelete){
                            EditState = "Edit"
                            Isdelete = false
                        }else{
                            EditState = "完成"
                            Isdelete = true
                        }
                    }, label: {
                        HStack{
//                            Image(systemName: "minus.circle.fill")
                            Text("\(EditState)")
                        }
                    })
                    
                }
                
                
                
            })
            .sheet(isPresented: $showEditClass) {
                NavigationView{
                    ClassesEditor(Classes: Classdata, WeekTime1:  WeekTime, DailyTime: DayTime, BackTime: 0 )
                }
            }
            
            .background(
                Image("學校")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                
            )
            
            
            
            
            
            
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
