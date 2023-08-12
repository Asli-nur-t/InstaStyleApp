//
//  ViewController.swift
//  instaCloneProject
//
//  Created by Aslınur Topcu on 27.07.2023.
//

import UIKit

import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func signinClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "error", messageInput: "Username/password?")
        }
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata,Error) in
                if Error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: Error?.localizedDescription ?? "ERROR")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
            
        }else{
            makeAlert(titleInput: "ERROR", messageInput: "Username/password?")
        }
        
        
    }
    
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title:titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton=UIAlertAction(title:"OK", style: UIAlertAction.Style.default,handler: nil)
        
        alert.addAction(okButton)
        self.present(alert,animated: true, completion: nil)
    }
    
    
}

