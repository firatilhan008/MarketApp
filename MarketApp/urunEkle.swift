//
//  urunEkle.swift
//  MarketApp
//
//  Created by Fırat İlhan on 12.12.2022.
//

import UIKit
import Parse

class urunEkle: UIViewController {

    @IBOutlet weak var urunAdi: UITextField!
    @IBOutlet weak var urunFiyati: UITextField!
    @IBOutlet weak var urunMarketAdi: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(gerigel))
      
    }
    


    @IBAction func urunEkleButonu(_ sender: Any) {
        
        let urun = PFObject(className: "Urunler")
        
        urun["urunAdi"] = urunAdi.text!
        urun["urunFiyati"] = urunFiyati.text!
        urun["urunMarket"] = urunMarketAdi.text!
        
        urun.saveInBackground { (basarili, hata) in
            if hata != nil {
                self.makeAlert(titleInput: "Hata", messageInput: "Bilgileri Kontrol ediniz...")
            } else {
                self.performSegue(withIdentifier: "urunEkleFromAnasayfa", sender: nil)
            }
        }
    }
    
    @objc func gerigel() {
        
        performSegue(withIdentifier: "urunEkleFromAnasayfa", sender: nil)
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
