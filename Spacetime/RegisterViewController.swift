//
//  RegisterViewController.swift
//  Spacetime
//
//  Created by 刘研飞 on 2018/5/29.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var verficationCodeButton: UIButton!
    @IBOutlet weak var phoneLabel: UITextField!
    
    @IBAction func toLoginButtonTapped(_ sender: Any) {
        phoneLabel.resignFirstResponder()
        if self.presentingViewController is LoginViewController {
           self.dismiss(animated: true, completion: nil)
        }else {
            performSegue(withIdentifier: "Register To Login", sender: nil)
        }
        
    }
    
    var countDownTimer: Timer?
    var isCounting: Bool = false {
        willSet {
            if newValue {
                countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
                remainingSeconds = 60
                verficationCodeButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }else {
                countDownTimer?.invalidate()
                countDownTimer = nil
                verficationCodeButton.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
            }
            verficationCodeButton.isEnabled = !newValue
        }
    }
    var remainingSeconds: Int = 0 {
        willSet {
            verficationCodeButton.setTitle("重新获取\(newValue)秒", for: .normal)
            if newValue <= 0 {
                verficationCodeButton.setTitle("获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    @objc func updateTime() {
        remainingSeconds -= 1
    }
    

    @IBAction func varificationCodeButtonTapped(_ sender: Any) {
        isCounting = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("------register appear-------")
        phoneLabel.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
