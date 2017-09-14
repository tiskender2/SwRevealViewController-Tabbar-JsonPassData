//
//  GirisViewController.swift
//  ios
//
//  Created by MacMini on 8.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class GirisViewController: UIViewController {

    @IBOutlet weak var adLabel: UITextField!
    @IBOutlet weak var syerLabel: UITextField!
    @IBOutlet weak var girisBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func btnGiris(_ sender: Any) {
      
            
            if (adLabel.text == "" || syerLabel.text == "")
            {
                let alert = UIAlertController(title: "Uyarı!", message: "Boş Alan Bırakmayınız", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default) { action in
                    
                })
                self.present(alert, animated: true, completion: nil)
               
                
                
            }
                
            else
            {
                let next = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                next.loadView()
                let nesne:MenuViewController = next.rearViewController as! MenuViewController
                nesne.adlabel = adLabel.text!
                nesne.syerLabel=syerLabel.text!
                
                self.present(next, animated: true, completion: nil)
                
            }
        

    }


}
