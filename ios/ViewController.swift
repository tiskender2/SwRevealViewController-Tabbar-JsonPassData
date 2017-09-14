//
//  ViewController.swift
//  ios
//
//  Created by MacMini on 7.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate{

    
   
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var btnbildirim: UIBarButtonItem!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var webWiew: UIWebView!
    var lapel = String()
    let urlString = "https://www.ortakfikir.com/"
    
  
    override func viewDidLoad() {
     
        super.viewDidLoad()
        sideMenus()
        custimizeNavBar()
        print(lapel)
        labels?.text=lapel
       
        anaweb(urlSt: urlString)
      
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func anaweb(urlSt:String)
    {
        let url = URL(string: urlSt)
        let urlRequest=URLRequest(url: url!)
        webWiew.loadRequest(urlRequest)
        indicator.stopAnimating()
    }
   
    
    func sideMenus()
    {
        if revealViewController() != nil {
            btnMenu.target = SWRevealViewController()
            btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            btnbildirim.target = revealViewController()
            btnbildirim.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

   func custimizeNavBar()
   {
        navigationController?.navigationBar.tintColor =  UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 29/255, green: 202/255, blue: 255/255, alpha: 1)
    
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    
    }

}
