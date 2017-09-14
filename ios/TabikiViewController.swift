//
//  TabikiViewController.swift
//  ios
//
//  Created by MacMini on 14.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class TabikiViewController: UIViewController {

    @IBOutlet weak var btnGeri: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        custimizeNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func custimizeNavBar()
    {
        navigationController?.navigationBar.tintColor =  UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 61/255, green: 142/255, blue: 95/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    

    @IBAction func btnGeriPress(_ sender: Any) {
        
        let sw = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        sw.loadView()
        self.present(sw, animated: true, completion: nil)
    }
    

}
