//
//  Note.swift
//  Notes Watch App
//
//  Created by Sahil Behl on 5/5/23.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}

