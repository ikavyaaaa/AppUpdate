//
//  LoginVC.swift
//  AppUpdate
//
//  Created by Kavya Krishna K. on 25/11/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var stackButtons: UIStackView!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var btnApple: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet var btnLogin: TransitionButton!
    @IBOutlet var txtFldEmail: UITextField!
    @IBOutlet var txtFldPassword: UITextField!
    @IBOutlet var btnForgotPassword: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    // MARK: Properties
    private var isLayoutUpdated = Bool()
    
    // MARK: - View Lifecycle
    /// Called after the view controller has loaded its view into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMain.applyRoundedCorners()
        setupAnimation()
    }
    
    /// - Parameter animated: A Boolean value indicating whether the view is being added to the window using an animation.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    /// This method is called to notify the view controller that its view has just laid out its subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !isLayoutUpdated {
            updateLayout()
        }
    }
    
    @IBAction func loginButtonClicked(_ button: TransitionButton) {
        button.startAnimation()
    }
    

    // MARK: - Layout Updates
    
    /// This function sets up and performs animations for various UI elements on the login screen.
    func setupAnimation() {
        // Set initial alpha values to 0 for the text fields, stack view, and login button to make them invisible
        self.txtFldEmail.alpha = 0.0
        self.txtFldPassword.alpha = 0.0
        self.stackButtons.alpha = 0.0
        self.btnLogin.alpha = 0.0
        
        // Animate the header label
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveLinear], animations: {
            // Move the header label upwards and make it visible
            self.lblHeader.center.y -= self.lblHeader.center.y + 10
            self.lblHeader.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) {
                self.lblHeader.alpha = 1.0
            }
        }, completion: nil)
        self.lblHeader.isHidden = false
        
        // Animate the email text field
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveLinear], animations: {
            // Move the email text field upwards and make it visible
            self.txtFldEmail.center.y -= self.txtFldEmail.center.y + 10
            self.txtFldEmail.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) { self.txtFldEmail.alpha = 1.0 }
        }, completion: nil)
        self.txtFldEmail.isHidden = false
        
        // Animate the password text field
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [.curveLinear], animations: {
            // Move the password text field upwards and make it visible
            self.txtFldPassword.center.y -= self.txtFldPassword.center.y + 10
            self.txtFldPassword.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) { self.txtFldPassword.alpha = 1.0 }
        }, completion: nil)
        self.txtFldPassword.isHidden = false
        
        // Animate the stack view containing buttons
        UIView.animate(withDuration: 0.6, delay: 0.1, options: [.curveLinear], animations: {
            // Move the stack view upwards and make it visible
            self.stackButtons.center.y -= self.stackButtons.center.y + 10
            self.stackButtons.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) { self.stackButtons.alpha = 1.0 }
        }, completion: nil)
        self.stackButtons.isHidden = false
        
        // Animate the login button
        UIView.animate(withDuration: 0.7, delay: 0.1, options: [.curveLinear], animations: {
            // Move the login button upwards and make it visible
            self.btnForgotPassword.center.y -= self.btnForgotPassword.center.y + 10
            self.btnForgotPassword.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) { self.btnForgotPassword.alpha = 1.0 }
        }, completion: nil)
        self.btnForgotPassword.isHidden = false
        
        // Animate the login button
        UIView.animate(withDuration: 0.7, delay: 0.1, options: [.curveLinear], animations: {
            // Move the login button upwards and make it visible
            self.btnLogin.center.y -= self.btnLogin.center.y + 10
            self.btnLogin.layoutIfNeeded()
            UIView.animate(withDuration: 0.2) { self.btnLogin.alpha = 1.0 }
        }, completion: nil)
        self.btnLogin.isHidden = false
        
        // Uncomment if you want to animate the forgot password button
        // btnForgotPassword.animShowHidden()
        
        // Update the layout of the view's subviews
        view.layoutSubviews()
        
        // Uncomment if you want to animate the header label's text
        // lblHeader.animate(newText: lblHeader.text ?? "Login", characterDelay: 0.4)
    }
    
    /// This function updates the layout and appearance of various UI elements.
    func updateLayout() {
        // Set the corner radius for the Apple button to make it circular
        btnApple.layer.cornerRadius = btnApple.frame.width / 2
        
        // Set the corner radius for the Google button to match the Apple button
        btnGoogle.layer.cornerRadius = btnApple.frame.width / 2
        
        // Set a horizontal gradient background color for the main view with a corner radius of 10
        viewMain.setGradientBackgroundColor(colors: [UIColor.green, UIColor.blue], axis: .horizontal, cornerRadius: 10) { view in
            // Ensure the view is a UIButton and bring the image view to the front
            guard let btn = view as? UIButton, let imageView = btn.imageView else { return }
            btn.bringSubviewToFront(imageView)
        }
        
        // Set a horizontal gradient background color for the login button with a corner radius of 10
        btnLogin.setGradientBackgroundColor(colors: [UIColor.green, UIColor.blue], axis: .horizontal, cornerRadius: 10) { view in
            // Ensure the view is a UIButton and bring the image view to the front
            guard let btn = view as? UIButton, let imageView = btn.imageView else { return }
            btn.bringSubviewToFront(imageView)
        }
        
        // Adjust the gradient layer for the Apple button to fit its bounds and set its corner radius
        if let btnAppleLayer = btnApple.layer.sublayers?.first as? CAGradientLayer {
            btnAppleLayer.frame = btnApple.bounds
            btnAppleLayer.cornerRadius = btnAppleLayer.bounds.width / 2
        }
        
        // Adjust the gradient layer for the Google button to fit its bounds and set its corner radius
        if let btnGoogleLayer = btnGoogle.layer.sublayers?.first as? CAGradientLayer {
            btnGoogleLayer.frame = btnGoogle.bounds
            btnGoogleLayer.cornerRadius = btnGoogleLayer.bounds.width / 2
        }
        
        isLayoutUpdated = true
    }
    

}
