//
//  UpdateVC.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 13/11/24.
//

import UIKit

class UpdateVC: UIViewController {
    
    @IBOutlet fileprivate weak var viewUpdate: UIView!
    @IBOutlet fileprivate weak var lblHeader: UILabel!
    @IBOutlet fileprivate weak var btnCancel: UIButton!
    @IBOutlet fileprivate weak var btnInstall: UIButton!
    @IBOutlet fileprivate weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewUpdate.transform =
        CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.8 / 1.5, animations: {
            self.viewUpdate.transform =
            CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }) { finished in

            UIView.animate(withDuration: 0.5 / 2, animations: {
                self.viewUpdate.transform = .identity.scaledBy(x: 0.9, y: 0.9)
            }) { finished in
                UIView.animate(withDuration: 0.3 / 2, animations: {
                    self.viewUpdate.transform = CGAffineTransform.identity

                })
            }
        }
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btnInstall.setGradientBackgroundColor(colors: [UIColor.Theme.appUpdateBlack, UIColor.Theme.appUpdateGray], axis: .horizontal, cornerRadius: 10) { view in
            guard let btn = view as? UIButton, let imageView = btn.imageView else { return }
            btn.bringSubviewToFront(imageView)
        }
        
        if let btnDiscardLayer = btnCancel.layer.sublayers?.first as? CAGradientLayer {
            btnDiscardLayer.frame = btnCancel.bounds
        }
    }
    
    @IBAction func buttonCancelTouched(_ sender: UIButton) {
        self.dismiss()
        kSceneDelegate?.setLogin()
    }
    
    @IBAction func buttonInstallNowTouched(_ sender: UIButton) {
        if let appStoreURL = URL(string: "https://apps.apple.com/us/app/epricelabel/id1665817043") {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        }
    }
    
    
}
