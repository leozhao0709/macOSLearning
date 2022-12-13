//
//  ContentView.swift
//  Select(Picker)
//
//  Created by Lei Zhao on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @State(initialValue: 0) private var type
    @State var types = ["生活用品", "数码家电", "服饰", "ios学习"]
    @State var newOption = ""
    
    var body: some View {
        VStack {
            Picker("Select", selection: $type) {
                ForEach(types.indices, id: \.self) {
                        Text(types[$0])
                      }
            }
            
            HStack {
                TextField("", text: $newOption)
                
                Button("Add") {
                    types.append(newOption)
                    newOption = ""
                }
            }
            Text(types[type])
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
