//
//  AppIntent.swift
//  WeatherWidget
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")

    var favoriteEmoji: String
}
