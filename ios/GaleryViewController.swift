//
//  GaleryViewController.swift
//  ios
//
//  Created by MacMini on 13.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class GaleryViewController: UIViewController {

    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenus()
        custimizeNavBar()
        btnMenu.target = SWRevealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus()
    {
        if revealViewController() != nil {
            btnMenu.target = SWRevealViewController()
            btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    func custimizeNavBar()
    {
        navigationController?.navigationBar.tintColor =  UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 176/255, green: 200/255, blue: 205/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    

}
