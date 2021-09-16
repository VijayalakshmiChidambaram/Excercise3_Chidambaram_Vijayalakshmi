//
//  ViewController.swift
//  Excercise3_Chidambaram_Vijayalakshmi
//
//  Created by student on 9/9/21.
//

import UIKit

class ViewController: UIViewController, UserAccountCreation {
    
    var userNamePassDictionary = ["User Name" : "username", "Password" : "password"]
    

    @IBOutlet weak var userNameInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func createAlertLogin(title: String, msg: String){
        let loginalert1 = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        loginalert1.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(loginalert1, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToWelcome" {
            let welcomeSegue = segue.destination as! WelcomeViewController
            welcomeSegue.username = userNameInput.text!
        }
        
        else if segue.identifier == "homeToSignUp" {
            let signUpSegue = segue.destination as! SignUpViewController
            signUpSegue.delegate = self
        }
    }
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "homeToSignUp", sender: self)
        navigationItem.title = "Registration App"
    }
    
    @IBAction func signIn(_ sender: Any) {
        if(userNameInput.text?.count == 0 || passwordInput.text?.count == 0) {
            createAlertLogin(title: "Missing Entry!" , msg: "Missing User Name and Password")
        }
        else if(userNamePassDictionary[userNameInput.text!] == passwordInput.text!) {
        performSegue(withIdentifier: "homeToWelcome", sender: self)
            userNameInput.text = ""
            passwordInput.text = ""

        }
        else {
            createAlertLogin(title: "Invalid Entry!" , msg: "Combination of User Name and Password is not valid")
        }
    }

    func addUser(usernameVal: String, passwordVal: String) {
        userNamePassDictionary[usernameVal] = passwordVal
        //createAlertLogin(title: "Success!" , msg: "Stored success")
    }
    
}

