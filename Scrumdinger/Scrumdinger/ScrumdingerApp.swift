//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: DailyScrum.sampleData)
        }
    }
}
