//
//  HomeView.swift
//  etanol
//
//  Created by Felipe Santos on 22/05/25.
//

import UIKit

class HomeView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "gasolina")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Álcool ou Gasolina?"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let textFieldAlcool: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Álcool"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.keyboardType = .numbersAndPunctuation
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let textFieldGasolina: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Gasolina"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.keyboardType = .numbersAndPunctuation
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let labelResult: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.text = "Resultado"
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonCalculate: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calcular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonReset: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Resetar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func setupViews() {
        
        addSubview(imageView)
        addSubview(label)
        addSubview(textFieldAlcool)
        addSubview(textFieldGasolina)
        addSubview(labelResult)
        addSubview(stackView)
        stackView.addArrangedSubview(buttonCalculate)
        stackView.addArrangedSubview(buttonReset)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            textFieldAlcool.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            textFieldAlcool.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieldAlcool.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textFieldAlcool.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldGasolina.topAnchor.constraint(equalTo: textFieldAlcool.bottomAnchor, constant: 40),
            textFieldGasolina.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieldGasolina.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textFieldGasolina.heightAnchor.constraint(equalToConstant: 50),
            
            labelResult.topAnchor.constraint(equalTo: textFieldGasolina.bottomAnchor, constant: 40),
            labelResult.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelResult.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: labelResult.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
