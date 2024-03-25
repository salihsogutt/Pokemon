//
//  AnasayfaTableViewCell.swift
//  Pokemon
//
//  Created by salih söğüt on 22.03.2024.
//

import UIKit
import Kingfisher

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var character: Character? {
        didSet {
            characterImage.kf.setImage(with: URL(string: character?.pokemon?.sprites?.frontShiny ?? ""))
            characterNameLabel.text = character?.name ?? ""
            layer.cornerRadius = 16
        }
    }
}
