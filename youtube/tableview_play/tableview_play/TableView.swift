//
// Created by Lei Zhao on 4/28/22.
//

import SwiftUI

struct TableView<T: NSObject>: NSViewRepresentable {
    @Binding var items: [T]
    @Binding var selectedIndexSet: IndexSet?
//    var onSelectedRows: (_ indexSet: IndexSet?) -> Void

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSScrollView()
        print("----makeNSView---")
        scrollView.documentView = context.coordinator.tableView
        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        context.coordinator.parent = self
        print("----updateNSView---")
        context.coordinator.tableView.reloadData()
    }

    func makeCoordinator() -> Coordinator<T> {
        Coordinator(parent: self)
    }

    class Coordinator<T: NSObject>: NSObject, NSTableViewDataSource, NSTableViewDelegate {
        var parent: TableView
        let tableView = NSTableView()

        init(parent: TableView) {
            self.parent = parent
            super.init()
            let itemMirror = Mirror(reflecting: T())
            let itemProperties = itemMirror.children
            for property in itemProperties {
                if let label = property.label {
                    let identifier = NSUserInterfaceItemIdentifier(label)
                    let tableColumn = NSTableColumn(identifier: identifier)
                    tableColumn.title = label.capitalized
                    tableView.addTableColumn(tableColumn)
                }
            }
            tableView.allowsMultipleSelection = true
            tableView.dataSource = self
            tableView.delegate = self
        }

        func numberOfRows(in tableView: NSTableView) -> Int {
            parent.items.count
        }

        func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
            guard let identifier = tableColumn?.identifier else {
                return nil
            }
            return parent.items[row].value(forKey: identifier.rawValue)
        }

        func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
            guard let identifier = tableColumn?.identifier else {
                return
            }

            parent.items[row].setValue(object, forKey: identifier.rawValue)
        }

        func tableViewSelectionDidChange(_ notification: Notification) {
//            parent.onSelectedRows(tableView.selectedRowIndexes)
            parent.selectedIndexSet = tableView.selectedRowIndexes
        }
    }
}
