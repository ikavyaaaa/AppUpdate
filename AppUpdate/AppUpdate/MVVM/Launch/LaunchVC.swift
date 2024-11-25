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


func checkForUpdate() {
    guard let bundleID = Bundle.main.bundleIdentifier else {
        self.setLogin()
        return
    }
    
    let appStoreURL = URL(string: "https://itunes.apple.com/\(Locale.current.regionCode ?? "US")/lookup?bundleId=\(bundleID)")!
    
    let task = URLSession.shared.dataTask(with: appStoreURL) { [weak self] (data, response, error) in
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let results = json?["results"] as? [[String: Any]],
                   let appStoreVersion = results.first?["version"] as? String,
                   let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                    if appStoreVersion > currentVersion {
                        CommonFunctions.showUpdate(self!)
                    } else {
                        self?.setLogin()
                    }
                } else {
                    self?.setLogin()
                }
            } catch {
                print("Error parsing JSON: \(error)")
                self?.setLogin()
            }
        }
    }
    task.resume()
}
