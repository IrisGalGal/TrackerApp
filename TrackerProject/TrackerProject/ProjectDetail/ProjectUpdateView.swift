//
//  ProjectUpdateView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x:0, y:5)
            
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(DataHelper.projectUpdateDate(inputDate: update.date))
                        .padding(.leading)
                    Spacer()
                    Text("\(String(Int(update.hours))) hours")
                        .padding(.trailing)
                }
                .padding(.vertical, 5)
                .background{
                    Color("Orchid")
                }
                Text(update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text(update.summary)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
