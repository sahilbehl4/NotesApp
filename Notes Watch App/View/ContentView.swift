//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property

    @AppStorage("lineCount") var lineCount = 1
    @State var notes: [Note] = []
    @State private var text: String = ""

    // MARK: - Function
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        return path[0]
    }

    func save() {
//        dump(notes)
        do {
            let data = try JSONEncoder().encode(notes)

            var url = getDocumentDirectory()
            url.append(path: "Notes")

            let result = FileManager.default.createFile(atPath: url.relativePath, contents: data)
            print(url.relativePath)
            print(result)
        } catch {
            print("Save data failed")
        }
    }

    func delete(for index: IndexSet) {
        withAnimation {
            if let index = index.first {
                notes.remove(at: index)
                save()
            }
        }
    }

    func load() {
        DispatchQueue.main.async {
            do {
                var url = getDocumentDirectory()
                url.append(path: "Notes")

                let data = try Data(contentsOf: url)

                let notes = try JSONDecoder().decode([Note].self, from: data)

                self.notes = notes
            } catch {
                print("load data failed")
            }
        }
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add new note", text: $text)
                    Button {

                        guard !text.isEmpty else {
                            return
                        }

                        let note = Note(id: UUID(), text: text)
                        notes.append(note)

                        text = ""

                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))

                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)

                } // HSTACK
                Spacer()

                if notes.count > 0 {
                    List {
                        ForEach(notes.indices, id: \.self) { index in
                            NavigationLink(destination: DetailView(note: notes[index], count: notes.count, index: index)) {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[index].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }.onDelete(perform: delete)
                        }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            } // VSTACK
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: load)
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let notes = [
            Note(id: UUID(), text: "Let's develop a new test"),
            Note(id: UUID(), text: "❤️")]
        return ContentView(notes: notes)
    }
}
