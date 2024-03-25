//
//  ViewController.swift
//  Pokemon
//
//  Created by salih söğüt on 21.03.2024.
//

import UIKit

final class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureTableView()
        viewModel.getPokemonList()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        let character = viewModel.characterResponse[indexPath.row]
        cell.character = character
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 140
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = viewModel.characterResponse[indexPath.row].pokemon
        performSegue(withIdentifier: "toDetail", sender: pokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let pokemon = sender as? Pokemon {
                let detailVC = segue.destination as! DetailVC
                detailVC.viewModel.pokemon = pokemon
            }
        }
    }
}

//MARK: HomeViewModelProtocol
extension HomeVC: HomeViewModelProtocol {
    func showAlert(message: String) {
        presentAlert(message: message)
    }
    
    func reloadTablewView() {
        tableView.reloadData()
    }    
}
