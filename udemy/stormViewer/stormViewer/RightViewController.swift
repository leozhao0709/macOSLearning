//
//  RightViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa
import SnapKit

class RightViewController: NSViewController {
    
    weak var imageView: NSImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let imageView = NSImageView()
        self.view.addSubview(imageView)
        self.imageView = imageView
        
        imageView.setContentCompressionResistancePriority(NSLayoutConstraint.Priority.init(1), for: NSLayoutConstraint.Orientation.horizontal)
        imageView.setContentCompressionResistancePriority(NSLayoutConstraint.Priority.init(1), for: NSLayoutConstraint.Orientation.vertical)
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    override func loadView() {
        self.view = NSView()
        self.view.setFrameSize(NSSize(width: 380, height: 300))
    }
    
    func setupImage(name: String) {
        self.imageView?.image = NSImage(named: name)
    }
}
