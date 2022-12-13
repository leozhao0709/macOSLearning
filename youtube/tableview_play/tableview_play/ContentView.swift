//
//  ContentView.swift
//  tableview_play
//
//  Created by Lei Zhao on 4/28/22.
//
//

import SwiftUI

@objcMembers
class Person: NSObject, Identifiable {
    var givenName: String
    var familyName: String
    let id = UUID().uuidString

    override init() {
        givenName = ""
        familyName = ""
        super.init()
    }

    init(givenName: String, familyName: String) {
        self.givenName = givenName
        self.familyName = familyName
        super.init()
    }
}

private var people = [
    Person(givenName: "Juan", familyName: "Chavez"),
    Person(givenName: "Mei", familyName: "Chen"),
    Person(givenName: "Tom", familyName: "Clark"),
    Person(givenName: "Gita", familyName: "Kumar"),
]

struct ContentView: View {
    @State var persons: [Person] = people;
    @State var selection = Set<Person.ID>();
    @State var selectedIndexSet: IndexSet? = nil;

    var body: some View {
        VStack {
//            Table(persons, selection: $selection) {
//                TableColumn("Given Name") {
//                    Text($0.givenName ?? "lei")
//                }
//                TableColumn("Family Name", value: \.familyName!)
//            }
            TableView(items: $persons, selectedIndexSet: $selectedIndexSet)

            HStack {
                Button("Add new person") {
                    addNewPerson()
                }
                Button("Remove selected persons") {
                    removeSelectedPersons()
                }
            }
        }
    }

    func addNewPerson() {
        let p = Person(givenName: "Yoda", familyName: "Hah")
        persons.append(p)
        print(persons)
    }

    func removeSelectedPersons() {
//        persons = persons.filter { person in
//            !selection.contains(person.id)
//        }
        guard let selectedIndexSet = selectedIndexSet else {
            return
        }
        persons.remove(atOffsets: selectedIndexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
