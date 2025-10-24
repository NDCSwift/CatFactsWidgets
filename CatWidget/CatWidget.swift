//
// Project: CatFactsWidgets
//  File: CatWidget.swift
//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger
//

import WidgetKit
import SwiftUI

/// A timeline entry that represents a single point in time for the widget,
/// containing the date at which it is valid and the cat fact to display.
struct CatFactEntry: TimelineEntry {
    /// The date when this entry becomes active in the widget timeline.
    let date: Date
    /// The cat fact content to show for this entry.
    let fact: CatFact
}

/// Supplies placeholder, snapshot, and timeline entries for the Cat Fact widget.
///
/// This provider currently uses locally defined sample data rather than making
/// a network request. The widget refresh policy is set to update every hour.
struct CatFactProvider: TimelineProvider {
    
    /// Provides a lightweight representation of the widget's content for use in
    /// transient contexts (like the widget gallery). Keep this fast and simple.
    func placeholder(in context: Context) -> CatFactEntry {
        // Use the first sample fact for a predictable placeholder.
        CatFactEntry(date: Date(), fact: CatFact.sampleFacts.first!)
    }
    
    /// Returns a single entry for snapshotting (e.g., in the gallery or during
    /// quick previews). This should be fast and avoid heavy work.
    func getSnapshot(in context: Context, completion: @escaping (CatFactEntry) -> Void) {
        // Provide a stable snapshot using the first sample fact.
        let entry = CatFactEntry(date: Date(), fact: CatFact.sampleFacts.first!)
        completion(entry)
    }
    
    /// Builds the widget timeline by providing one or more entries and a policy
    /// that indicates when WidgetKit should request the next timeline.
    func getTimeline(in context: Context, completion: @escaping (Timeline<CatFactEntry>) -> Void) {
        // Select a random fact to keep the widget content fresh.
        let entry = CatFactEntry(date: Date(), fact: CatFact.sampleFacts.randomElement()!)
        
        // Refresh after one hour. This keeps content rotating without being too frequent.
        let refreshDate = Date().addingTimeInterval(3600)
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
    
}

/// The SwiftUI view that renders the content of the widget for a given entry.
struct CatFactWidgetEntryView: View {
    /// The entry provided by the timeline, containing the fact to display.
    var entry: CatFactProvider.Entry
    
    @ViewBuilder
    var body: some View {
        
        // Compose the primary content once and then apply background styling
        // based on platform availability.
        let content = VStack {
            Text("Cat Fact 🐾")
                .font(.caption)
                .bold()
            Text(entry.fact.text)
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(4)
        }
        
        // On newer OS versions, use containerBackground for a proper widget
        // background that respects system materials. Fall back to a clear
        // background on older OS versions.
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            content.containerBackground(for: .widget) {
                Color.clear
            }
        } else {
            content.background(Color.clear)
        }
        
        
    }
}

/// The widget definition that describes configuration, display name, description,
/// and supported families.
struct CatFactWidget: Widget {
    
    /// A unique identifier for this widget type.
    let kind: String = "CatFactWidget"
    
    var body: some WidgetConfiguration {
        // StaticConfiguration is used here because the widget doesn't require
        // user-provided configuration. It always shows a cat fact.
        StaticConfiguration(kind: kind, provider: CatFactProvider()) { entry in
            let base = CatFactWidgetEntryView(entry: entry)
            
            // Apply container background at the configuration level as well to
            // ensure consistent appearance in all contexts.
            if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
                base.containerBackground(for: .widget) {
                    Color.clear
                }
            } else {
                base.background(Color.clear)
            }
        }
        // The name and description shown in the widget gallery.
        .configurationDisplayName("Cat fact of the hour!")
        .description("Learn something new about cats")
        
        // Declare supported widget families per platform. Keep this list aligned
        // with the view layout to ensure good use of space.
        #if os(iOS)
        .supportedFamilies([.systemSmall, .systemMedium])
        #elseif os(macOS)
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        #endif
        
    }
}
