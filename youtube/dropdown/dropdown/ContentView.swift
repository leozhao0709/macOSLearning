//
//  ContentView.swift
//  dropdown
//
//  Created by Lei Zhao on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var options = ["op1", "op2", "op3"]
    @State var selectedOption = "op1"
    @State var text = ""

    var body: some View {
        Picker("", selection: $selectedOption) {
            ForEach(options, id: \.self) {
                Text($0)
            }
        }
          .pickerStyle(MenuPickerStyle())
          .padding()

        HStack {
            TextField("Add a new option", text: $text)
            Button("Add") {
                options.append(text)
                text = ""
            }
        }
        .padding()

        Text("Selected option: \(selectedOption)")

        Image("2")
            .resizable()
            .frame(width: 200, height: 100)
        Spacer()
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
