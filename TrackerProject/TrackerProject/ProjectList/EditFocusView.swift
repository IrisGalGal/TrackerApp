//
//  EditFocusView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct EditFocusView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    @State var focus: String = ""
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                HStack{
                    
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save"){
                        // TODO:
                        project.focus = focus
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.blue)
                    .tint(.white)
                    .disabled(focus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
