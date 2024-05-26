//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import WidgetKit
import SwiftUI

// AppIntentTimelineProvider으로 변경됨 교재는 TimelineProvider
struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), city: "London", temperature: 87, description: "Hail Storm", icon: "cloud.hail", image: "hail")
    }
    
    // 샘플데이터 반환
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WeatherEntry {
        WeatherEntry(date: Date(), city: "London", temperature: 87, description: "Hail Storm", icon: "cloud.hail", image: "hail")
    }
    
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WeatherEntry> {
        var entries: [WeatherEntry] = []
        var eventDate = Date()
        let halfMinute: TimeInterval = 30
        
        // 30초 간격으로 데이터를 업데이트
        for var entry in londonTimeline {
            entry.date = eventDate
            eventDate += halfMinute
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .never)
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.

        /**
         리로드 정책
         - atEnd: 새로운 타임라인을 요청
         -after(Date): 지정된 날짜와 시간 이후에 새로운 타임라인을 요청
         -never: 타임라인 종료 시, 타임라인이 다시 로드되지 않는다.
         */
        return timeline
    }
}



// 화면
// 위젯이 표시될 엔트리뷰
// 타임라인 엔트리로 채워짐
struct WeatherWidgetEntryView : View {
    var entry: Provider.Entry // 뷰에 표시될 타임라인엔트리를 전달받는다
    
    var body: some View {
        ZStack {
            Color("weatherBackgroundColor")
            WeatherSubView(entry: entry)
        }
    }
}

struct WeatherSubView: View {
    var entry: WeatherEntry
    
    var body: some View {
        VStack {
            VStack {
                Text("\(entry.city)")
                    .font(.title)
                Image(systemName: entry.icon)
                    .font(.largeTitle)
                Text("\(entry.description)")
                    .frame(minWidth: 125, minHeight: nil)
            }
            .padding(.bottom, 2)
            .background(ContainerRelativeShape().fill(Color("weatherInsetColor")))
            
            Label("\(entry.temperature)", systemImage: "thermometer")
        }
        .foregroundColor(.white)
        .padding()
    }
        
}

// 실제 Widget을 만든느 부분
// 표시할 정보, 디스플레이 이름과설명, 지원크기를 포함함
struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WeatherWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

//#Preview(as: .systemSmall) {
//    WeatherWidget()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
//}
