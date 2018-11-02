//
//  ViewController.swift
//  GridBrowser
//
//  Created by Lei Zhao on 10/31/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa
import WebKit
import SnapKit

class ViewController: NSViewController, WKNavigationDelegate {

    weak var rowStackView: NSStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rowStackView = NSStackView()
        rowStackView.orientation = .vertical
        rowStackView.distribution = .fillEqually
        self.view.addSubview(rowStackView)
        self.rowStackView = rowStackView
        
        rowStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        let colStackView = NSStackView(views: [self.makeWebView()])
        colStackView.distribution = .fillEqually
        rowStackView.addArrangedSubview(colStackView)
    }
    
    func makeWebView() -> NSView {
        
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.wantsLayer = true
        webView.load(URLRequest(url: URL(string:"https://www.apple.com")!))
        
        return webView
    }
    
    @IBAction func urlEntered(_ sender: NSTextField) {
        print("urlEntered...")
    }
    
    @IBAction func navigationClicked(_ sender: NSSegmentedControl) {
        print("navigation clicked...")
    }
    
    @IBAction func adjustRow(_ send: NSSegmentedControl) {
        if send.selectedSegment == 0 {
            // add a row
            let columnCount = (self.rowStackView!.arrangedSubviews.last! as! NSStackView).arrangedSubviews.count
            let viewArray = (0..<columnCount).map({ _ in
                self.makeWebView()
            })
            let newRow = NSStackView(views: viewArray)
            newRow.distribution = .fillEqually
            self.rowStackView?.addArrangedSubview(newRow)
        } else {
            // delete a row
            guard (self.rowStackView!.arrangedSubviews.count) > 1 else {return}
            let lastRow = self.rowStackView!.arrangedSubviews.last as! NSStackView
            
            for col in lastRow.arrangedSubviews {
                col.removeFromSuperview()
            }
            self.rowStackView?.removeArrangedSubview(lastRow)
        }
    }
    
    @IBAction func adjustCol(_ send: NSSegmentedControl) {
        if send.selectedSegment == 0 {
            for row in (self.rowStackView!.subviews as! [NSStackView]) {
                row.addArrangedSubview(makeWebView())
            }
        } else {
            // delte a column
            let lastColumn = self.rowStackView!.subviews.last! as! NSStackView
            guard lastColumn.arrangedSubviews.count > 1 else { return }
            
            for row in self.rowStackView!.arrangedSubviews as! [NSStackView] {
                if let lastColumn = row.arrangedSubviews.last {
                    row.removeArrangedSubview(lastColumn)
                    lastColumn.removeFromSuperview()
                }
            }
        }
    }

}

