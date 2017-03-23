//
//  Startpage.swift
//  carouselgame
//
//  Created by chigo anyaso on 2017-03-21.
//  Copyright © 2017 chigo anyaso. All rights reserved.
//

import Foundation
import UIKit


class Startpage : UIViewController {
    
    @IBOutlet weak var scorelabel: UILabel!
    override func viewDidLoad() {
        
    }
    
    @IBAction func play(_ sender: Any) {
        performSegue(withIdentifier: "highscoresegue", sender: nil)
    }
    
    
    @IBAction func share(_ sender: Any) {
    }
    
    
    @IBAction func getmoremoney(_ sender: Any) {
    }
    
    
}



































