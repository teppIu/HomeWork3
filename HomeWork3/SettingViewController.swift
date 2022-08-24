//
//  ViewController.swift
//  HomeWork3
//
//  Created by Stefan Iurin on 05.08.2022.
//

import UIKit

class SettingViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    //MARK: - Public properties
    
    var delegate: ColorViewControllerDelegate!
    var color: UIColor!

    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(slider: redSlider, color: .red)
        setupSlider(slider: greenSlider, color: .green)
        setupSlider(slider: blueSlider, color: .blue)
        
        setupLabel(label: redLabel, with: "Red")
        setupLabel(label: greenLabel, with: "Green")
        setupLabel(label: blueLabel, with: "Blue")
        
        setupColorValueLabel(colorValueLabel: redColorValueLabel,
                             value: String(redSlider.value))
        setupColorValueLabel(colorValueLabel: greenColorValueLabel,
                             value: String(greenSlider.value))
        setupColorValueLabel(colorValueLabel: blueColorValueLabel,
                             value: String(blueSlider.value))
        
        setupColorTF(redTF, value: String(redSlider.value))
        setupColorTF(greenTF, value: String(greenSlider.value))
        setupColorTF(blueTF, value: String(blueSlider.value))
        
        coloredView.backgroundColor = color
        
        redTF.inputAccessoryView = addToolBar()
        blueTF.inputAccessoryView = addToolBar()
        greenTF.inputAccessoryView = addToolBar()
        
        
        
    }
   
    // MARK: - dismiss

    @IBAction func doneButton() {
        delegate.revealTheColor(color: coloredView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
   // MARK: - setting up sliders
    
    @IBAction func redSliderAction() {
        setupSliderAction(valueLabel: redColorValueLabel, textField: redTF,
                          slider: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        setupSliderAction(valueLabel: greenColorValueLabel, textField: greenTF,
                          slider: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        setupSliderAction(valueLabel: blueColorValueLabel, textField: blueTF,
                          slider: blueSlider)
    }
    
    // MARK: - private methods
    
    private func setupSliderAction(valueLabel: UILabel!, textField: UITextField!, slider: UISlider!) {
        valueLabel.text = String(round(100 * slider.value) / 100)
        textField.text = String(round(100 * slider.value) / 100)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func setupLabel(label: UILabel!, with title: String) {
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
    }

    
    private func setupColorValueLabel(colorValueLabel: UILabel!,
                                      value: String) {
        colorValueLabel.text = value
        colorValueLabel.font = colorValueLabel.font.withSize(15)
        colorValueLabel.textAlignment = .right
    }
    
    private func setupColorTF(_ colorTF: UITextField!, value: String) {
        colorTF.text = value
    }
    
    private func setupSlider(slider: UISlider!, color: UIColor) {
        slider.value = 0
        slider.minimumTrackTintColor = color
        slider.thumbTintColor = color
    }
}

// MARK: - Keyboard

extension SettingViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func addToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: self,
                                            action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(title: buttonTitle,
                                         style: .done,
                                         target: self,
                                         action: #selector(DidTapDone))
        
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        redTF.inputAccessoryView = toolBar
        greenTF.inputAccessoryView = toolBar
        blueTF.inputAccessoryView = toolBar
        
        return toolBar
    }
    
    @objc private func DidTapDone() {
        view.endEditing(true)
    }
}

//extension SettingViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//    }
//}
