//
//  CardView.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI

struct CardView: View {
  let scrum: DailyScrum
  var body: some View {
    VStack(alignment: .leading) {
      Text(scrum.title)
        .font(.headline)
      Spacer()
      HStack {
        Label("\(scrum.attendees.count)", systemImage: "person.3")
          .accessibilityElement(children: .ignore)
          .accessibilityLabel(Text("Attendees"))
          .accessibilityValue(Text("\(scrum.attendees.count)"))
        Spacer()
        Label("\(scrum.lengthInMinutes)", systemImage: "clock")
          .padding(.trailing, 20)
          .accessibilityElement(children: .ignore)
          .accessibilityLabel(Text("Meeting length"))
          .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
      }
      .font(.caption)
    }
    .padding()
    .foregroundColor(scrum.color.accessibleFontColor)

  }
}

struct CardView_Previews: PreviewProvider {
  static let scrum = DailyScrum.data[0]
  static var previews: some View {
    CardView(scrum: scrum)
      .background(scrum.color)
      .previewLayout(.fixed(width: 400, height: 60))
  }
}
