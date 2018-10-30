//
//  RightViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class RightViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.yellow.cgColor
    }
    
    override func loadView() {
        self.view = NSView()
    }
}
