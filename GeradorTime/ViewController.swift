//
//  ViewController.swift
//  GeradorTime
//
//  Created by Rodrigo Baroni on 22/06/2018.
//  Copyright © 2018 rodrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var btnMontarTimes: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.btnMontarTimes.layer.cornerRadius = 8
        self.btnMontarTimes.layer.borderWidth = 2
        self.btnMontarTimes.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func actionMontarTImes(_ sender: UIButton) {
        if ((self.txtField.text?.isEmpty)! || (self.txtField2.text?.isEmpty)!){
            let alerta = UIAlertController(title: "Atenção", message: "Por favor insira um valor para gerar o time", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alerta, animated: true, completion: nil)
            return
        } else {
            let main = UIStoryboard(name: "Main", bundle: nil)
            let vc = main.instantiateViewController(withIdentifier: "VC") as! GeradorVC
            vc.numeroJogadores = Int(txtField.text!)!
            vc.jogadoresPorTime = Int(txtField2.text!)!
            
            self.present(vc, animated: true) {
                self.txtField.text = ""
                self.txtField2.text = ""
            }
        }
    }
}

