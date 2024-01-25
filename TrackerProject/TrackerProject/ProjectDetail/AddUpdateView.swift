//
//  AddUpdateView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct AddUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    @State var headline:String = ""
    @State var summary:String = ""
    @State var hours:String = ""

    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text("New Update")
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
                    
                    Button("Save"){
                        // TODO:
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.update.insert(update, at: 0)
                        
                        dismiss()
                    }
                    .background(Color.blue)
                    .buttonStyle(.borderedProminent)
                }
                .background(Color.white)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}