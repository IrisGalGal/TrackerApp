//
//  ContentView.swift
//  DBProjectTracker
//
//  Created by Iris GalGal on 1/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var newProject: Project?
    @Query private var projects: [Project]
    @State private var selectedProject: Project?
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Projects")
                        .font(Font.screenHeading)
                        .foregroundStyle(Color.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 26){
                            ForEach(projects){ p in
                                ProjectCardView(project: p)
                                    .onTapGesture {
                                        selectedProject = p
                                    }
                                    .onLongPressGesture {
                                        newProject = p
                                    }
                            }
                            
                        }
                    }
                }
                .padding()
                
                VStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            self.newProject = Project()
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(width: 65)
                                    .foregroundColor(.black)
                                Image("cross")
                            }
                        })
                        Spacer()
                        
                    }
                }
                .padding(.leading)
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
        }
        .sheet(item: $newProject) { project in
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditProjectView(isEditMode: isEdit, project: project)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

#Preview {
    ContentView()
}
