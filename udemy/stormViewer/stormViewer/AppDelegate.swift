//
//  AppDelegate.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/28/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindowController = {
        return MainWindowController()
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.mainWindowController.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

