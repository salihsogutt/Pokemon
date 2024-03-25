//
//  Character.swift
//  Pokemon
//
//  Created by salih söğüt on 22.03.2024.
//

import Foundation


struct CharacterResponse: Codable {
    let results: [Character]?
}

struct Character: Codable {
    let name: String?
            
    var pokemon: Pokemon?
}
