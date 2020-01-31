//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class SignInViewController: UIViewController {

    private var safeArea:UILayoutGuide!
    private var imageView: UIImageView!
    private var textField: CustomTextField!
    private var keyboardToolbar: UIToolbar!
    private var logInButton: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showFirstScreen))
        view.addGestureRecognizer(tapGesture)
        
        safeArea = view.safeAreaLayoutGuide
        imageView = setupImageView()
        textField = setupTextField()
        keyboardToolbar = setupKeyboardToolbar()
        logInButton = setupLogInButton()
        textField.delegate = self
    }

    
    
    
    func setupKeyboardToolbar() ->UIToolbar{
        let toolbar = UIToolbar(frame: CGRect(x: -0, y: -0, width: UIScreen.main.bounds.width, height: 40))
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(showFirstScreen))
        ]
        textField.inputAccessoryView = toolbar
        return toolbar
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

    func setupTextField() -> CustomTextField{
        let textField = CustomTextField()
        textField.placeholder = "Please enter your Id"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150),
            textField.widthAnchor.constraint(equalToConstant: 280),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ])
        return textField
    }

    func setupLogInButton()-> UIButton{
        let logInButton = UIButton()
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(#colorLiteral(red: 0.3607843137, green: 0.1215686275, blue: 0.3176470588, alpha: 1), for: .normal)
        logInButton.titleLabel?.textAlignment = .center
        logInButton.layer.cornerRadius = 10
        logInButton.layer.borderWidth = 2
        logInButton.layer.borderColor = #colorLiteral(red: 0.3607843137, green: 0.1215686275, blue: 0.3176470588, alpha: 1)
        logInButton.addTarget(self, action: #selector(logInClicked), for: .touchUpInside)
        view.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0),
            logInButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            logInButton.widthAnchor.constraint(equalToConstant: 140),
            logInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        return logInButton
    }
    
    @objc func logInClicked(){
        //TO DO
    }
    
    @objc func showFirstScreen(){
        textField.resignFirstResponder()
    }
    
    
}


extension SignInViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 8
    }
}
