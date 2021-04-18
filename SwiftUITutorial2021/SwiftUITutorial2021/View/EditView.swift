//
//  EditView.swift
//  SwiftUITutorial2021
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI

struct EditView: View {
  @Binding var scrumData: DailyScrum.Data
  @State private var newAttendee = ""

  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        TextField("Title", text: $scrumData.title)

        HStack {
          Slider(value: $scrumData.lengthInMinutes,
                 in: 5...30,
                 step: 1.0) {
            Text("Length")
          }
          .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))

          Spacer()
          Text("\(Int(scrumData.lengthInMinutes)) mins")
            .accessibilityHidden(true)

        }

        ColorPicker("Color", selection: $scrumData.color)
          .accessibilityLabel(Text("Color Picker"))
      }

      Section(header: Text("Attendees")) {
        ForEach(scrumData.attendees, id: \.self) { attendee in
          Text(attendee)
        }
        .onDelete { indices in
          scrumData.attendees.remove(atOffsets: indices)
        }
        HStack {
          TextField("New Attendee", text: $newAttendee)
          Spacer()

          Button(action: {
            withAnimation {
              scrumData.attendees.append(newAttendee)
              newAttendee = ""
            }
          }) {
            Image(systemName: "plus.circle.fill")
              .accessibilityLabel(Text("Add attendee"))
          }
          .disabled(newAttendee.isEmpty)
        }
      }
    }
    .listStyle(InsetGroupedListStyle())
  }
}

struct EditView_Previews: PreviewProvider {
  static var previews: some View {
    EditView(scrumData: .constant(DailyScrum.data[0].data))
  }
}
