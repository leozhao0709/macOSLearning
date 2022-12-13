//
//  DatePickApp.swift
//  DatePick
//
//  Created by Lei Zhao on 8/7/21.
//

import SwiftUI

@main
struct DatePickApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
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
