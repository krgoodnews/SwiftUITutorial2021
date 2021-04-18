//
//  ScrumsView.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI

struct ScrumsView: View {

  let scrums: [DailyScrum]
  var body: some View {
    List {
      ForEach(scrums, id: \.title) { scrum in
        NavigationLink(destination: DetailView(scrum: scrum)){
          CardView(scrum: scrum)
        }
        .listRowBackground(scrum.color)
      }
    }
    .navigationTitle("Daily Scrum")
    .navigationBarItems(trailing: Button(action: {}) {
      Image(systemName: "plus")
    })
  }
}

struct ScrumsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ScrumsView(scrums: DailyScrum.data)
    }
  }
}
