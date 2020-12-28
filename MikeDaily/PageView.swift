//
//  PageView.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/14.
//

import SwiftUI

struct PageView: View {
    @StateObject var classeData = ClasseData()
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "tablecells")
                        Text("課表")
                    }
                }
            AnalysisChart(Classdata: ClasseData())
                .tabItem {
                    VStack{
                        Image(systemName: "lightbulb")
                        Text("詳細資料")
                    }
                }
        }
        .environmentObject(classeData)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
