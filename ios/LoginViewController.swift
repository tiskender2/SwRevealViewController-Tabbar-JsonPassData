//
//  LoginViewController.swift
//  ios
//
//  Created by MacMini on 8.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit
import RevealingSplashView

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginGiris: UIButton!
    @IBOutlet weak var loginKayit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "apple")!,iconInitialSize: CGSize(width: 70, height: 70),
            backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        revealingSplashView.animationType = SplashAnimationType.squeezeAndZoomOut
       
        self.view.addSubview(revealingSplashView)
        
      
        revealingSplashView.startAnimation(){
            print("Completed")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
