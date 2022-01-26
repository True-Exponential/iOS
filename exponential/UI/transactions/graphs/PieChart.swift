//
//  BarChart.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 24/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI
import Charts

struct TransactionsPieChartView : UIViewRepresentable {
    
    let entries : [PieChartDataEntry]
    func makeUIView(context: Context) -> PieChartView {
        let pieChartView = PieChartView()
        
        /*let l = pieChartView.legend

        let legendEntry1 = LegendEntry(label: "Arts")
        legendEntry1.formColor = NSUIColor.red

        let legendEntry2 = LegendEntry(label: "Food")
        legendEntry2.formColor = NSUIColor.red
        
        let legendEntry3 = LegendEntry(label: "Drinks")
        legendEntry3.formColor = NSUIColor.red
        
        let legendEntry4 = LegendEntry(label: "Entertainment")
        legendEntry4.formColor = NSUIColor.red
        
        let legendEntry5 = LegendEntry(label: "Bills")
        legendEntry5.formColor = NSUIColor.red
        
        let customLegendEntries = [legendEntry1, legendEntry2, legendEntry3, legendEntry4, legendEntry5]
        l.setCustom(entries: customLegendEntries)
        l.orientation = .horizontal
        l.textColor = UIColor.white
        //l.font = SystemF.openSansRegular.of(size: 6)*/
        
        return pieChartView
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.label = "Transactions"
        uiView.data = PieChartData(dataSet : dataSet)
        
        dataSet.colors = [.blue, .red, .black, .darkGray,.brown  ]
        //dataSet.valueColors = [.cyan]
    }
}

struct TransactionsPieChart_Previews: PreviewProvider {
    static var previews: some View {
        
        let data = [
            PieChartDataEntry(value:453, label: "Food"),
            PieChartDataEntry(value:2343, label: "Bills"),
            PieChartDataEntry(value:762, label: "Shows"),
            PieChartDataEntry(value:3496, label: "Auto"),
            PieChartDataEntry(value:1702, label: "Restaurants")
        ]
        
        TransactionsPieChartView(entries: data)
    }
}
