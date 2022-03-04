//
//  MainViewController.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import UIKit
import SVProgressHUD
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     }
    func showLoading(){
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    func hideLoading(){
        SVProgressHUD.dismiss()
    }

    func showAlert(title: String?, message: String?) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

}
