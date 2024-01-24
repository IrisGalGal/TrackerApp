//
//  ProjectUpdateView.swift
//  TrackerProject
//
//  Created by Iris GalGal on 1/24/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x:0, y:5)
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("Thurdar , se")
                        .padding(.leading)
                    Spacer()
                    Text("9 hours")
                        .padding(.trailing)
                }
                .padding(.vertical, 5)
                .background{
                    Color("Orchid")
                }
                Text("Project ")
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse interdum consectetur libero id faucibus nisl. Ac auctor augue mauris augue neque gravida in fermentum et. Turpis egestas maecenas pharetra convallis posuere morbi. Dui sapien eget mi proin sed libero enim sed. At erat pellentesque adipiscing commodo elit at imperdiet dui. Et leo duis ut diam quam. Tincidunt tortor aliquam nulla facilisi. Lectus urna duis convallis convallis tellus id. Leo urna molestie at elementum eu facilisis sed. Sem fringilla ut morbi tincidunt augue interdum velit euismod in. Morbi tempus iaculis urna id. Quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Tortor consequat id porta nibh venenatis cras sed.")
                    .font(.smallHeadline)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateView()
}
