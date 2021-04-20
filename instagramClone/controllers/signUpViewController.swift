//
//  signUpViewController.swift
//  instagramClone
//
//  Created by Vikas on 19/04/21.
//

import UIKit
import FirebaseAuth

import Firebase

// Sign UP vC
class signUpViewController: UIViewController {
    

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var userNameSignUP: UITextField!
    
    @IBOutlet weak var emailSignUp: UITextField!
    
    @IBOutlet weak var passwordSignUp: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func toGoBackToLogin(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
//        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!) { (user , error) in
//            if error != nil
//            {
//                print(error!.localizedDescription)
//                return
//            }
//            print(user!)
//
//        }
        if emailSignUp.text?.isEmpty == true && passwordSignUp.text?.isEmpty == true && userNameSignUP.text?.isEmpty == true
        {
            print("no email , password and username is there")
            return
        }
       
        login()
    }
    
    func login()
    {
        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!)
          { authResult, error in
          // [START_EXCLUDE]

            guard let user = authResult?.user, error == nil else {
              print(error!.localizedDescription)
              return
            }
             print("\(user.email!) created")
            self.performSegue(withIdentifier: "signUpToLogIn", sender: self)
            
}
        
    
    }
   
    

}

