//
//  BarGraphView.swift
//  MikeDaily
//
//  Created by 白謹瑜 on 2020/12/28.
//

import SwiftUI

struct BarGraphView: View {
    
    var BarHight :[Int]
    var body: some View {
        HStack{
            BarView(BarHeight: BarHight[0])
                .fill(Color.red)
            BarView(BarHeight: BarHight[1])
                .fill(Color.orange)
            BarView(BarHeight: BarHight[2])
                .fill(Color.yellow)
            BarView(BarHeight: BarHight[3])
                .fill(Color.green)
            BarView(BarHeight: BarHight[4])
                .fill(Color.blue)
            BarView(BarHeight: BarHight[5])
                .fill(Color.purple)
        }
    }
}
struct BarView:Shape {
    var BarHeight: Int
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            let original = CGPoint(x: rect.minX, y: rect.maxY)
            path.move(to: original)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - CGFloat(BarHeight)))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - CGFloat(BarHeight)))
                
            
            
        }
        
    }
    
    
}

struct BarGraphView_Previews: PreviewProvider {
    static var previews: some View {
        BarGraphView(BarHight: [10,10,100,10,10,10])
    }
}
