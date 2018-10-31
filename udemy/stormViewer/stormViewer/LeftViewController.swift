//
//  LeftViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa
import SnapKit

let columnCellIdentifier = "column1Identifier"

class LeftViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    weak var tableView: NSTableView?
    lazy var photos: [String] = {
        let res = Bundle.main.path(forResource: "photos.plist", ofType: nil)
        
        let temp = NSArray(contentsOfFile: res!)
        return temp as! [String]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
        let tableView = NSTableView()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
        tableView.backgroundColor = NSColor.clear
        
        // add column
        let tableViewColumn = NSTableColumn()
        tableView.headerView = nil
        tableView.addTableColumn(tableViewColumn)
        
        // add scroll container
        let tableViewContainer = NSScrollView()
        tableViewContainer.documentView = tableView
        tableViewContainer.allowsMagnification = true
        tableViewContainer.hasVerticalScroller = true
        tableViewContainer.drawsBackground = false
        self.view.addSubview(tableViewContainer)
        
        tableViewContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

    }
    
    override func loadView() {
        self.view = NSView()
        self.view.setFrameSize(NSSize(width: 100, height: 300))
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.photos.count;
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier), owner: self)

        if cellView == nil {
            cellView = NSTextField()
            (cellView as! NSTextField).isBordered = false
            (cellView as! NSTextField).drawsBackground = false
            cellView?.identifier = NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier)
        }
        
        (cellView as! NSTextField).stringValue = self.photos[row]
        
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 44
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let splitVC = self.parent as? SplitViewController else { return }
        
        if let rightViewVC = splitVC.children[1] as? RightViewController {
            rightViewVC.setupImage(name: self.photos[self.tableView!.selectedRow])
        }
    }
    
}
