//
//  ContentView.swift
//  tableViewLearn
//
//  Created by Lei Zhao on 8/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var persons: [Person] = [Person(), Person()]

    var body: some View {
        VStack {
            TableView(data: $persons)
              .frame(width: .infinity, height: .infinity)
                .background(Color.red)

            HStack {
                Button(action: { addPerson() }) {
                    Text("Add")
                }
                Button(action: { print("remove..") }) {
                    Text("Remove")
                }
            }
        }
    }

    private func addPerson() {
        persons.append(Person())
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
