//
//  ViewController.swift
//  tableViewLearn2
//
//  Created by Lei Zhao on 8/10/21.
//
//

import Cocoa


class ViewController: NSViewController, NSTableViewDataSource {

    var tableView: NSTableView?
    var data = [1, 2, 3, 4]

//    override func loadView() {
//        view = NSView() // any view of your choice
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = NSScrollView()
        scrollView.hasVerticalScroller = true
        scrollView.frame = CGRect.zero
        scrollView.frame.size = CGSize(width: 300, height: 200)
        let tableView = NSTableView()
        tableView.dataSource = self
        let col1 = NSTableColumn(identifier: .init("col1"))
        col1.width = 200
        tableView.addTableColumn(col1)
        tableView.backgroundColor = .blue
        tableView.frame.size = CGSize(width: 300, height: 200)
        tableView.frame = .zero
        self.tableView = tableView
        scrollView.documentView = tableView
        view.addSubview(scrollView)

        let btn = NSButton(title: "Add", target: self, action: #selector(AddNum))
        view.addSubview(btn)
    }

    @objc
    func AddNum() {
        data.append(5)
        tableView?.reloadData()
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        print("...numOfRows...", data.count)
        return data.count
    }

    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        print("...objectValueFor...", data.count)
        let p = data[row]
        guard let identifier = tableColumn?.identifier.rawValue else {
            return nil
        }
        return p
    }

    func tableView(_ tableView: NSTableView, setObjectValue object: String?, for tableColumn: NSTableColumn?, row: Int) {
        data[row] = Int(object!)!
    }

//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        guard let identifier = tableColumn?.identifier else {
//            return nil
//        }
//
//        guard let cell = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView else {
//            let cell = NSTableCellView()
//            let textField = NSTextField(string: "\(data[row])")
//            textField.drawsBackground = false
//            textField.isBordered = false
//            textField.frame.size.width = tableColumn!.width
//            cell.identifier = identifier
//            cell.addSubview(textField)
//            return cell
//        }
//
//        cell.textField?.stringValue = "\(data[row])"
//        return cell
//    }


    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }


}
