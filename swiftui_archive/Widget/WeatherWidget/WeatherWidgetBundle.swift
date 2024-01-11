//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetLiveActivity()
    }
}
