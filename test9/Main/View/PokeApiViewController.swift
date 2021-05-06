//
//  PokeApiViewController.swift
//  test9
//
//  Created by Linder Hassinger on 5/05/21.
//

import UIKit

class PokeApiViewController: UIViewController {
    
    @IBOutlet weak var pokeListPicker: UIPickerView!
    @IBOutlet weak var pokeTextField: UITextField!
    
    var viewPokeModel = ViewModelPokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPicker()
        bind()
        setUpTextField()
    }
    
    func setUpPicker() {
        pokeListPicker.delegate = self
        pokeListPicker.dataSource = self
        viewPokeModel.getListPokemon()
    }
    
    func setUpTextField() {
        pokeTextField.delegate = self
        pokeTextField.inputView = pokeListPicker
    }
    
    func bind() {
        viewPokeModel.refreshData = { [weak self] () in
            DispatchQueue.main.async { [self] in
                self?.pokeListPicker.isHidden = true
            }
        }
    }
    
}

extension PokeApiViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewPokeModel.dataArrayPokemonList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return viewPokeModel.dataArrayPokemonList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokeTextField.text = viewPokeModel.dataArrayPokemonList[row].name
        pokeListPicker.isHidden = true
    }
}

extension PokeApiViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pokeListPicker.isHidden = false
        return false
    }
}
