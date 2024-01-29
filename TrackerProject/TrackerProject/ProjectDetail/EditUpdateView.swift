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
                        .onChange(of: hours) { oldValue, newValue in
                            let num = Int(TextHelper.limitChars(input: hours, limit: 2)) ?? 0
                            hours = num > 24 ? "24": String(num)
                        }
                    
                    Button(isEditMode ? "Save": "Add"){
                        // TODO:
                        let hoursDifference = Double(hours)! - update.hours
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        if !isEditMode{
                            withAnimation {
                                project.update.insert(update, at: 0)
                                try? context.save()
                            }
                            StatHelper.updateAdded(project: project, update: update)
                        }else{
                            withAnimation {
                                StatHelper.updateEdit(project: project, hoursDifference: hoursDifference)
                            }
                        }
                        dismiss()
                    }
                    .background(Color.blue)
                    .buttonStyle(.borderedProminent)
                    .disabled(shouldDisable())
                    
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
                withAnimation {
                    project.update.removeAll(){ u in
                        u.id == update.id
                    }
                }
                
                try? context.save()
                
                StatHelper.updateDeleted(project: project, update: update)
                dismiss()
            }
        }
        .onAppear{
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
    private func shouldDisable() -> Bool{
        return headline.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || summary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || hours.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
