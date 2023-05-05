//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String

    init(title: String = "") {
        self.title = title
    }

    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Header")

            HeaderView()
        }
    }
}
