//
//  urunListeleme.swift
//  MarketApp
//
//  Created by Fırat İlhan on 12.12.2022.
//

import UIKit
import Parse

class urunListeleme: UIViewController {
    
    
    
    @IBOutlet weak var ListeUrunAdi: UILabel!
    @IBOutlet weak var ListeUrunFiyati: UILabel!
    @IBOutlet weak var ListeUrunMarket: UILabel!
    
    var secilenUrunId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        verileriGetir()
    }
    func verileriGetir() {
        
        
        let query = PFQuery(className: "Urunler")
        query.whereKey("objectId", equalTo: secilenUrunId)
        query.findObjectsInBackground{ (objects, error) in
            if error != nil {
                
            } else {
                if objects!.count > 0 {
                    let secilenUrunObject = objects![0]
                    
                 
                    if let modelUrunAdi = secilenUrunObject.object(forKey: "urunAdi") as? String {
                        self.ListeUrunAdi.text = "Ürün Adı: \(modelUrunAdi)"
                    }
                    if let modelUrunMarket = secilenUrunObject.object(forKey: "urunFiyati") as? String {
                        self.ListeUrunFiyati.text = "Ürün Kg/Birim Fiyatı: \(modelUrunMarket)"
                    }
                    if let modelUrunFiyati = secilenUrunObject.object(forKey: "urunMarket") as? String {
                        self.ListeUrunMarket.text = "Market Adı:  \(modelUrunFiyati)"
                    }
                  
                }
            }
        }
        
        
        
        
        
    }
    
    
    
}
