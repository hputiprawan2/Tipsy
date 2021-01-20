//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Hanna Putiprawan on 1/20/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var result = "0.0"
    var numberOfPeople = 1
    var tipPercent = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        detailLabel.text = "Split between \(numberOfPeople) people, with \(tipPercent)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
