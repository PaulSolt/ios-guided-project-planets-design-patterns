//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }
    
    // MARK: State Restoration
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        // save state
        
        // Planet -> Data -> Encode
        
        guard let planet = planet else { return }
        let planetData = try? PropertyListEncoder().encode(planet)
        coder.encode(planetData, forKey: "planetData")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        // load state
        
        // Data -> Planet -> Update the View
        guard let planetData = coder.decodeObject(forKey: "planetData") as? Data else { return }
        planet = try? PropertyListDecoder().decode(Planet.self, from: planetData)
    }
    
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
}
