//
//  MaleBFPViewController.swift
//  FitBFP Calculator
//
//  Created by Ben Do on 10/26/20.
//

import UIKit

class BFPViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    var bfpValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }

    
    @IBAction func ageSliderChanged(_ sender: UISlider) {
        
        let age = String(format: "%.0f", sender.value)
        ageLabel.text = "\(age)yrs"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.0f", sender.value)
        heightLabel.text = "\(height)in"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Ib"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        genderTextField.endEditing(true)
                
        let age = ageSlider.value
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let bmi = (weight / pow(height, 2)) * 703
        let maleBFP = (1.2 * bmi) + (0.23 * age) - 16.2
        let femaleBFP = (1.2 * bmi) + (0.23 * age) - 5.4
        
        if genderTextField.text == "Male" || genderTextField.text == "Man" {
            calculatorBrain.calculateMaleBFP(age: age, height: height, weight: weight)
            bfpValue = String(format: "%.0f%%", maleBFP)
        } else {
            calculatorBrain.calculateFemaleBFP(age: age, height: height, weight: weight)
            bfpValue = String(format: "%.0f%%", femaleBFP)
        }
        
        
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bfpValue = calculatorBrain.getBFPValue()
            destinationVC.bodyFatDescription = calculatorBrain.getDescription()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}


