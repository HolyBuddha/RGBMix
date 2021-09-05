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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
