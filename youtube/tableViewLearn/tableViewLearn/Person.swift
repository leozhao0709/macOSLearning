//
// Created by Lei Zhao on 8/9/21.
//

import Foundation

@objcMembers
class Person: NSObject {
    var name: String
    var age: Int

    override init() {
        name = "Yoda"
        age = 30
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
