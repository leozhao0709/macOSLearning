//
//  SplitViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.splitView.delegate = self
        
        self.addChild(LeftViewController())
        self.addChild(RightViewController())
        
        self.splitView.adjustSubviews()
        
//        self.splitView.dividerStyle = .thin
//        self.splitView.isVertical = false
        
    }
    
    override func loadView() {
        super.loadView()
        self.view.setFrameSize(NSSize(width: 480, height: 300))
    }
    
    override func splitViewWillResizeSubviews(_ notification: Notification) {
        print(notification)
    }
    
}
