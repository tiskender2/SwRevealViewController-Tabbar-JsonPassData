//
//  MenuViewController.swift
//  ios
//
//  Created by MacMini on 8.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var menuNameArr:Array = [String]()
    var iconeImage:Array  = [UIImage]()
    var adlabel = String()
    var syerLabel = String()
    
    @IBOutlet weak var bolumLabel: UILabel!
    @IBOutlet weak var isimLabel: UILabel!
    @IBOutlet weak var imgProfil: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuNameArr = ["Home","Message","Map","Table","Setting"]
        iconeImage = [UIImage(named: "house")!,UIImage(named: "chat")!,UIImage(named: "placeholder")!,UIImage(named: "swift")!,UIImage(named: "settings")!]
        imgProfil.layer.cornerRadius=5
        isimLabel.text=adlabel
        bolumLabel.text=syerLabel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "mycell") as! MenuTableViewCell
        cell.imgIcon.image=iconeImage[indexPath.row]
        cell.lblMenuName.text!=menuNameArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.lblMenuName.text! == "Home"
        {
            let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Message"
        {
            let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroyBoard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Map"
        {
            let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroyBoard.instantiateViewController(withIdentifier: "GaleryViewController") as! GaleryViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Table"
        {
            let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroyBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Setting"
        {
            let mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroyBoard.instantiateViewController(withIdentifier: "tabbar")
            self.present(desController, animated: true)
        }
    }
}
