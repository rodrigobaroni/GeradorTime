//
//  GeradorVC.swift
//  GeradorTime
//
//  Created by Rodrigo Baroni on 22/06/2018.
//  Copyright © 2018 rodrigo. All rights reserved.
//

import UIKit

class GeradorVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var labelRestante: UILabel!
    @IBOutlet weak var txtFieldNome: UITextField!
    
    @IBOutlet weak var lblTimeVerde: UILabel!
    @IBOutlet weak var lblTimeLaranja: UILabel!
    @IBOutlet weak var lblTime1: UILabel!
    @IBOutlet weak var lblTime2: UILabel!
    @IBOutlet weak var lblTime3: UILabel!
    @IBOutlet weak var lblTime4: UILabel!
    
    @IBOutlet weak var imgTimeVerde: UIImageView!
    @IBOutlet weak var imgTimeLaranja: UIImageView!
    @IBOutlet weak var imgTimeAzul: UIImageView!
    @IBOutlet weak var imgTimeVermelho: UIImageView!
    @IBOutlet weak var imgTimePreto: UIImageView!
    @IBOutlet weak var imgTimeAmarelo: UIImageView!
    
    @IBOutlet weak var viewVerde: UIView!
    @IBOutlet weak var viewLaranja: UIView!
    @IBOutlet weak var viewAzul: UIView!
    @IBOutlet weak var viewVermelho: UIView!
    @IBOutlet weak var viewPreto: UIView!
    @IBOutlet weak var viewAmarelo: UIView!
    
    var numeroJogadores = 17
    var times = Int()
    var sobra = Int()
    var jogadoresPorTime = Int()
    var dict = NSMutableDictionary()
    var array = Array<String>()
    
    var timeLaranja = ""
    var timeVerde = ""
    var timeAzul = ""
    var timeVermelho = ""
    var timePreto = ""
    var timeAmarelo = ""
    
    func geradorDeTime(jogadoresPorTimes: Int) {
        
        times = (numeroJogadores / jogadoresPorTimes).hashValue
        sobra = (numeroJogadores - (times * jogadoresPorTimes))
        
        for i in 1...times{
            let key = "time \(i)"
            dict.addEntries(from: [key:jogadoresPorTimes])
            array.append("time \(i)")
        }
        dict.addEntries(from: ["time \(times + 1)":sobra])
        array.append("time \(times + 1)")
    }
    
    func selecionaJogadores(){

        if numeroJogadores == 0 {
            
            self.txtFieldNome.resignFirstResponder()
            self.txtFieldNome.text = ""
            let alerta = UIAlertController(title: "Acabou", message: "Acabou os jogadores", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
            
            
        } else {
        
            let controle = array.randomElement
            let indexElement = array.index(of: controle)
            let timeSelecionado = dict[controle] as! Int
            if timeSelecionado == 0 {
                dict.removeObject(forKey: controle)
                array.remove(at: indexElement!)
                selecionaJogadores()
            } else {
                let value = dict[controle] as! Int
                dict[controle] = value - 1

                switch controle {
                case "time 1":
                    self.timeVerde += " \(self.txtFieldNome.text!.uppercased()) "
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME VERDE", imageName: "camisa-verde")
                    self.viewVerde.isHidden = false
                    
                case "time 2":
                    self.timeLaranja += " \(self.txtFieldNome.text!.uppercased()) "
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME LARANJA", imageName: "camisa-laranja")
                    self.viewLaranja.isHidden = false
                    
                case "time 3":
                    self.timeAzul += " \(self.txtFieldNome.text!.uppercased()) "
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME AZUL", imageName: "camisa-azul")
                    self.viewAzul.isHidden = false
                    
                case "time 4":
                    self.timeVermelho += " \(self.txtFieldNome.text!.uppercased()) "
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME VERMELHO", imageName: "camisa-vermelha")
                    self.viewVermelho.isHidden = false
                    
                case "time 5":
                    self.timePreto += " \(self.txtFieldNome.text!.uppercased()) "
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME PRETO", imageName: "camisa-preta")
                    self.viewPreto.isHidden = false
                    
                case "time 6":
                    self.timeAmarelo += " \(self.txtFieldNome.text!.uppercased()) "
                    self.txtFieldNome.resignFirstResponder()
                    self.showAlertTeam(titleAlert: self.txtFieldNome.text!.uppercased(), messageAlert: "TIME AMARELO", imageName: "camisa-amarela")
                    self.viewAmarelo.isHidden = false
                default:
                    self.timeAmarelo += " \(self.txtFieldNome.text!.uppercased()) "
                }
                
                self.lblTimeVerde.text = "\(self.timeVerde)"
                self.lblTimeLaranja.text = "\(self.timeLaranja)"
                self.lblTime1.text = "\(self.timeAzul)"
                self.lblTime2.text = "\(self.timeVermelho)"
                self.lblTime3.text = "\(self.timePreto)"
                self.lblTime4.text = "\(self.timeAmarelo)"
                
                self.txtFieldNome.text = ""
                numeroJogadores = numeroJogadores - 1
                self.labelRestante.text = "Restam = \(numeroJogadores)"
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupLayout()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func showAlertTeam(titleAlert: String, messageAlert: String, imageName: String){
        let alertController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        let image = UIImage(named: imageName)
        alertController.addImage(image: image!)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupLayout(){
        self.txtFieldNome.delegate = self
        self.hideKeyboard()
        self.labelRestante.text = "Restam = \(numeroJogadores)"
        self.viewVerde.isHidden = true
        self.viewLaranja.isHidden = true
        self.viewAzul.isHidden = true
        self.viewVermelho.isHidden = true
        self.viewPreto.isHidden = true
        self.viewAmarelo.isHidden = true
        self.viewVerde.layer.cornerRadius = 8
        self.viewVerde.layer.borderColor = UIColor.green.cgColor
        self.viewVerde.layer.borderWidth = 2
        self.viewLaranja.layer.cornerRadius = 8
        self.viewLaranja.layer.borderColor = UIColor.orange.cgColor
        self.viewLaranja.layer.borderWidth = 2
        self.viewAzul.layer.cornerRadius = 8
        self.viewAzul.layer.borderColor = UIColor.blue.cgColor
        self.viewAzul.layer.borderWidth = 2
        self.viewVermelho.layer.cornerRadius = 8
        self.viewVermelho.layer.borderColor = UIColor.red.cgColor
        self.viewVermelho.layer.borderWidth = 2
        self.viewPreto.layer.cornerRadius = 8
        self.viewPreto.layer.borderColor = UIColor.black.cgColor
        self.viewPreto.layer.borderWidth = 2
        self.viewAmarelo.layer.cornerRadius = 8
        self.viewAmarelo.layer.borderColor = UIColor.yellow.cgColor
        self.viewAmarelo.layer.borderWidth = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        geradorDeTime(jogadoresPorTimes: jogadoresPorTime)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (self.txtFieldNome.text?.contains(" "))!{
            let alerta = UIAlertController(title: "Atenção", message: "Por favor insira um nome sem espaços", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
            self.txtFieldNome.text = ""
            return false
        } else {
            selecionaJogadores()
        }
        
        
        //self.txtFieldNome.resignFirstResponder()
        return true
    }
    
    @IBAction func actionResetar(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension Array {
    var randomElement: Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
