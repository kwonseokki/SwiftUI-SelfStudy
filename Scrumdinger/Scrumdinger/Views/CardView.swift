//
//  CardView.swift
//  Scrumdinger
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        
        .foregroundColor(scrum.theme.accentColor)
        .padding()
        
    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[0])
}
