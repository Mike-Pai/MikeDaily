//
//  ClassRowView.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/14.
//

import SwiftUI

struct ClassRowView: View {
    var Classes :Class
    var body: some View {
        ZStack{
            Text(Classes.ClassName)
                .multilineTextAlignment(.center)
                .frame(width: 40, height: 50.0)
                .background(
                    Rectangle()
                        .foregroundColor(.orange)
                )
        }
    }
}

struct ClassRowView_Previews: PreviewProvider {
    static var previews: some View {
        ClassRowView(Classes: Class(ClassName: "工程數學", ClassTime: 2, ClassTimeInterval: 2, DayTime: 3))
    }
}
