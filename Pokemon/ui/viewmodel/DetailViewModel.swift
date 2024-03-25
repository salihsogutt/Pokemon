//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by salih söğüt on 26.03.2024.
//

import Foundation

protocol DetailViewModelProtocol {
    func updateUI()
    func showAlert(message: String)
}

final class DetailViewModel {
    var delegate: DetailViewModelProtocol?
    var pokemon:Pokemon!
    var pokemonDetail: PokemonDetail?
    
    func getDetail() {
        NetworkManager.shared.fetch(
            endpoint: pokemon.abilities?.first?.ability.url ?? "",
            method: .get,
            type: PokemonDetail.self,
            addBaseUrl: false
        ) { response in
            switch response {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonDetail = success
                    self.delegate?.updateUI()
                }
            case .failure(let failure):
                self.delegate?.showAlert(message: failure.localizedDescription)
            }
        }
    }
    
    func getImage() -> URL? {
        return URL(string: pokemon.sprites?.frontShiny ??  "")
    }
    
    func getDescription() -> String {
        for entry in pokemonDetail?.effectEntries ?? [] {
            if entry.language.name == "en" {                
                return entry.effect
            }
        }
        return ""
    }
    
}
