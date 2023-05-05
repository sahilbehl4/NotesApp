//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Property

    let note: Note
    let count: Int
    let index: Int

    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView()
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()

            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented = true
                    }

                Spacer()

                Text("\(count) / \(index)")

                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented = true
                    }
            }
            .foregroundColor(.secondary)
            .sheet(isPresented: $isCreditsPresented) {
                CreditsView()
            }
            .sheet(isPresented: $isSettingsPresented) {
                SettingsView()
            }
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            note: Note(id: UUID(), text: "This is a test of detailed view"),
            count: 5,
            index: 2
        )
    }
}
