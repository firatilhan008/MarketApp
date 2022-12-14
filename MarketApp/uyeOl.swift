//
//  uyeOl.swift
//  MarketApp
//
//  Created by Fırat İlhan on 12.12.2022.
//

import UIKit
import Parse

class uyeOl: UIViewController {

    @IBOutlet weak var kullaniciAdi: UITextField!
    
    
    @IBOutlet weak var kullaniciMail: UITextField!
    
    @IBOutlet weak var kullaniciSifre: UITextField!
    
    
    @IBOutlet weak var kullaniciSifreTekrar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    
    @IBAction func uyeOl(_ sender: Any) {
        
        if kullaniciAdi.text != "" {
            if kullaniciMail.text != "" {
                if kullaniciSifre.text != "" {
                    if kullaniciSifreTekrar.text != "" {
                        if kullaniciSifre.text == kullaniciSifreTekrar.text {
                      
                       //başlangıç
                            let user = PFUser()
                            user.username = kullaniciAdi.text!
                            user.email = kullaniciMail.text!
                            user.password = kullaniciSifre.text!
                            
                            user.signUpInBackground {(success, error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata!!")
                                } else {
                                    //segue
                                   
                                    //self.performSegue(withIdentifier: "gitGirisYap", sender: nil)
                                    self.makeAlert(titleInput: "Tebrikler", messageInput: "Başarılı bir şekilde kayıt oldunuz!")
                                }
                            }
                        //bitiş
                            
                        } else {
                            makeAlert(titleInput: "Hata", messageInput: "Şifreler uyuşmuyor")
                        }
                    } else {
                        makeAlert(titleInput: "Hata", messageInput: "Şifrenizi Tekrar Giriniz!!!")
                    }
                } else {
                    makeAlert(titleInput: "Hata", messageInput: "Şirenizi Belirleyiniz!!!")
                }
            } else {
                makeAlert(titleInput: "Hata", messageInput: "Mail Adresi Giriniz!!!")
            }
            
        } else {
            makeAlert(titleInput: "Hata", messageInput: "Kullanıcı adınızı giriniz!!!")
        }
  
        
        
    }
    
    
    
    
    
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}
