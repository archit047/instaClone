//
//  ViewController.swift
//  instagramClone
//
//  Created by Vikas on 19/04/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.layer.cornerRadius = 5.0
        
        // Do any additional setup after loading the view.
    }

    @IBAction func logIn(_ sender: UIButton) {
       
        validateFields()
    }
        
        func validateFields()
        {
            if emailTextField.text?.isEmpty == true && passwordTextField.text?.isEmpty == true
            {
                print("no email is there and no password is there")
                return
            }
            
                
                login()
                
            
            
            
        }
        
        func login()
        {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
//                guard self != nil else {
//                    print(error!.localizedDescription)
//                    return
//
//                }
                
                if error != nil
                            {
                                print(error!.localizedDescription)
                                return
                            }
                
                print("user SignedIn")
                self!.performSegue(withIdentifier: "loginToHomeScreen", sender: self)
                
                checkUserinfo()
        }
    func checkUserinfo()
    {
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            
        }
    }

}

}
