//
//  CalculcatorBrain.swift
//  FitBFP Calculator
//
//  Created by Ben Do on 10/25/20.
//

import UIKit

struct CalculatorBrain {
    var bfp: BFP?
    var bodyFatDescription: String?
    var color: UIColor?
    
    func getDescription() -> String {
        return bfp?.bodyFatDescription ?? "No Description"
    }
    
    func getColor() -> UIColor {
        return bfp?.color ?? UIColor.white
    }
    
    func getBFPValue() -> String {
        let bfpToPercentage = String(format: "%.0f%%", bfp?.value ?? 0.0)
        return bfpToPercentage
    }
    
    mutating func calculateMaleBFP(age: Float, height: Float, weight: Float) {
        
        let bmi = (weight / pow(height, 2)) * 703
        let maleBFP = (1.2 * bmi) + (0.23 * age) - 16.2
        
        switch maleBFP {
        case 2...5:
            bfp = BFP(value: maleBFP, bodyFatDescription: "Essential Fat", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        case 6...13:
            bfp = BFP(value: maleBFP, bodyFatDescription: "Athletes", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case 14...17:
            bfp = BFP(value: maleBFP, bodyFatDescription: "Fitness", color: #colorLiteral(red: 0.001298996568, green: 0.9103148794, blue: 0.1539095866, alpha: 1))
        case 18...24:
            bfp = BFP(value: maleBFP, bodyFatDescription: "Average", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        case 25...:
            bfp = BFP(value: maleBFP, bodyFatDescription: "Obese", color: #colorLiteral(red: 1, green: 0, blue: 0.009361755543, alpha: 1))
        default:
            break
        }
        
        
    }
    
    mutating func calculateFemaleBFP(age: Float, height: Float, weight: Float) {
        
        let bmi = (weight / pow(height, 2)) * 703
        let femaleBFP = (1.2 * bmi) + (0.23 * age) - 5.4
        
        switch femaleBFP {
        case 10...13:
            bfp = BFP(value: femaleBFP, bodyFatDescription: "Essential Fat", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        case 14...20:
            bfp = BFP(value: femaleBFP, bodyFatDescription: "Athletes", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case 21...24:
            bfp = BFP(value: femaleBFP, bodyFatDescription: "Fitness", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        case 25...31:
            bfp = BFP(value: femaleBFP, bodyFatDescription: "Average", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        case 32...:
            bfp = BFP(value: femaleBFP, bodyFatDescription: "Obese", color: #colorLiteral(red: 1, green: 0.1421272733, blue: 0.1415055742, alpha: 1))
        default:
            break
        }
    }
}
