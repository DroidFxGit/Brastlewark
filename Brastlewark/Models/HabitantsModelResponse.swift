//
//  HabitantsModelResponse.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 24/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

struct HabitantsModelResponse: Codable {
    let habitants: [GnomeModel]
    
    enum CodingKeys: String, CodingKey {
        case habitants = "Brastlewark"
    }
}

struct GnomeModel: Codable {
    let id: Int
    let name: String
    let thumbnail: String
    let age: Int
    let weight: Double
    let height: Double
    let hairColor: String
    let professions : [String]
    let friends: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, age, weight, height
        case hairColor = "hair_color"
        case professions, friends
    }
}


