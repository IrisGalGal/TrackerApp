//
//  ProjectDetailView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var project: Project
    @State private var update: ProjectUpdate?
    @State private var showEditFocus = false
    @State private var animationOffset = 200
    
    var body: some View {
        ZStack(content: {
            LinearGradient(colors: [Color("Navy"), Color("Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            LinearGradient(colors: [Color("Washed Blue").opacity(0), Color("Blue")], startPoint: .top , endPoint: .bottom)
                .frame(width: 2)
                .padding(.leading, -150)
            
            VStack{
                VStack(alignment: .leading, spacing: 13){
                    Text(project.name)
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    HStack(alignment: .center, spacing: 13){
                        Spacer()
                        StatBubbleView(title: "Hours", stat: project.hours, startColor: Color("Navy"), endColor: Color("Blue"))
                        StatBubbleView(title: "Hours", stat: Double(project.sessions), startColor: Color("Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Upadate", stat: Double(project.update.count), startColor: Color("Maroon"), endColor: Color("Purple"))
                        StatBubbleView(title: "Wins", stat: Double(project.wins), startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                    }
                    Text("My current focus is....")
                        .font(.featuredText)
                    HStack{
                        if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != ""){
                            Button {
                                completeMilestone()
                            } label: {
                                Image(systemName: "checkmark.square")

                            }

                        }
                        
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus ": project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                showEditFocus = true
                            }
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
                .padding()
                .background{
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                if project.update.count > 0{
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 27){
                            
                            let sortedArray = project.update.sorted(by: { u1,u2 in u1.date < u2.date })
                            
                            ForEach(Array(sortedArray.enumerated()), id: \.element){ index, update in
                                ProjectUpdateView(update: update)
                                    .animation(.easeOut.delay(TimeInterval(0.05) * Double(index)), value: animationOffset)
                                    .offset(y: CGFloat(animationOffset))
                                    
                                    .onTapGesture {
                                        
                                    }
                                    .onLongPressGesture {
                                        self.update = update
                                    }
                            }
                        }
                        .padding()
                        .padding(.bottom, 80)
                    }
                }else{
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Tap to add a new update") {
                            update = ProjectUpdate()
                        }
                        .buttonStyle(.bordered)
                        .foregroundStyle(.white)
                        .padding(.bottom, 100)
                        Spacer()
                    }
                    Spacer()
                }
            }
            
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        self.update = ProjectUpdate()
                    }, label: {
                        ZStack(content: {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 64)
                            Image("cross")
                        })
                    })
                    .padding([.leading, .top])
                    .padding(.bottom)
                    Spacer()
                    Button("Back"){
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background{
                    Color(.black)
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
        })
        .navigationBarBackButtonHidden(true)
        .sheet(item: $update) { update in
            let isEditMode = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            EditUpdateView(project: project, update: update, isEditMode: isEditMode)
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showEditFocus, content: {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
        })
        .onAppear {
            withAnimation {
                animationOffset = 0
            }
        }
    }
    
    func completeMilestone(){
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achived"
        update.summary = project.focus
        project.update.insert(update, at: 0)
        
        try? context.save()

        
        StatHelper.updateAdded(project: project, update: update)
        
        project.focus = ""
    }
}
