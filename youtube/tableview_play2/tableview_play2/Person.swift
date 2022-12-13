//
// Created by Lei Zhao on 11/28/22.
//

import Foundation

struct Person: Identifiable {
    var givenName: String
    var familyName: String
    var emailAddress: String
    let id = UUID()
}
