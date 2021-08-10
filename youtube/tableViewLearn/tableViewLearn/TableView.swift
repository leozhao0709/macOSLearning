//
// Created by Lei Zhao on 8/9/21.
//

import SwiftUI

struct TableView: NSViewRepresentable {
    @Binding var data: [Person]
    private let tableView = NSTableView()

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSScrollView()
//        let tableView = NSTableView()
        scrollView.documentView = tableView

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

        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator

        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        print("... update view..", data.count)
        tableView.reloadData()
        print(".....after reloadData...", tableView.numberOfRows)
    }

    func makeCoordinator() -> Coordinate {
        Coordinate(parent: self)
    }

    final class Coordinate: NSObject, NSTableViewDataSource, NSTableViewDelegate {
        var parent: TableView

        init(parent: TableView) {
            self.parent = parent
        }

        func numberOfRows(in tableView: NSTableView) -> Int {
            print("....numberOfRows...", parent.data.count)
            return parent.data.count
        }

        func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
            print("...objectValueFor...", parent.data.count)
            let p = parent.data[row]
            guard let identifier = tableColumn?.identifier.rawValue else {
                return nil
            }
            return p.value(forKeyPath: identifier)
        }
    }
}
