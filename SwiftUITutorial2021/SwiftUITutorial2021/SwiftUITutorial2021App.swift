//
//  SwiftUITutorial2021App.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/17.
//

import SwiftUI

@main
struct SwiftUITutorial2021App: App {
  @State private var scrums = DailyScrum.data

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ScrumsView(scrums: $scrums)
      }
    }
  }
}
