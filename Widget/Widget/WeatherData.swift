//
//  WeatherData.swift
//  Widget
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import Foundation
import WidgetKit

// 위젯 타임라인의 각 지점은 위젯 타임라인 엔트리 인스턴스로 표현

struct WeatherEntry: TimelineEntry {
    var date: Date
    
    let city: String
    let temperature: Int
    let description: String
    let icon: String
    let image: String
}
