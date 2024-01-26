//
//  AddUpdateView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    
    @State var headline:String = ""
    @State var summary:String = ""
    @State var hours:String = ""
    @State var showConfirmation = false
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit New": "New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                TextField("Headline", text: $headline)
                    .background(Color.white)
                TextField("Summary", text: $summary, axis: .vertical)
                    .background(Color.white)

                HStack{
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                    
                    Button(isEditMode ? "Save": "Add"){
                        // TODO:
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        if !isEditMode{
                            project.update.insert(update, at: 0)
                        }
                        dismiss()
                    }
                    .background(Color.blue)
                    .buttonStyle(.borderedProminent)
                    
                    if isEditMode{
                        Button("Delete") {
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                .background(Color.white)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Really delete the update ? ", isPresented: $showConfirmation) {
            Button("yes, delete it") {
                project.update.removeAll(){ u in
                    u.id == update.id
                }
                dismiss()
            }
        }
        .onAppear{
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
}
