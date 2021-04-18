//
//  MeetingView.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/17.
//

import SwiftUI

struct MeetingView: View {
  var body: some View {
    VStack {
      ProgressView(value: 5, total: 15)
      HStack {
        VStack(alignment: .leading) {
          Text("Seconds Elapsed")
            .font(.caption)
          Label("300", systemImage: "hourglass.bottomhalf.fill")
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Seconds Remaining")
            .font(.caption)
          Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
        }
      }
      .accessibilityElement(children: .ignore)
      .accessibilityLabel(Text("Time remaining"))
      .accessibilityValue(Text("10 Minutes"))

      Circle()
        .strokeBorder(lineWidth: 24, antialiased: true)

      HStack {
        Text("Speaker 1 of 3")
        Spacer()
        Button(action: {}) {
          Image(systemName: "forward.fill")
        }
        .accessibilityLabel(Text("Next Speaker"))
      }
    }
    .padding()
  }
}

struct MeetingView_Previews: PreviewProvider {
  static var previews: some View {
    MeetingView()
  }
}
