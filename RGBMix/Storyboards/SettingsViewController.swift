//
//  SettingsVC.swift
//  RGBMix
//
//  Created by Vladimir Izmaylov on 05.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    @IBOutlet var viewForShowingColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForShowingColor.layer.cornerRadius = 20
        
        redColorValue.text = String(format: "%.2f", redColorSlider.value)
        greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
        blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
        
        redColorTF.text = redColorValue.text
        greenColorTF.text = greenColorValue.text
        blueColorTF.text = blueColorValue.text
        
        colorMixFromSliders()
    }

    @IBAction func DoneButtonWhenPressed() {
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        colorMixFromSliders()
        switch sender {
        case redColorSlider:
            redColorValue.text = String(format: "%.2f", redColorSlider.value)
            redColorTF.text = redColorValue.text
        case greenColorSlider:
            greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
            greenColorTF.text = greenColorValue.text
        default:
            blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
            blueColorTF.text = blueColorValue.text
        }
    }
    
    @IBAction func textFieldEdit (_ sender: UITextField) {
        switch sender {
        case redColorTF:
            let redColorTFValue = Float(redColorTF.text ?? "") ?? 0
            redColorSlider.value = redColorTFValue
            redColorValue.text = String(redColorSlider.value)
        case greenColorTF:
            let greenColorTFValue = Float(greenColorTF.text ?? "") ?? 0
            greenColorSlider.value = greenColorTFValue
            greenColorValue.text = String(greenColorSlider.value)
        default:
            let blueColorTFValue = Float(blueColorTF.text ?? "") ?? 0
            blueColorSlider.value = blueColorTFValue
            blueColorValue.text = String(blueColorSlider.value)
        }
    }
    
    private func colorMixFromSliders() {
        viewForShowingColor.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
}


extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
