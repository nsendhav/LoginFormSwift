//
//  LoginDetailViewController.swift
//  LoginForm
//
//  Created by Narendra Singh Sendhav on 3/3/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class LoginDetailViewController: UIViewController {

    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    var profileImage = UIImage()
    var name = ""
    var email = ""
    var phoneNumber = ""
    var dateOfBirth = ""
    var isGenderMale = true
    
    //MARK: @UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Method
    func setupUI() {
        profileImageButton.setImage(profileImage, for: .normal)
        nameLabel.text = "Name: " + name;
        emailLabel.text = "Email: " + email
        phoneNumberLabel.text = "Phone Number: " + phoneNumber
        dateOfBirthLabel.text = "Date Of Birth: " + dateOfBirth
        var gender = ""
        if isGenderMale {
            gender = "Male"
        }
        else {
            gender = "Female"
        }
        self.genderLabel.text = "Gender: " + gender
    }
    
    //MARK: IBAction
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true);
    }
}
