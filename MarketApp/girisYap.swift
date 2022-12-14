//
//  ViewController.swift
//  MarketApp
//
//  Created by Fırat İlhan on 12.12.2022.
//

import UIKit
import Parse

class girisYap: UIViewController {
    
    @IBOutlet weak var kullaniciAdi: UITextField!
    @IBOutlet weak var sifre: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }

    @IBAction func girisYap(_ sender: Any) {
        if kullaniciAdi.text != "" && sifre.text != "" {
           
            PFUser.logInWithUsername(inBackground: kullaniciAdi.text!, password: sifre.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Bilgilerinizi Kontrol Ediniz!!")
                }
               
                self.performSegue(withIdentifier: "gitAnasayfa", sender: nil)
            }
            
            
        } else {
            makeAlert(titleInput: "Hata", messageInput: "Bilgilerinizi Kontrol ediniz!!!")
        }
        
        
        
    }
    
    @IBAction func uyeOl(_ sender: Any) {
        performSegue(withIdentifier: "gitUyeOl", sender: nil)
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

