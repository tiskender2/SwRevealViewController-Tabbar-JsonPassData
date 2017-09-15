//
//  TableViewController.swift
//  ios
//
//  Created by MacMini on 14.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UICollectionViewDelegate,UICollectionViewDataSource{

    var basliklar=[String]()
    var id=[String]()
    var konu=[String]()
    var resim=[String]()
    var filmResim=[String]()
    var filmAd=[String]()
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var indicatorFilm: UIActivityIndicatorView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenus()
        custimizeNavBar()
        btnMenu.target = SWRevealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        jsonveri()
        jsonFilm()
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
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
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 225/255, green: 232/255, blue: 183/255, alpha: 1)
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
    func jsonFilm()
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
                                    self.filmAd.append(baslikArray)
                                }
                                if let resimArray = jsonVeri["resim"] as? String
                                {
                                    self.filmResim.append(resimArray)
                                }
                                
                            }
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        self.collectionview.reloadData()
                    }
                }
                catch{
                    print(error)
                }
            }
            
        })
        task.resume()
    }

    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basliklar.count
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! BegeniTableViewCell
        
        
        cell.begeniResim.sd_setImage(with: URL(string: resim[indexPath.row]))
        cell.begenIsim.text=basliklar[indexPath.row]
        cell.konu.text=konu[indexPath.row]
        self.indicator.stopAnimating()
        return cell
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.contentView.backgroundColor = UIColor.clear
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 5, width: self.view.frame.size.width, height: 150))

        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = true
        whiteRoundedView.layer.cornerRadius = 5
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.9
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return filmAd.count
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! FilmCollectionViewCell
        
        cell.FilmResim.sd_setImage(with:URL(string: filmResim[indexPath.row]))
        cell.FilmAd.text=filmAd[indexPath.row]
        indicatorFilm.stopAnimating()
        
        return cell
    }
  
 
    
   
}
