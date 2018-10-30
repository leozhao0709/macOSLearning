//
//  MainWindowController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    lazy var mainWindow: NSWindow? = {
        let window = NSWindow(contentViewController:SplitViewController())
        window.title = "stormViewer"
        return window
    }()

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = mainWindow
        self.window?.center()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
