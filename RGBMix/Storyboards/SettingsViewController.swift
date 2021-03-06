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
    
    var delegate: SettingsViewControllerDelegate!
    var bgView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForShowingColor.layer.cornerRadius = 20
        
        redColorValue.text = String(format: "%.2f", redColorSlider.value)
        greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
        blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
        
        redColorTF.text = redColorValue.text
        greenColorTF.text = greenColorValue.text
        blueColorTF.text = blueColorValue.text
        
        
        updateViewColor()
        colorMixFromSliders()
        colorMixFromTextFileds()
    }

    @IBAction func DoneButtonWhenPressed() {
        delegate.changeColor(color: bgView)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        colorMixFromSliders()
        updateViewColor()
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
        colorMixFromTextFileds()
        updateViewColor()
        switch sender {
        case redColorTF:
            let redColorTFValue = Float(redColorTF.text ?? "0") ?? 0
            redColorSlider.value = redColorTFValue
            redColorValue.text = String(redColorSlider.value)
        case greenColorTF:
            let greenColorTFValue = Float(greenColorTF.text ?? "0") ?? 0
            greenColorSlider.value = greenColorTFValue
            greenColorValue.text = String(greenColorSlider.value)
        default:
            let blueColorTFValue = Float(blueColorTF.text ?? "0") ?? 0
            blueColorSlider.value = blueColorTFValue
            blueColorValue.text = String(blueColorSlider.value)
        }
    }
    
    private func colorMixFromSliders() {
            bgView = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    private func colorMixFromTextFileds() {
        let redColorTFValue = Float(redColorTF.text ?? "0") ?? 0
        let greenColorTFValue = Float(greenColorTF.text ?? "0") ?? 0
        let blueColorTFValue = Float(blueColorTF.text ?? "0") ?? 0
        bgView = UIColor(
            red: CGFloat(redColorTFValue),
            green: CGFloat(greenColorTFValue),
            blue: CGFloat(blueColorTFValue),
            alpha: 1
        )
    }
    
    private func updateViewColor() {
        viewForShowingColor.backgroundColor = bgView
        let ciColor = CIColor(color: bgView)
                
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
        
        redColorValue.text = String(format: "%.2f", redColorSlider.value)
        greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
        blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
        
        redColorTF.text = redColorValue.text
        greenColorTF.text = greenColorValue.text
        blueColorTF.text = blueColorValue.text
    }

}
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redColorTF {
            greenColorTF.becomeFirstResponder()
        } else if textField == greenColorTF {
            blueColorTF.becomeFirstResponder()
        } else {
            redColorTF.becomeFirstResponder()
        }
        return true
    }
}
