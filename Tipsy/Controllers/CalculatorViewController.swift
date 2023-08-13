//
//  ViewController.swift
//  Tipsy
//
//  Created by Burak Karasel on 12.08.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTotalTextField: UITextField!
    
    @IBOutlet weak var zeroPercentTipButton: UIButton!
    @IBOutlet weak var tenPercentTipButton: UIButton!
    @IBOutlet weak var twentyPercentTipButton: UIButton!
    @IBOutlet weak var personCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton){
        
    }
}

