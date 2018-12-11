//
//  ConversionViewController.swift
//  ConversionCalculatorSolution
//
//  Created by Connolly Dean on 12/11/18.
//  Copyright © 2018 Connolly Dean. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    var selection: Int = 1
    var initialValue = ""
    var convertedValue = ""
    var posNeg = ""
    var checkNeg = false
    
    var convert: [converter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convert = [converter(label: "Fahrenheit to Celcius", input: "°F", output: "°C"),
                     converter(label: "Celcius to Fahrenheit", input: "°C", output: "°F"),
                     converter(label: "Miles to Kilometers", input: "mi", output: "km"),
                     converter(label: "Kilometers to Miles", input: "km", output: "mi")]
        updateValues()
    }
    
    
    
    @IBOutlet weak var outputText: UITextField!
    @IBOutlet weak var inputText: UITextField!
    
    
    
    @IBAction func clear(_ sender: Any) {
        initialValue = ""
        convertedValue = ""
        posNeg = ""
        checkNeg = false
        updateValues()
    }
    
    
    
    @IBAction func plusMinus(_ sender: Any) {
        checkNeg = !checkNeg
        if checkNeg{
            posNeg = "-"
        }
        else{
            posNeg = ""
       }
    updateValues()
    }
    
    
    
    
    @IBAction func addToInput(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        if let buttonNum = button.titleLabel?.text{
        initialValue = initialValue + buttonNum
        updateValues()
    }






}
    
    @IBAction func changeConverter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        
        
        alert.addAction(UIAlertAction(title: self.convert![0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.selection = 0
            self.updateValues()
            
        }))
        
        
        alert.addAction(UIAlertAction(title: self.convert![1].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.selection = 1
            self.updateValues()
        }))
        
        
        alert.addAction(UIAlertAction(title: self.convert![2].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.selection = 2
            self.updateValues()
        }))

        alert.addAction(UIAlertAction(title: self.convert![3].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.selection = 3
            self.updateValues()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func updateValues(){
        switch selection{
        case 0:
            
            if let tmp = Float(posNeg + initialValue){
           
                let converted = (tmp - 32)/1.8
                
                convertedValue = String(format: "%.2f", converted)
            }
            else{
                convertedValue = ""
            }
            
            inputText.text = posNeg + initialValue + convert![selection].input
            outputText.text = convertedValue + convert![selection].output
        
        
        case 1:
            
            if let tmp = Float(posNeg + initialValue){
                
                let converted = 32 + (tmp * 1.8)
                
                convertedValue = String(format: "%.2f", converted)
            }
            else{
                
                convertedValue = ""
            }
            inputText.text = posNeg + initialValue + convert![selection].input
            outputText.text = convertedValue + convert![selection].output
                
                
        case 2:
            
            if let tmp = Float(posNeg + initialValue){
                
                let converted = tmp * 1.609344
                
                convertedValue = String(format: "%.2f", converted)
            }
            else{
                convertedValue = ""
            }
            inputText.text = posNeg + initialValue + convert![selection].input
            outputText.text = convertedValue + convert![selection].output
        
            
        case 3:
            
            if let tmp = Float(posNeg + initialValue){
               
                let converted = tmp / 1.609344
                
                convertedValue = String(format: "%.2f", converted)
            }
            else{
                convertedValue = ""
            }
            inputText.text = posNeg + initialValue + convert![selection].input
            outputText.text = convertedValue + convert![selection].output
           
            
        default:
            print("Unknown Error!")
        
        }
        }
    }
    
    
    

