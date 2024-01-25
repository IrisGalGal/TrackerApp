//
//  EditProjectView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/23/24.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var isEditMode: Bool
    var project: Project
    @State var projectName:String = ""
    @State private var showConfirmation: Bool = false
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit Projetc": "New Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack{
                    TextField("Project name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(isEditMode  ? "Save": "Add"){
                        // ADD project
                        if isEditMode{
                            project.name = projectName
                        }else{
                            project.name = projectName
                            context.insert(project)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    if isEditMode{
                        Button("Delete"){
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Realyy delete?", isPresented: $showConfirmation, titleVisibility: .automatic) {
            Button("Yes, delete it") {
                context.delete(project)
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
    }
}

