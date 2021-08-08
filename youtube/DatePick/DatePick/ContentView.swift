//
//  ContentView.swift
//  DatePick
//
//  Created by Lei Zhao on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var label = "Enter a name and date"
    @State var name = ""
    @State var date = Date()
    var body: some View {
        VStack {
            Text(label)
              .padding()
            HStack {
                TextField("Name", text: $name)
                DatePicker("", selection: $date, displayedComponents: [.date])
            }.padding()

            Button("Show Me!") {
                label = "\(name) was here at \(date)"
            }
                .buttonStyle(MyButtonStyle())
                .background(Color.yellow)
        }

    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)

    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .frame(minWidth: 480, minHeight: 300)
    }

    #if DEBUG
        @objc class func injected() {
            NSApplication.shared.windows.first?.contentViewController = NSHostingController(rootView: ContentView_Previews.previews)
        }
    #endif
}
