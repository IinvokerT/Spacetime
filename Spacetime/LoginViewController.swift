//
//  LoginViewController.swift
//  Spacetime
//
//  Created by 刘研飞 on 2018/5/29.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UITextField!
    @IBAction func toRegisterButtonTapped(_ sender: Any) {
        phoneLabel.resignFirstResponder()
        if self.presentingViewController is RegisterViewController {
            self.dismiss(animated: true, completion: nil)
        }else {
            performSegue(withIdentifier: "Login To Register", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("-------Login appear--------")
        phoneLabel.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
