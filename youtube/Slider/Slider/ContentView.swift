//
//  ContentView.swift
//  Slider
//
//  Created by Lei Zhao on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValue: Float = 0
    
    var body: some View {
        VStack {
            Text(String(sliderValue))
            
            Slider(value: $sliderValue, in: 0...10, step: 1)
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
