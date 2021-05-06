//
//  ExampleViewController.swift
//  test9
//
//  Created by Linder Hassinger on 5/05/21.
//

import UIKit

class ExampleViewController: UIViewController {
    
    @IBOutlet weak var inputCodeNumber: UITextField!
    @IBOutlet weak var codeNumbers: UIPickerView!
    
    let codes: [String] = [
        "+51",
        "+54",
        "+1",
        "+33"
    ]
    
    let operators: [String] = [
        "Movistar",
        "Claro",
        "Entel",
        "Pillofon"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPicker()
        setUpInput()
    }
    
    func setUpPicker() {
        codeNumbers.delegate = self
        codeNumbers.dataSource = self
        codeNumbers.isHidden = true
    }
    
    func setUpInput() {
        inputCodeNumber.delegate = self
        inputCodeNumber.inputView = codeNumbers
    }
}

extension ExampleViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return codes.count
        } else {
            return operators.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return codes[row]
        } else {
            return operators[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let codeIndex = pickerView.selectedRow(inComponent: 0)
        let operatorMobileIndex = pickerView.selectedRow(inComponent: 1)
        inputCodeNumber.text = "\(codes[codeIndex]) \(operators[operatorMobileIndex])"
        
        if component == 1 {
            codeNumbers.isHidden = true
        }
        
    }
}

extension ExampleViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        codeNumbers.isHidden = false
        return false
    }
}
