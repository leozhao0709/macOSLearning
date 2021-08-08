//
//  ContentView.swift
//  macOsBasic
//
//  Created by Lei Zhao on 8/6/21.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("label1")
              .frame(maxWidth: .infinity)
              .background(Color.red)
              .padding(20)
                .padding(.top, 30)

            Spacer()

            Button("Hello World"){
                print("clicked!!!")
            }
            .padding(.bottom)
        }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
