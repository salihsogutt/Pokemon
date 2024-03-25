//
//  UIViewController+.swift
//  Pokemon
//
//  Created by salih söğüt on 26.03.2024.
//

import UIKit

extension UIViewController {
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
