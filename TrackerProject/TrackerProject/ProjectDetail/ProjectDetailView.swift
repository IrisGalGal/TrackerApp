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
                        StatBubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Blue"))
                        StatBubbleView(title: "Hours", stat: "34", startColor: Color("Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Hours", stat: "32", startColor: Color("Maroon"), endColor: Color("Purple"))
                        StatBubbleView(title: "Hours", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                    }
                    Text("My current focus is....")
                        .font(.featuredText)
                    HStack{
                        Image(systemName: "checkmark.square")
                        Text("Design the new website")
                            .font(.featuredText)
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
                ScrollView(showsIndicators: false){
                    VStack(spacing: 27){
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
            }
            
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        
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
    }
}
