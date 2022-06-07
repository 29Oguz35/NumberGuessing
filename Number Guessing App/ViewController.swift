//
//  ViewController.swift
//  Number Guessing App
//
//  Created by naruto kurama on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtGuessNumber: UITextField!
    @IBOutlet weak var imageSave: UIImageView!
    @IBOutlet weak var btnSaveClicked: UIButton!
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imageGuess: UIImageView!
    @IBOutlet weak var btnTryClicked: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var imageStar1: UIImageView!
    @IBOutlet weak var imageStar2: UIImageView!
    @IBOutlet weak var imageStar3: UIImageView!
    @IBOutlet weak var imageStar4: UIImageView!
    @IBOutlet weak var imageStar5: UIImageView!
    
    var stars : [UIImageView] = [UIImageView]()
    let maxTryNumber : Int = 5
    var tryNumber : Int = 0
    var targetNumber : Int = -1
    var gameSuccessfull : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        stars = [imageStar1,imageStar2,imageStar3,imageStar4,imageStar5]
        
        imageSave.isHidden = true
        imageGuess.isHidden = true
        btnTryClicked.isEnabled = false
        txtGuessNumber.isSecureTextEntry = true
        lblResult.text = ""
    }

    @IBAction func btnSave(_ sender: UIButton)
    {
        imageSave.isHidden = false
        if let t = Int(txtGuessNumber.text!) {
            targetNumber = t
            btnTryClicked.isEnabled = true
            txtGuessNumber.isEnabled = false
            btnSaveClicked.isEnabled = false
            imageSave.image = UIImage(named: "onay")
        } else {
            imageSave.image = UIImage(named: "hata")
        }
    }
    
    @IBAction func btnTry(_ sender: Any)
    {
        if gameSuccessfull == true || tryNumber > maxTryNumber
        {
           return
        }
        imageGuess.isHidden = false
        if let guess = Int(txtGuess.text!)
        {
            tryNumber += 1
            stars[tryNumber-1].image = UIImage(named: "beyazYıldız")
            
           
            if guess > targetNumber
            {
                imageGuess.image = UIImage(named: "asagı")
                txtGuess.backgroundColor = UIColor.red
            }else if targetNumber > guess
                {
                imageGuess.image = UIImage(named: "yukarı")
                txtGuess.backgroundColor = UIColor.red
            }else {
                imageGuess.image = UIImage(named: "tamam")
                lblResult.text = "Congratulations"
                btnSaveClicked.isEnabled = true
                txtGuess.backgroundColor = UIColor.purple
                txtGuessNumber.isSecureTextEntry = false
                gameSuccessfull = true
                showAlert(title: "WİN", massage: "Congratulations")
                return
            }
        }else  {
            imageGuess.image = UIImage(named: "hata")
        }
        if tryNumber == maxTryNumber
        {
            btnTryClicked.isEnabled = false
            imageGuess.image = UIImage(named: "hata")
            lblResult.text = "Game Over \n Friend: \(targetNumber)"
            txtGuessNumber.isSecureTextEntry = false
            showAlert(title: "OOPS", massage: "Game Over")
            return
        }
    }
    func showAlert(title:String,massage:String)
    {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            
            self.imageStar1.image = UIImage(named: "sarıYıldız")
            self.imageStar2.image = UIImage(named: "sarıYıldız")
            self.imageStar3.image = UIImage(named: "sarıYıldız")
            self.imageStar4.image = UIImage(named: "sarıYıldız")
            self.imageStar5.image = UIImage(named: "sarıYıldız")
            self.imageSave.isHidden = true
            self.imageGuess.isHidden = true
            self.btnTryClicked.isEnabled = true
            self.txtGuessNumber.isSecureTextEntry = true
            self.txtGuessNumber.isEnabled = true
            self.btnSaveClicked.isEnabled = true
            self.txtGuess.isEnabled = true
            self.lblResult.text = ""
            self.txtGuess.text = ""
            self.txtGuessNumber.text = ""
            self.targetNumber = 0
            self.gameSuccessfull = false
            self.tryNumber = 0
            self.txtGuess.backgroundColor = UIColor.white
        }
        let cancelButton = UIAlertAction(title: "CANSEL", style: UIAlertAction.Style.default) { UIAlertAction in
           
            self.imageStar1.image = UIImage(named: "sarıYıldız")
            self.imageStar2.image = UIImage(named: "sarıYıldız")
            self.imageStar3.image = UIImage(named: "sarıYıldız")
            self.imageStar4.image = UIImage(named: "sarıYıldız")
            self.imageStar5.image = UIImage(named: "sarıYıldız")
            self.imageSave.isHidden = true
            self.imageGuess.isHidden = true
            self.btnTryClicked.isEnabled = true
            self.txtGuessNumber.isSecureTextEntry = true
            self.txtGuessNumber.isEnabled = true
            self.btnSaveClicked.isEnabled = true
            self.txtGuess.isEnabled = true
            self.lblResult.text = ""
            self.txtGuess.text = ""
            self.txtGuessNumber.text = ""
            self.targetNumber = 0
            self.gameSuccessfull = false
            self.tryNumber = 0
            self.txtGuess.backgroundColor = UIColor.white
            UIControl().sendAction(#selector(NSXPCConnection.suspend),
                                   to: UIApplication.shared, for: nil)
        }
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
        
    }



