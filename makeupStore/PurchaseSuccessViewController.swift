//
//  PurchaseSuccessViewController.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 26/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

protocol PurchaseSuccessViewControllerDelegate: class {
    func purchaseSuccessViewController(_ class: PurchaseSuccessViewController, didDismiss _: Bool)
}

class PurchaseSuccessViewController: UIViewController {

    @IBOutlet weak var backToHomeButton: UIButton!
    weak var delegate: PurchaseSuccessViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        backToHomeButton.layer.cornerRadius = 8
    }
    
    @IBAction func navigateBackToHome(_ sender: UIButton) {
        //self.navigationController?.dismiss(animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true) {
//            self.navigationController?.popToRootViewController(animated: true)
            self.delegate?.purchaseSuccessViewController(self, didDismiss: true)
        
        }
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
