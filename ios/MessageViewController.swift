//
//  MessageViewController.swift
//  ios
//
//  Created by MacMini on 8.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit
import SDWebImage

class MessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

       
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
  
    @IBOutlet weak var tblview: UITableView!
    var basliklar=[String]()
    var id=[String]()
    var konu=[String]()
    var resim=[String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        sideMenus()
        custimizeNavBar()
        btnMenu.target = SWRevealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        jsonveri()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 87/255, blue: 35/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }

    func jsonveri()
    {
        let urlString="http://www.bucayapimarket.com/json.php"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil
            {
                print(error!)
            }
            else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                    if let jsonDic = json
                    {
                        for i in 0..<jsonDic.count
                        {
                           if let jsonVeri = jsonDic[i] as? NSDictionary
                           {
                                if let baslikArray = jsonVeri["baslik"] as? String
                                {
                                   self.basliklar.append(baslikArray)
                                }
                                if let konuArray = jsonVeri["icerik"] as? String
                                {
                                   self.konu.append(konuArray)
                                }
                                if let idArray = jsonVeri["id"] as? String
                                {
                                   self.id.append(idArray)
                                }
                                if let resimArray = jsonVeri["resim"] as? String
                                {
                                   self.resim.append(resimArray)
                                }
                            
                           }
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        self.tblview.reloadData()
                    }
                }
                catch{
                    print(error)
                }
            }
        
        })
     task.resume()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return basliklar.count
    }
    
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! messageTableViewCell
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width-20, height: 110))
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 5
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: -1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
        
        
        cell.mesajResim.sd_setImage(with: URL(string: resim[indexPath.row]))
        cell.mesajLabel.text=basliklar[indexPath.row]
        self.indicator.stopAnimating()
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nesne = storyboard?.instantiateViewController(withIdentifier: "MesajDetayViewController") as! MesajDetayViewController
        nesne.id = id[indexPath.row]
        nesne.baslik = basliklar[indexPath.row]
        nesne.konu = konu[indexPath.row]
        nesne.resimstr = resim[indexPath.row]
        navigationController?.pushViewController(nesne, animated: true)
        
        
        
    }
   
   


}





