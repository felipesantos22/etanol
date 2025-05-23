//
//  HomeViewController.swift
//  etanol
//
//  Created by Felipe Santos on 22/05/25.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    private var price: [Price] = []
    private var context: NSManagedObjectContext!
    
    private var homeView: HomeView!
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        homeView.textFieldAlcool.delegate = self
        homeView.textFieldGasolina.delegate = self
        
        homeView.buttonCalculate.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        homeView.buttonReset.addTarget(self, action: #selector(clearResults), for: .touchUpInside)
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //            self.autenticarComFaceID()
        //        }
    }
    
    func savePrice(price: Double) {
        let newPrice = Price(context: context)
        newPrice.price = price
        
        do {
            try context.save()
            print("Salvo com sucesso!")
        } catch {
            print("Erro ao salvar: \(error.localizedDescription)")
        }
    }
    
    
    @objc func calculate() {
        guard let priceAlcoolText = homeView.textFieldAlcool.text?.replacingOccurrences(of: ",", with: "."),
              let priceGasolinaText = homeView.textFieldGasolina.text?.replacingOccurrences(of: ",", with: "."),
              let alcoolValue = Double(priceAlcoolText),
              let gasolinaValue = Double(priceGasolinaText),
              gasolinaValue != 0 else {
            homeView.labelResult.text = "Valores inválidos"
            return
        }
        
        let result = alcoolValue / gasolinaValue
        
        if result < 0.7 {
            homeView.labelResult.text = "Álcool é a melhor opção!"
        } else {
            homeView.labelResult.text = "Gasolina é a melhor opção!"
        }
        savePrice(price: result)
    }
    
    @objc func clearResults() {
        homeView.textFieldAlcool.text = ""
        homeView.textFieldGasolina.text = ""
        homeView.labelResult.text = "Resultado"
    }
    
    //    func autenticarComFaceID() {
    //        let contexto = LAContext()
    //        var erro: NSError?
    //        // Verifica se o dispositivo suporta Face ID (ou Touch ID)
    //        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &erro) {
    //            let motivo = "Autentique-se para continuar."
    //            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: motivo) { sucesso, erro in
    //                DispatchQueue.main.async {
    //                    if sucesso {
    //                        print("✅ Autenticação com Face ID bem-sucedida!")
    //                        // Prossiga para próxima tela ou desbloqueie a funcionalidade
    //                    } else {
    //                        print("❌ Falha na autenticação: \(erro?.localizedDescription ?? "Erro desconhecido")")
    //                    }
    //                }
    //            }
    //        } else {
    //            print("⚠️ Face ID/Touch ID não está disponível: \(erro?.localizedDescription ?? "Erro desconhecido")")
    //        }
    //    }
    
    
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

