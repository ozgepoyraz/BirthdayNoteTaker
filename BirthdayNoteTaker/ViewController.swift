//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Özge Poyraz on 4.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }
    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(name.text!, forKey: "name")
        UserDefaults.standard.set(birthday.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(name.text!)"
        birthdayLabel.text = "Birthday: \(birthday.text!)"
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            name.text = " "
            nameLabel.text = "Name: "
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthday.text = " "
            birthdayLabel.text  = "Birthday: "
        }
    }
}

