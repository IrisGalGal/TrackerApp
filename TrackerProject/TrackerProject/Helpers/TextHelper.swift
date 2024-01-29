//
//  TextHelper.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/26/24.
//

import Foundation

struct TextHelper{
    static func convertStat(input: Double) -> String{
        switch (input){
        case let stat where input > 1000:
            let dividedStat = stat/1000
            return "\(round(dividedStat * 10)/10)"
        default:
            return String(Int(input))
        }
        
    }
    static func limitChars(input: String, limit: Int) -> String{
        if input.count > limit{
            return String(input.prefix(limit))
        }
        return input
    }
}
