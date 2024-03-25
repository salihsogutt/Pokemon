//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by salih söğüt on 26.03.2024.
//

import Foundation

// MARK: - PokemonDetail
struct PokemonDetail: Codable {
    //let effectChanges: [JSONAny]
    let effectEntries: [EffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
    let generation: Species
    let id: Int
    let isMainSeries: Bool
    let name: String
    let names: [Name]
    let pokemon: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case isMainSeries = "is_main_series"
        case name, names, pokemon
    }
}

// MARK: - EffectEntry
struct EffectEntry: Codable {
    let effect: String
    let language: Species
    let shortEffect: String
    
    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, versionGroup: Species
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}

// MARK: - Name
struct Name: Codable {
    let language: Species
    let name: String
}

