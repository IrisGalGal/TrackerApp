//
//  ContentView.swift
//  DBProjectTracker
//
//  Created by Iris GalGal on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Projects")
                    .font(Font.screenHeading)
                    .foregroundStyle(Color.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 26){
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()

                    }
                }
            }
            .padding()
            
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        
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
    }
}

#Preview {
    ContentView()
}
