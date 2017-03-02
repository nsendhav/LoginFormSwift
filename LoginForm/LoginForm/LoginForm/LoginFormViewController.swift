//
//  LoginFormViewController.swift
//  LoginForm
//
//  Created by Narendra Singh Sendhav on 3/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {

    
    @IBOutlet weak var profilePhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    //MARK: @UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDateOfBirthPicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Private Method
    func getDateOfBirthPicker() {
        let datePicker = UIDatePicker()
        datePicker.date = NSDate() as Date
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(updateDateOfBirthValue), for: .valueChanged)
        self.dateOfBirthTextField.inputView = datePicker
    }
    
    func updateDateOfBirthValue() {

    }
    
    //MARK: @IBAction
    @IBAction func profilePhotoAction(_ sender: Any) {
    }

    @IBAction func maleAction(_ sender: Any) {
        maleButton.setImage(UIImage(named: "checked_box"), for: .normal)
        femaleButton.setImage(UIImage(named: "unchecked"), for: .normal);
    }
    
    @IBAction func femaleAction(_ sender: Any) {
        maleButton.setImage(UIImage(named: "unchecked"), for: .normal)
        femaleButton.setImage(UIImage(named: "checked_box"), for: .normal);
    }
   
    @IBAction func submitAction(_ sender: Any) {
    }
}

