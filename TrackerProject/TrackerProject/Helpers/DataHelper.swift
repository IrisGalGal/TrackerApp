//
//  DataHelper.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import Foundation

struct DataHelper{
    
    static func projectUpdateDate(inputDate: Date) -> String{
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: inputDate)
    }
}
