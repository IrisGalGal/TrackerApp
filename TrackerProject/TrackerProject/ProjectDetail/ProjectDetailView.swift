//
//  ProjectDetailView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var project: Project
    var body: some View {
        VStack(content: {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            Button("Back"){
                
            }
        })
        
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
