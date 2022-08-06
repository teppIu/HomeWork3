//
//  ViewController.swift
//  HomeWork3
//
//  Created by Stefan Iurin on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColoredView()
        
        setupSlider(slider: redSlider, color: .red)
        setupSlider(slider: greenSlider, color: .green)
        setupSlider(slider: blueSlider, color: .blue)
        
        setupLabel(label: redLabel, with: "Red")
        setupLabel(label: greenLabel, with: "Green")
        setupLabel(label: blueLabel, with: "Blue")
        
        setupColorValueLabel(colorValueLabel: redColorValueLabel, value: String(redSlider.value))
        setupColorValueLabel(colorValueLabel: greenColorValueLabel, value: String(greenSlider.value))
        setupColorValueLabel(colorValueLabel: blueColorValueLabel, value: String(blueSlider.value))

    }

   // MARK: - setting up sliders
    
    @IBAction func redSliderAction() {
        setupSliderAction(valueLabel: redColorValueLabel, slider: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        setupSliderAction(valueLabel: greenColorValueLabel, slider: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        setupSliderAction(valueLabel: blueColorValueLabel, slider: blueSlider)
    }
    
    // MARK: - private methods
    
    private func setupSliderAction(valueLabel: UILabel!, slider: UISlider!) {
        valueLabel.text = String(round(100 * slider.value) / 100)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func setupColoredView() {
        coloredView.layer.cornerRadius = 10
    }
    
    
    private func setupLabel(label: UILabel!, with title: String) {
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
    }

    
    private func setupColorValueLabel(colorValueLabel: UILabel!, value: String) {
        colorValueLabel.text = value
        colorValueLabel.font = redColorValueLabel.font.withSize(15)
        colorValueLabel.textAlignment = .right
    }
    
    
    private func setupSlider(slider: UISlider!, color: UIColor) {
        slider.value = 0
        slider.minimumTrackTintColor = color
        slider.thumbTintColor = color
    }
}


