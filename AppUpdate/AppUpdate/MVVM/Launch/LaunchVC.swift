//
//  LaunchVC.swift
//  AppUpdate
//
//  Created by Kavya Krishna K. on 25/11/24.
//

import UIKit

class LaunchVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var imgVwLogo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgVwLogo.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: 1.0, delay: 0, options: [], animations: {
            self.imgVwLogo.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:  nil)
        kSceneDelegate?.setLogin()
    }

}
