////
////  ViewController.swift
////  VestaCare
////
////  Created by aman on 26/04/24.
////

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let text = phoneNumber.text, !text.isEmpty {
            let number = "+1\(text)"
            print("number is: \(number)")
            AuthManager.shared.startAuth(phoneNumber: number) { success in
                guard success else {
                    return
                }
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "SmsViewController") as! SmsViewController
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController,animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}




