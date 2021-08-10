//
//  tableViewLearnApp.swift
//  tableViewLearn
//
//  Created by Lei Zhao on 8/9/21.
//

import SwiftUI

@main
struct tableViewLearnApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .frame(minWidth: 480, minHeight: 300)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    init() {
        loadInjectionIIIInDebug()
    }

    func loadInjectionIIIInDebug() {
        #if DEBUG
            var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
            #if os(macOS)
                injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
            #elseif os(tvOS)
                injectionBundlePath = "\(injectionBundlePath)/tvOSInjection.bundle"
            #elseif os(iOS)
                injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
            #endif
            Bundle(path: injectionBundlePath)?.load()
        #endif
    }
}
