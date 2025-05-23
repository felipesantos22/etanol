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
    
    private var context: NSManagedObjectContext = UIApplication.viewContext
    
    private var homeView: HomeView!
    
    private var tableViewController = TableViewController()
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeView.textFieldAlcool.delegate = self
        homeView.textFieldGasolina.delegate = self
        
        homeView.buttonCalculate.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        homeView.buttonReset.addTarget(self, action: #selector(clearResults), for: .touchUpInside)
        
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
        tableViewController.fetchPrices()
    }
    
    @objc func clearResults() {
        homeView.textFieldAlcool.text = ""
        homeView.textFieldGasolina.text = ""
        homeView.labelResult.text = "Resultado"
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

