//
//  HomeViewModel.swift
//  Pokemon
//
//  Created by salih söğüt on 26.03.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    func reloadTablewView()
    func showAlert(message: String)
}

final class HomeViewModel {
    
    var delegate: HomeViewModelProtocol?
    var characterResponse = [Character]()
    
    func getPokemonList(){
        NetworkManager.shared.fetch(
            endpoint: "pokemon",
            method: .get,
            type: CharacterResponse.self
        ) { response in
            switch response {
            case .success(let success):
                DispatchQueue.main.async {
                    self.characterResponse = success.results ?? []
                    self.getPokemon()
                }
            case .failure(let failure):
                self.delegate?.showAlert(message: failure.localizedDescription)
            }
        }
    }
    
    func getPokemon(){
        for (index,item) in characterResponse.enumerated() {
            NetworkManager.shared.fetch(
                endpoint: "pokemon/" + (item.name ?? ""),
                method: .get,
                type: Pokemon.self
            ) { response in
                switch response {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.characterResponse[index].pokemon = success
                        self.delegate?.reloadTablewView()
                    }
                case .failure(let failure):
                    self.delegate?.showAlert(message: failure.localizedDescription)
                }
            }
        }
    }
}
