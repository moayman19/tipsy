//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    var buTitle = ""
    var ResultTo2DecimalPlaces = ""
    var tip = 0.0
   var numberOfPeople = 0
   var billTotal = 0.0
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!

    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        clearselectedState()
      sender.isSelected = true
         buTitle = sender.currentTitle!
        let  buTitleMinusPercent = String(buTitle.dropLast())
        let buTitleAsNumber = Double(buTitleMinusPercent)!
        tip = buTitleAsNumber / 100
        
        
    
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int( sender.value))
        numberOfPeople = Int( sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
       
        if bill != "" {
         billTotal = Double(bill)!
        let Result = billTotal * (1 + tip) / Double(numberOfPeople)
        ResultTo2DecimalPlaces = String(format: "%.2f", Result)
   
             performSegue(withIdentifier: "goToResultView", sender: self)
        
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "goToResultView"{
            let distinationVc = segue.destination as! ResultsViewController
            distinationVc.bill = ResultTo2DecimalPlaces
            distinationVc.peopleSplit = numberOfPeople
            distinationVc.percentage = buTitle
        }
        
    }
    func  clearselectedState(){
        zeroPctButton.isSelected = false
         tenPctButton.isSelected = false
         twentyPctButton.isSelected = false
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

