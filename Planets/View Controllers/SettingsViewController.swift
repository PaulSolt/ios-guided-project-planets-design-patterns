//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let shouldShowPlutoChanged = NSNotification.Name(rawValue: "shouldShowPlutoChanged")
}

class SettingsViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // Target/Action for button action (Cocoa Design Pattern)
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
        NotificationCenter.default.post(name: .shouldShowPlutoChanged, object: nil)
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
}
