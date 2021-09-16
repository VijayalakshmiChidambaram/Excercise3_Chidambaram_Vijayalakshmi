//
//  WelcomeViewController.swift
//  Excercise3_Chidambaram_Vijayalakshmi
//
//  Created by student on 9/10/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    var username: String?
    
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = "Welcome \(username!)!"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
