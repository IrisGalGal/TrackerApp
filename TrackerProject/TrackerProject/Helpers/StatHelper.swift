//
//  StatHelper.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/26/24.
//

import Foundation
import SwiftUI

struct StatHelper{
    
    static func updateAdded(project: Project, update: ProjectUpdate){
        //Change hours
        project.hours += update.hours
        //Change wins
        if update.updateType == .milestone{
            project.wins += 1
        }
        //Change sessions
        let sortedUpdates = project.update.sorted { u1,u2 in
            u1.date > u2.date
        }
        if sortedUpdates.count >= 2{
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            if !Calendar.current.isDate(date1, inSameDayAs: date2){
                project.sessions += 1
            }
        }else{
            project.sessions += 1
        }
    }
    
    static func updateDeleted(project: Project, update: ProjectUpdate){
        project.hours -= update.hours
        
        if update.updateType == .milestone{
            project.wins -= 1
        }
        
        let sameDayUpdates = project.update.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        if sameDayUpdates.count == 0{
            project.sessions -= 1
        }
    }
    static func updateEdit(project: Project, hoursDifference: Double){
        project.hours += hoursDifference
    }
}
