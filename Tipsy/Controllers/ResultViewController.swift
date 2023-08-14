//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Burak Karasel on 13.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var pricePerPerson : Float?
    var info : String?

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        totalPerPersonLabel.text = String(format: "%.2f", pricePerPerson ?? 0.0)
        infoLabel.text = info

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
