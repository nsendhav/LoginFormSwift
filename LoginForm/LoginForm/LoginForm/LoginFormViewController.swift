//
//  LoginFormViewController.swift
//  LoginForm
//
//  Created by Narendra Singh Sendhav on 3/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController, UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    var isGenderMale = true
    var picker:UIImagePickerController? = UIImagePickerController()

    //MARK: @UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        maleButton.setImage(UIImage(named: "checked_box"), for: .normal)
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
    
    func updateDateOfBirthValue(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        self.dateOfBirthTextField.text = dateFormatter.string(from: sender.date)
    }
    
    func openImagePicker() {
        let alert:UIAlertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        picker?.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            picker!.sourceType = UIImagePickerControllerSourceType.camera
            self.present(picker!, animated: true, completion: nil)
        }
    }
    func openGallary() {
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker!, animated: true, completion: nil)
    }
    
    func pushLoginDetailView() {
        let loginDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginDetailViewController") as! LoginDetailViewController
        loginDetailViewController.profileImage = (profilePhotoButton.imageView?.image)!
        loginDetailViewController.name = nameTextField.text!
        loginDetailViewController.email = emailTextField.text!
        loginDetailViewController.phoneNumber = phoneNumberTextField.text!
        loginDetailViewController.dateOfBirth = dateOfBirthTextField.text!
        loginDetailViewController.isGenderMale = isGenderMale
        self.navigationController?.pushViewController(loginDetailViewController, animated: true)
    }
    
    //MARK: @IBAction
    @IBAction func profilePhotoAction(_ sender: Any) {
        self.openImagePicker()
    }

    @IBAction func maleAction(_ sender: Any) {
        maleButton.setImage(UIImage(named: "checked_box"), for: .normal)
        femaleButton.setImage(UIImage(named: "unchecked"), for: .normal);
        isGenderMale = true
    }
    
    @IBAction func femaleAction(_ sender: Any) {
        maleButton.setImage(UIImage(named: "unchecked"), for: .normal)
        femaleButton.setImage(UIImage(named: "checked_box"), for: .normal);
        isGenderMale = false
    }
   
    @IBAction func submitAction(_ sender: Any) {
        self.pushLoginDetailView()
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePhotoButton.setImage(pickedImage, for: .normal)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker .dismiss(animated: true, completion: nil)
    }
}

