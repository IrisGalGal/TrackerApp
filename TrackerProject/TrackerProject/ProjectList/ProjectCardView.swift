//
//  ProjectCardView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/22/24.
//

import SwiftUI

struct ProjectCardView: View {
    var project : Project
    var body: some View {
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)
            VStack(alignment: .leading, content: {
                Text(project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: 13){
                    Spacer()
                    StatBubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Blue"))
                    StatBubbleView(title: "Hours", stat: "34", startColor: Color("Green"), endColor: Color("Lime"))
                    StatBubbleView(title: "Hours", stat: "32", startColor: Color("Maroon"), endColor: Color("Purple"))
                    StatBubbleView(title: "Hours", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                    Spacer()
                }
                Text("My current focus is ...")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                Text("design the new website")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                    .bold()
            })
            .padding()
        }
    }
}

#Preview {
    ProjectCardView(project: Project())
}
