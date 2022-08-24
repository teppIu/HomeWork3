//
//  MainViewController.swift
//  HomeWork3
//
//  Created by Stefan Iurin on 23.08.2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func revealTheColor(color: UIColor)
}

class MainViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingViewController {
            view.backgroundColor = settingsVC.color
            settingsVC.delegate = self
        }
    }
}

extension MainViewController: ColorViewControllerDelegate {
    func revealTheColor(color: UIColor) {
        view.backgroundColor = color
    }
}

