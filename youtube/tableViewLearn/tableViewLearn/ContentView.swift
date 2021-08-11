//
//  ContentView.swift
//  tableViewLearn
//
//  Created by Lei Zhao on 8/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var persons: [Person] = [Person(), Person()]
    @State var selectedRow: Int?
    @State var isEditingCell = false

    var body: some View {
        VStack {
            TableView(data: $persons,
              onSelectedRow: { i in selectedRow = i },
              isEditingCell: { isEditing in
                  print("...isEditing...")
                  isEditingCell = isEditing 
              }) { row, propertyKey, stringValue in
                persons[row].setValue(stringValue, forKey: propertyKey)
            }

            HStack {
                Button(action: { addPerson() }) {
                    Text("Add Person")
                }
                  .disabled(isEditingCell)
                Button(action: { removePerson() }) {
                    Text("Remove")
                }
                  .disabled(isEditingCell)
            }
        }
    }

    private func addPerson() {
        persons.append(Person())
    }

    private func removePerson() {
        guard let selectedRow = selectedRow else {
            return
        }
        print("...removePerson...", selectedRow)
        if selectedRow > -1 {
            persons.remove(at: selectedRow)
            self.selectedRow = -1
        }
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .frame(minWidth: 480, minHeight: 300)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    #if DEBUG
        @objc class func injected() {
            NSApplication.shared.windows.first?.contentViewController = NSHostingController(rootView: ContentView_Previews.previews)
        }
    #endif
}
