//
// Created by Lei Zhao on 8/9/21.
//

import SwiftUI

struct TableView: NSViewRepresentable {
    @Binding var data: [Person]
    var onSelectedRow: ((_ row: Int) -> Void)?
    var isEditingCell: ((_ isEditing: Bool) -> Void)?
    var onCompleteEditCell: ((_ row: Int, _ columnKey: String, _ stringValue: String) -> Void)?

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSScrollView()

        let tableView = context.coordinator.tableView

        scrollView.documentView = tableView

        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        context.coordinator.parent = self
        if !context.coordinator.isEditingCell {
            context.coordinator.tableView.reloadData()
        }
    }

    func makeCoordinator() -> Coordinate {
        Coordinate(parent: self)
    }

    final class Coordinate: NSObject, NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate {
        var parent: TableView
        var isEditingCell = false
        let tableView = NSTableView()

        init(parent: TableView) {
            self.parent = parent
            super.init()
            // get all model property as columns
            let personMirror = Mirror(reflecting: Person())
            let personProperties = personMirror.children
            for property in personProperties {
                if let label = property.label {
                    let identifier = NSUserInterfaceItemIdentifier(label)
                    let tableColumn = NSTableColumn(identifier: identifier)
                    tableColumn.title = label.capitalized
                    tableView.addTableColumn(tableColumn)
                }
            }

            tableView.delegate = self
            tableView.dataSource = self
        }

        func numberOfRows(in tableView: NSTableView) -> Int {
            parent.data.count
        }

//        func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//            guard let identifier = tableColumn?.identifier else {
//                return nil
//            }
//
//            return parent.data[row].value(forKey: identifier.rawValue.lowercased())
//        }
//
//        func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
//            print("......setObjectValue")
//        }


        func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
            guard let identifier = tableColumn?.identifier else {
                return nil
            }

            var textField = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTextField

            if textField == nil {
                textField = NSTextField()
                textField!.drawsBackground = false
                textField!.isBordered = false
                textField!.identifier = identifier
                textField!.delegate = self
                textField?.frame.size.height = tableView.rowHeight
            }

            textField?.stringValue = "\(parent.data[row].value(forKey: identifier.rawValue.lowercased())!)"
            return textField
        }

        func tableViewSelectionDidChange(_ notification: Notification) {
            parent.onSelectedRow?(tableView.selectedRow)
        }

        func controlTextDidBeginEditing(_ obj: Notification) {
            isEditingCell = true
            parent.isEditingCell?(true)
        }

        func controlTextDidEndEditing(_ obj: Notification) {
            guard let textField = obj.object as? NSTextField else {
                return
            }
            parent.onCompleteEditCell?(tableView.selectedRow, textField.identifier!.rawValue, textField.stringValue)
            isEditingCell = false
            parent.isEditingCell?(false)
        }


    }
}
