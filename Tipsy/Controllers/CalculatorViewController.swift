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
        guard let title = sender.titleLabel?.text! else {return}
        toggleStyling(title: title)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton){
        
    }
    
    func toggleStyling(title : String) {
        
        let darkPurple = UIColor(red: CGFloat(0.2901960784313726), green: CGFloat(0.3333333333333333), blue: CGFloat(0.6352941176470588), alpha: CGFloat(1))
        let white = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(1))
        let transparent = UIColor.white.withAlphaComponent(CGFloat(0))
        
        switch title {
        case "%0":
            zeroPercentTipButton.tintColor = white
            zeroPercentTipButton.backgroundColor = darkPurple
            tenPercentTipButton.backgroundColor = transparent
            tenPercentTipButton.tintColor = darkPurple
            twentyPercentTipButton.backgroundColor = transparent
            twentyPercentTipButton.tintColor = darkPurple
        case "%10":
            tenPercentTipButton.tintColor = white
            tenPercentTipButton.backgroundColor = darkPurple
            zeroPercentTipButton.backgroundColor = transparent
            zeroPercentTipButton.tintColor = darkPurple
            twentyPercentTipButton.backgroundColor = transparent
            twentyPercentTipButton.tintColor = darkPurple
        default:
            twentyPercentTipButton.tintColor = white
            twentyPercentTipButton.backgroundColor = darkPurple
            zeroPercentTipButton.backgroundColor = transparent
            zeroPercentTipButton.tintColor = darkPurple
            tenPercentTipButton.backgroundColor = transparent
            tenPercentTipButton.tintColor = darkPurple
        }
    }
}

