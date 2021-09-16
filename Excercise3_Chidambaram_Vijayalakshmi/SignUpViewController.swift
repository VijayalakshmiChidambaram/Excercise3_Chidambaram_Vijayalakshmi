//
//  SignUpViewController.swift
//  Excercise3_Chidambaram_Vijayalakshmi
//
//  Created by student on 9/10/21.
//

import UIKit

protocol UserAccountCreation {
    func addUser(usernameVal: String, passwordVal: String)
}

class SignUpViewController: UIViewController {
    
    var delegate : UserAccountCreation?
    
    @IBOutlet weak var newUserNameInput: UITextField!
    
    @IBOutlet weak var newPasswordInput: UITextField!
    
    @IBOutlet weak var newConfirmPasswordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUpUser(_ sender: Any) {
        if ((newUserNameInput.text?.count) == 0) || ((newPasswordInput.text?.count) == 0) || ((newConfirmPasswordInput.text?.count) == 0)  {
            createAlert(title: "Missing Entry!", msg: "Missing UserName, Password, or Confirm Password")
        }
        else if(newPasswordInput.text) != (newConfirmPasswordInput.text){
            createAlert(title: "Password Mismatch!", msg: "Password and Confirm Password does not match")
        }
        else {
            delegate?.addUser(usernameVal: newUserNameInput.text!, passwordVal: newPasswordInput.text!)
            performSegue(withIdentifier: "SignUpToWelcome", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpToWelcome" {
            let signUpwelcomeSegue = segue.destination as! WelcomeViewController
            signUpwelcomeSegue.username = newUserNameInput.text!
        }
        newUserNameInput.text = ""
        newPasswordInput.text = ""
        newConfirmPasswordInput.text = ""
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
}
