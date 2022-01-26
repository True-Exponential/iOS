//
//  BarChart.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 24/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI
import Charts

struct TransactionsBarChartView : UIViewRepresentable {
    
    let entries : [BarChartDataEntry]
    func makeUIView(context: Context) -> BarChartView {
        let barChartView = BarChartView()
        return barChartView
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.label = "Transactions"
        uiView.data = BarChartData(dataSet : dataSet)
        
        dataSet.colors = [.blue]
        dataSet.valueColors = [.cyan]
    }
}

struct TransactionsBarChart_Previews: PreviewProvider {
    static var previews: some View {
        
        let array = [Int](1...50)
        
        let data = array.map{_ in BarChartDataEntry(x:Double(Int.random(in: 1..<13)), y: Double(Int.random(in: 1..<1000)))}
        
        TransactionsBarChartView(entries: data)
    }
}
