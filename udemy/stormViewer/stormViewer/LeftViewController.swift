//
//  LeftViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class LeftViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    override func loadView() {
        self.view = NSView()
        
        self.view.setFrameSize(NSSize(width: 100, height: 0))
    }
    
}
