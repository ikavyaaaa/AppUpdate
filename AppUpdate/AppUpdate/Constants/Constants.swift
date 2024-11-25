//
//  Constants.swift
//  AppUpdate
//
//  Created by Kavya Krishna K. on 25/11/24.
//

import UIKit

let kScreenSize = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
var kSceneDelegate: SceneDelegate?
var localTimeZoneIdentifier: String { return TimeZone.current.identifier }

class CommonFunctions: NSObject {
    
    static func showUpdate(_ target : UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            let vc = UpdateVC.instantiate(fromAppStoryboard: .update)
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .coverVertical
            target.present(vc, animated: true, completion: nil)
        }
    }
}
