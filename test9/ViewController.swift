//
//  ViewController.swift
//  test9
//
//  Created by Linder Hassinger on 5/05/21.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var lblFruit: UILabel!
    
    @IBOutlet weak var fruitsPicker: UIPickerView!
    
    let countries = [
        "Peru",
        "Colombia",
        "Chile",
        "Argentina"
    ]
    
    let fruits = [
        "manzana",
        "platano",
        "pera"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblText.text = countries[0]
        countryPicker.dataSource = self
        countryPicker.delegate = self
        
        fruitsPicker.dataSource = self
        fruitsPicker.delegate = self
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPicker {
            return countries.count
        } else {
            return fruits.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPicker {
            return countries[row]
        } else {
            return fruits[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPicker {
            lblText.text = countries[row]
        } else {
            lblFruit.text = fruits[row]
        }
        
    }
}
