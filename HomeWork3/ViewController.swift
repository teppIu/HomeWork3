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
        
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
        
        setupRedLabel()
        setupGreenLabel()
        setupBlueLabel()
        
        setupRedColorValueLabel()
        setupGreenColorValueLabel()
        setupBlueColorValueLabel()
    }

   // MARK: - setting up sliders
    
    @IBAction func redSliderAction() {
        redColorValueLabel.text = String(round(100 * redSlider.value)/100)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenColorValueLabel.text = String(round(100 * greenSlider.value) / 100)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueColorValueLabel.text = String(round(100 * blueSlider.value) / 100)
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
        // MARK: - parameters of view
    
    
    private func setupColoredView() {
        coloredView.layer.cornerRadius = 10
    }
    
    // MARK: - parameters of color labels
    
    private func setupRedLabel() {
        redLabel.text = "Red"
        redLabel.font = UIFont.boldSystemFont(ofSize: 15)
        redLabel.textAlignment = .center
    }
    
    private func setupGreenLabel() {
        greenLabel.text = "Green"
        greenLabel.font = UIFont.boldSystemFont(ofSize: 15)
        greenLabel.textAlignment = .center
    }
    
    private func setupBlueLabel() {
        blueLabel.text = "Blue"
        blueLabel.font = UIFont.boldSystemFont(ofSize: 15)
        blueLabel.textAlignment = .center
    }
    
    // MARK: - parameters of labels responsible for the value
    
    private func setupRedColorValueLabel() {
        redColorValueLabel.text = String(redSlider.value)
        redColorValueLabel.font = redColorValueLabel.font.withSize(15)
        redColorValueLabel.textAlignment = .right
    }
    
    private func setupGreenColorValueLabel() {
        greenColorValueLabel.text = String(greenSlider.value)
        greenColorValueLabel.font = greenColorValueLabel.font.withSize(15)
        greenColorValueLabel.textAlignment = .right
    }
    
    private func setupBlueColorValueLabel() {
        blueColorValueLabel.text = String(blueSlider.value)
        blueColorValueLabel.font = blueColorValueLabel.font.withSize(15)
        blueColorValueLabel.textAlignment = .right
    }
    
    //MARK: - parameters of sliders
    
    private func setupRedSlider() {
        redSlider.value = 0
        redSlider.maximumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
    }
    
    private func setupGreenSlider() {
        greenSlider.value = 0
        greenSlider.maximumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
    }
    
    private func setupBlueSlider() {
        blueSlider.value = 0
        blueSlider.maximumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
    }
}


