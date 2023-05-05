//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no3")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            HeaderView(title: "Credits")

            Text("Sahil Behl")
                .foregroundColor(.primary)
                .fontWeight(.bold)

            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)



        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
