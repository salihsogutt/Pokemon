//
//  Pokemon.swift
//  Pokemon
//
//  Created by salih söğüt on 24.03.2024.
//

import Foundation

struct Pokemon: Codable {
    let name: String?
    let abilities: [Ability]?
    let sprites: Sprites?
}

struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct Species: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
