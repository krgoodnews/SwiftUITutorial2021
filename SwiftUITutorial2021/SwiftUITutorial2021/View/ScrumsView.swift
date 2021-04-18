//
//  ScrumsView.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI

struct ScrumsView: View {
  @Binding var scrums: [DailyScrum]

  var body: some View {
    List {
      ForEach(scrums, id: \.title) { scrum in
        NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
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

  private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
    guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
      fatalError()
    }
    return $scrums[scrumIndex]
  }
}

struct ScrumsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ScrumsView(scrums: .constant(DailyScrum.data))
    }
  }
}
