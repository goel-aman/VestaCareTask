//
//  SmsViewController.swift
//  VestaCare
//
//  Created by aman on 28/04/24.
//

import UIKit

class SmsViewController: UIViewController {
    @IBOutlet weak var codeField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func VerifyButton(_ sender: Any) {
        if let text = codeField.text, !text.isEmpty {
            AuthManager.shared.verifyCode(smsCode: text) { [weak self] success in
                guard success else {
                    return
                }
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    viewController.modalPresentationStyle = .fullScreen
                    self?.present(viewController,animated: true)
                }
            }
        }
    }
}
