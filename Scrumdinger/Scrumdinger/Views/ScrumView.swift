//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

struct ScrumView: View {
    let scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            List(scrums, id: \.title) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum), label: {
                    CardView(scrum: scrum)
                })
                    .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumView(scrums: DailyScrum.sampleData)
}
