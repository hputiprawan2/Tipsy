//
//  ViewController.swift
//  Tipsy
//
//  Created by Hanna Putiprawan on 01/19/21.
//


import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var calculateTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var noTipButton: UIButton!
    @IBOutlet weak var numberOfPoepleLabel: UILabel!
    
    var tip = 0.15
    var numberOfPeople = 1
    var calculateTip = CalculateTip()
    var result: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenPctButton.titleLabel?.adjustsFontSizeToFitWidth = true
        fifteenPctButton.titleLabel?.adjustsFontSizeToFitWidth = true
        twentyPctButton.titleLabel?.adjustsFontSizeToFitWidth = true
        noTipButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDissmissed))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardDissmissed() {
        calculateTextField.resignFirstResponder()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        keyboardDissmissed()
        
        // Deselect all button
        tenPctButton.isSelected = false
        fifteenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        noTipButton.isSelected = false
        
        // Only the one that's clicked got highlighted
        sender.isSelected = true
        
        switch sender {
        case tenPctButton: tip = 0.10
        case fifteenPctButton: tip = 0.15
        case twentyPctButton: tip = 0.20
        case noTipButton: tip = 0.0
        default:
            tip = 0.15
        }

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        keyboardDissmissed()
        numberOfPoepleLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destVC = segue.destination as! ResultsViewController
            let result = calculateTip.calculateTip(billCost: Double(calculateTextField.text!) ?? 0.0,
                                                   tipPercent: tip,
                                                   numberOfPeople: numberOfPeople)
            destVC.tipPercent = Int(tip * 100)
            destVC.numberOfPeople = numberOfPeople
            destVC.result = result
        }
    }
}

