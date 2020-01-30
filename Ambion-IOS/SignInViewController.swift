//
//  ViewController.swift
//  Ambion-IOS
//
//  Created by Ashot Martirosyan on 1/27/20.
//  Copyright © 2020 Ashot Martirosyan. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    private var safeArea:UILayoutGuide!
    private var imageView: UIImageView!
    private var textField: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        imageView = setupImageView()
        textField = setupTextField()
    }
    
    
    func setupImageView() -> UIImageView{
        let image = UIImage(named: "SignInPage")
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        return imageView
    }
    
    func setupTextField() -> UITextField{
        let textField = UITextField()
        textField.placeholder = "Please enter your Id"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 200),
            textField.widthAnchor.constraint(equalToConstant: 280),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ])

        return textField
    }
    
    
}

