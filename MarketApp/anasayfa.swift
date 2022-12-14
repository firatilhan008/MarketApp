//
//  anasayfa.swift
//  MarketApp
//
//  Created by Fırat İlhan on 12.12.2022.
//

import UIKit
import Parse

class anasayfa: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
   
    var urunAdiArray = [String]()
    var urunIdArray = [String]()
    
    var secilmisUrunId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(urunEkle))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cikisYap))
        tableView.delegate = self
        tableView.dataSource = self
        
        verileriGetir()
        
    }
    
    
    func verileriGetir() {
        let query = PFQuery(className: "Urunler")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    
                    for object in objects! {
                        
                        if let urunAdi = object.object(forKey: "urunAdi") as? String {
                            if let urunId = object.objectId {
                                self.urunIdArray.append(urunId)
                                self.urunAdiArray.append(urunAdi)
                            }
                            
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    //son
    
    @objc func urunEkle(){
        performSegue(withIdentifier: "gitUrunEkle", sender: nil)
    }
    
    @objc func cikisYap() {
        PFUser.logOutInBackground { (error) in
            if error != nil {
                self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata")
            } else {
                self.performSegue(withIdentifier: "cikisYap", sender: nil)
            }
        }
    }
    
  
   
        
 
       
        
      
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "urunListe" {
                let destinationVC = segue.destination as! urunListeleme
                destinationVC.secilenUrunId = secilmisUrunId
            }
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            secilmisUrunId = urunIdArray[indexPath.row]
            self.performSegue(withIdentifier: "urunListe", sender: nil)
            
        }
        
        
        
        
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.text = urunAdiArray[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return urunAdiArray.count
        }
        
        func makeAlert(titleInput: String, messageInput: String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
}
