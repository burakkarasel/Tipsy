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
    
    var tipManager = TipManager()
    
    var tipPercent = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text! else {return}
        toggleStyling(title: title)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        personCountLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func doneEditingTextField(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton){
        guard let priceInputText = billTotalTextField.text else {return}
        guard let priceInputToFloat = Float(priceInputText) else {return}
        
        
        guard let personCount = Int(personCountLabel.text!) else {return}
        
        tipManager.calculateTipPerPerson(totalPrice: priceInputToFloat, personCount: personCount, tipPercent: tipPercent)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
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
            tipPercent = 0
        case "%10":
            tenPercentTipButton.tintColor = white
            tenPercentTipButton.backgroundColor = darkPurple
            zeroPercentTipButton.backgroundColor = transparent
            zeroPercentTipButton.tintColor = darkPurple
            twentyPercentTipButton.backgroundColor = transparent
            twentyPercentTipButton.tintColor = darkPurple
            tipPercent = 10
        default:
            twentyPercentTipButton.tintColor = white
            twentyPercentTipButton.backgroundColor = darkPurple
            zeroPercentTipButton.backgroundColor = transparent
            zeroPercentTipButton.tintColor = darkPurple
            tenPercentTipButton.backgroundColor = transparent
            tenPercentTipButton.tintColor = darkPurple
            tipPercent = 20
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // transfer the relevant data to next screen
            let destinationViewController = segue.destination as! ResultViewController
            destinationViewController.info = tipManager.getInfo()
            destinationViewController.pricePerPerson = tipManager.getPricePerPerson()
        }
    }
}

// extension to hide number pad after input
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

