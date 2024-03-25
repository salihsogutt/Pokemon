//
//  DetayVC.swift
//  Pokemon
//
//  Created by salih söğüt on 22.03.2024.
//

import UIKit

final class DetailVC: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureVC()
        configureImage()
        viewModel.getDetail()
    }
    
    private func configureVC() {
        characterImage.layer.cornerRadius = 15
        detailView.layer.cornerRadius = 15
        title =  viewModel.pokemon.name
        characterNameLabel.text = viewModel.pokemon.name                
    }
    
    private func configureImage() {        
        if let imageUrl = viewModel.getImage() {
            self.characterImage.kf.setImage(with: imageUrl)
        }
    }
}

extension DetailVC: DetailViewModelProtocol {
    func showAlert(message: String) {
        presentAlert(message: message)
    }
    
    func updateUI() {
        let description = viewModel.getDescription()
        desriptionLabel.text = description
    }
}
