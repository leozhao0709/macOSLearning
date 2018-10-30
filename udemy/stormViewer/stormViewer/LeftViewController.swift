//
//  LeftViewController.swift
//  stormViewer
//
//  Created by Lei Zhao on 10/29/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

let columnCellIdentifier = "column1Identifier"

class LeftViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    weak var tableView: NSTableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let tableView = NSTableView(frame: self.view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
        
        // add column
        let tableViewColumn = NSTableColumn()
        tableView.headerView = nil
        tableView.addTableColumn(tableViewColumn)
        
        // add scroll container
        let tableViewContainer = NSScrollView(frame: self.view.frame)
        tableViewContainer.documentView = tableView
        tableViewContainer.allowsMagnification = true
        tableViewContainer.hasVerticalScroller = true
        self.view.addSubview(tableViewContainer)

    }
    
    override func loadView() {
        self.view = NSView()
        self.view.setFrameSize(NSSize(width: 100, height: 300))
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier), owner: self)
        
        if cellView == nil {
            cellView = NSTextField(labelWithString: "Hello World! \(row)")
            cellView?.identifier = NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier)
        }
        
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 44
    }
    
}
