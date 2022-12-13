//
//  ContentView.swift
//  tableview_play2
//
//  Created by Lei Zhao on 11/28/22.
//
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var personViewModel: PersonViewModel = PersonViewModel()
    @State private var sortOrder = [KeyPathComparator(\Person.givenName)]
    @State private var selectedPeople = Set<Person.ID>()

    var body: some View {
        Table(personViewModel.persons, selection: $selectedPeople,sortOrder: $sortOrder) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail address", value: \.emailAddress)
        }
                .onChange(of: sortOrder) {
                    personViewModel.persons.sort(using: $0)
                }
                .onChange(of: selectedPeople) { selection in
                    print(selection)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
