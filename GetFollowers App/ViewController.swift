//
//  ViewController.swift
//  GetFollowers App
//
//  Created by ahlam on 30/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var birthdateTF: UITextField!
    var birthdate : Date? = nil
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPicker()
        
    }
    
    func createTollBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePresed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createPicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdateTF.inputView = datePicker
        birthdateTF.inputAccessoryView = createTollBar()
    }
    
    @objc func donePresed(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        self.birthdateTF.text =  dateFormater.string(from: datePicker.date)
        birthdate = datePicker.date
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func nextButtonPeresed(_ sender: Any) {
        
        if nameTF.text != "" && birthdateTF.text != ""
        {
            var vc = storyboard?.instantiateViewController(withIdentifier: "FollowersVC") as! FollowersVC
            vc.userName = nameTF.text!
            if birthdate != nil {
                vc.birthDate = birthdate
            }
            present(vc, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill in required fields", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default )
            alert.addAction(okAction)
            self.present(alert, animated: true )
        }
        
        
    }
    
    
    
}


