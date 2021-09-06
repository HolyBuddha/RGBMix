//
//  ViewController.swift
//  RGBMix
//
//  Created by Vladimir Izmaylov on 05.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
   func changeColor(color : UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.bgView = view.backgroundColor
        settingVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
