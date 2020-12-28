//
//  Data.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/14.
//

import Foundation
import SwiftUI

struct Class :Identifiable, Codable{
    var id = UUID()
    var ClassName : String
    var ClassTime : Int
    var ClassTimeInterval : Int
    var DayTime : Int
}

class ClasseData : ObservableObject {
    @AppStorage("Classes") var ClassesData:Data?
    
    init() {
        if let ClassesData = ClassesData {
            let decoder = JSONDecoder()
            
            if let decodedData = try? decoder.decode([Class].self, from: ClassesData){
                Classes = decodedData
            }
    }
}


    @Published var Classes = [Class](){
    didSet{
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(Classes)
            ClassesData = data
        } catch {
        }
    }
}
}
