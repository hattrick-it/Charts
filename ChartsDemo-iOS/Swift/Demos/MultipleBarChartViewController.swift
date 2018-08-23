//
//  MultipleBarChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts

class MultipleBarChartViewController: DemoBaseViewController {

    @IBOutlet var chartView: BarChartView!
    @IBOutlet var sliderX: UISlider!
    @IBOutlet var sliderY: UISlider!
    @IBOutlet var sliderTextX: UITextField!
    @IBOutlet var sliderTextY: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Multiple Bar Chart"
        
        self.options = [.toggleValues,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleAutoScaleMinMax,
                        .toggleData,
                        .toggleBarBorders]
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled =  false
        
        chartView.pinchZoomEnabled = false
        chartView.drawBarShadowEnabled = false
        
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1), font: .systemFont(ofSize: 12), textColor: .white, insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        

        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.granularity = 1
        xAxis.centerAxisLabelsEnabled = true
        xAxis.valueFormatter = IntAxisValueFormatter()
/////////////////////////////// Hattrick-it changes for special use ////////////////////////////////////////////
        xAxis.axisMinimum = 0
        xAxis.axisMaximum = 7
        xAxis.labelCount = 7
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.valueFormatter = LargeValueFormatter()
        leftAxis.spaceTop = 0.35
        leftAxis.axisMinimum = 0
////////////////////////////// Hattrick-it changes for special use ////////////////////////////////////////////
        leftAxis.axisMaximum = 24
        leftAxis.labelCount = 24
        leftAxis.inverted = true
        
        chartView.pinchZoomEnabled = false
        chartView.legend.enabled = false
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        chartView.rightAxis.enabled = false
     
////////////////////////////// Hattrick-it changes for special use ////////////////////////////////////////////
        setup1Sets()
//        setup2Sets()
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }

////////////////////////////// Hattrick-it changes for special use ////////////////////////////////////////////
    func setup2Sets() {
        let groupSpace = 0.08
        let barSpace = 0.06
        let barWidth = 0.4
        // (0.2 + 0.03) * 4 + 0.08 = 1.00 -> interval per "group"
        
        let slotsReq: [Float] = [10, 20]
        let slotsReq2: [Float] = [14, 24]
        let slots1: [Float] = [10, 15, 18, 23]
        let slots2: [Float] = [2, 15, 18, 23]
        let slots3: [Float] = [8, 16]
        let slots4: [Float] = [16, 20]
        let slots5: [Float] = [10, 15, 18, 20.30]
        let slots6: [Float] = [6, 15, 18, 24]
        let slots7: [Float] = [12, 17, 18, 22.30]
        let sun1 = BarChartDataEntry(x: 0, y: 24, data: slots1 as AnyObject)
        let sun2 = BarChartDataEntry(x: 0, y: 24, data: slotsReq as AnyObject)
        let mon1 = BarChartDataEntry(x: 1, y: 24, data: slots2 as AnyObject)
        let mon2 = BarChartDataEntry(x: 1, y: 24, data: slotsReq as AnyObject)
        let tue1 = BarChartDataEntry(x: 2, y: 24, data: slots3 as AnyObject)
        let tue2 = BarChartDataEntry(x: 2, y: 24, data: slotsReq2 as AnyObject)
        let wed1 = BarChartDataEntry(x: 3, y: 24, data: slots4 as AnyObject)
        let wed2 = BarChartDataEntry(x: 3, y: 24, data: slotsReq as AnyObject)
        let thu1 = BarChartDataEntry(x: 4, y: 24, data: slots5 as AnyObject)
        let thu2 = BarChartDataEntry(x: 4, y: 24, data: slotsReq as AnyObject)
        let fri1 = BarChartDataEntry(x: 5, y: 24, data: slots6 as AnyObject)
        let fri2 = BarChartDataEntry(x: 5, y: 24, data: slotsReq2 as AnyObject)
        let sat1 = BarChartDataEntry(x: 6, y: 24, data: slots7 as AnyObject)
        let sat2 = BarChartDataEntry(x: 6, y: 24, data: slotsReq as AnyObject)
        
        let yVals1 = [sun1, mon1, tue1, wed1, thu1, fri1, sat1]
        let yVals2 = [sun2, mon2, tue2, wed2, thu2, fri2, sat2]
        
        let set1 = BarChartDataSet(values: yVals1, label: "Company A")
        set1.setColor(UIColor(red: 48/255, green: 111/255, blue: 224/255, alpha: 1))
        set1.drawValuesEnabled = false
        
        let set2 = BarChartDataSet(values: yVals2, label: "Company B")
        set2.setColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        set2.drawValuesEnabled = false
        
        let data = BarChartData(dataSets: [set1, set2])
        data.setValueFont(.systemFont(ofSize: 10, weight: .light))
        data.setValueFormatter(LargeValueFormatter())
        
        // specify the width each bar should have
        data.barWidth = barWidth
        
        
        data.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
        
        chartView.data = data
    }

    
    func setup1Sets() {
    
        let slots1: [Float] = [10, 15, 18, 23]
        let slots2: [Float] = [2, 15, 18, 23]
        let slots3: [Float] = [8, 16]
        let slots4: [Float] = [16, 20]
        let slots5: [Float] = [10, 15, 18, 20.30]
        let slots6: [Float] = [6, 15, 18, 24]
        let slots7: [Float] = [12, 17, 18, 22.30]
        let sun1 = BarChartDataEntry(x: 0, y: 24, data: slots1 as AnyObject)
        let mon1 = BarChartDataEntry(x: 1, y: 24, data: slots2 as AnyObject)
        let tue1 = BarChartDataEntry(x: 2, y: 24, data: slots3 as AnyObject)
        let wed1 = BarChartDataEntry(x: 3, y: 24, data: slots4 as AnyObject)
        let thu1 = BarChartDataEntry(x: 4, y: 24, data: slots5 as AnyObject)
        let fri1 = BarChartDataEntry(x: 5, y: 24, data: slots6 as AnyObject)
        let sat1 = BarChartDataEntry(x: 6, y: 24, data: slots7 as AnyObject)
        
        let yVals1 = [sun1, mon1, tue1, wed1, thu1, fri1, sat1]
        
        let set1 = BarChartDataSet(values: yVals1, label: "Company A")
        set1.setColor(UIColor(red: 48/255, green: 111/255, blue: 224/255, alpha: 1))
        set1.drawValuesEnabled = false
        
        let data = BarChartData(dataSets: [set1])
        data.setValueFont(.systemFont(ofSize: 10, weight: .light))
        data.setValueFormatter(LargeValueFormatter())
        
        let groupSpace = 0.1
        let barSpace = 0.6
        let barWidth = 0.3
        
        // specify the width each bar should have
        data.barWidth = barWidth
        data.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
        
        chartView.setVisibleXRangeMaximum(6.99)
        chartView.data = data
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func optionTapped(_ option: Option) {
        super.handleOption(option, forChartView: chartView)
    }
    
    // MARK: - Actions
    @IBAction func slidersValueChanged(_ sender: Any?) {
////////////////////////////// Hattrick-it changes for special use ////////////////////////////////////////////
    }
}
