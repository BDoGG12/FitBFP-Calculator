//
//  ResultsViewController.swift
//  FitBFP Calculator
//
//  Created by Ben Do on 10/26/20.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var bfpLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var bfpValue: String?
    var bodyFatDescription: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bfpLabel.text = bfpValue
        descriptionLabel.text = bodyFatDescription
        descriptionLabel.textColor = color
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
