//
//  Project.swift
//  DBProjectTracker
//
//  Created by Iris GalGal on 1/22/24.
//

import Foundation
import SwiftData

@Model
class Project{
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var update: [ProjectUpdate] = [ProjectUpdate]()
    var hours: Double = 0
    var sessions: Int = 0
    var wins : Int = 0
    
    init() {
        id = UUID().uuidString
    }
}
