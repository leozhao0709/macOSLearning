//
//  PhotoCell.swift
//  photoMemories
//
//  Created by Lei Zhao on 11/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class PhotoCell: NSCollectionViewItem {

    private var selectedBorderWidth: CGFloat = 3
    private var selectedBorderColor = NSColor.blue.cgColor
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.view.layer?.borderWidth = selectedBorderWidth
                self.view.layer?.borderColor = selectedBorderColor
            } else {
                self.view.layer?.borderWidth = 0
            }
        }
    }
    
    override var highlightState: NSCollectionViewItem.HighlightState {
        didSet {
            if highlightState == .forSelection {
                self.view.layer?.borderWidth = selectedBorderWidth
                self.view.layer?.borderColor = selectedBorderColor
            }
            else if highlightState == .forDeselection {
                self.view.layer?.borderWidth = 0
            }
            // when release mouse, we should keep the correct border width
            else if highlightState == .none {
                if self.isSelected {
                    self.view.layer?.borderWidth = selectedBorderWidth
                } else {
                    self.view.layer?.borderWidth = 0
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
    }
    
}
