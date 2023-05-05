//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("lineCount") var lineCount = 1
    @State private var sliderValue = 1.0

    func update() {
        lineCount = Int(sliderValue)
    }

    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")

            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)

            Slider(value: Binding(
                get: {
                    return Double(lineCount)
                },
                set:
                    { newValue in
                        self.sliderValue = newValue
                        self.update()
                    }), in: 1...4, step: 1)
            .foregroundColor(.accentColor)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
