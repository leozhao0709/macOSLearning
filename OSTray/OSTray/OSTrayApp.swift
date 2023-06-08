//
//  OSTrayApp.swift
//  OSTray
//
//  Created by Lei Zhao on 6/2/23.
//

import SwiftUI

@main
struct OSTrayApp: App {
    @State var currNum = "1"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Customize Menu") {
                Button("One") {
                    currNum = "1"
                }
                .keyboardShortcut("1")
                
                Button("Two") {
                    currNum = "2"
                }
                .keyboardShortcut("2")
                
                Button("Three") {
                    currNum = "3"
                }
                .keyboardShortcut("3")
                
                Divider()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }.keyboardShortcut("q")
            }
        }
        
        MenuBarExtra(currNum, systemImage: "\(currNum).circle") {
//            Button("One") {
//                currNum = "1"
//            }
//            .keyboardShortcut("1")
//
//            Button("Two") {
//                currNum = "2"
//            }
//            .keyboardShortcut("2")
//
//            Button("Three") {
//                currNum = "3"
//            }
//            .keyboardShortcut("3")
        }
        
        
    }
}
