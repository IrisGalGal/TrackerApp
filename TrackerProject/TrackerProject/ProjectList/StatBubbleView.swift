//
//  StatBubbleView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/22/24.
//

import Foundation
import SwiftUI

struct StatBubbleView: View{
    var title: String
    var stat: Double
    
    var startColor: Color
    var endColor: Color
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [startColor,endColor], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack{
                Text(title)
                    .font(.captionText)
                Text(TextHelper.convertStat(input: stat))
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView(title: "Hours", stat: 290, startColor: Color("Navy"), endColor: Color("Blue"))
}
