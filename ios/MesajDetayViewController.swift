//
//  MesajDetayViewController.swift
//  ios
//
//  Created by MacMini on 11.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class MesajDetayViewController: UIViewController {

     var id = String()
     var konu = String()
     var baslik = String()
     var resimstr = String()
   
    

    @IBOutlet weak var mesajResim: UIImageView!


   
    @IBOutlet weak var btnMenu: UIBarButtonItem!

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var mesajKonu: UILabel!
    @IBOutlet weak var mesajBaslik: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       custimizeNavBar()
        print(id)
        
        mesajKonu.text = konu
        mesajBaslik.text = baslik
        mesajResim.sd_setImage(with: URL(string:resimstr))
        mesajKonu.sizeToFit()
        
        indicator.stopAnimating()
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    func custimizeNavBar()
    {
        navigationController?.navigationBar.tintColor =  UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 29/255, green: 202/255, blue: 255/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
  
    @IBAction func btnPress(_ sender: Any) {
        let sw = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        self.view.window?.rootViewController = sw
        let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desController = mainStroyBoard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        let newFrontViewController = UINavigationController.init(rootViewController:desController)
        sw.pushFrontViewController(newFrontViewController, animated: true)
        
    }
    
   
    
    
}






