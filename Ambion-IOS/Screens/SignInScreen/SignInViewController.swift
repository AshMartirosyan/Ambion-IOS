//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class SignInViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    private var imageView: UIImageView!
    private var textField: CustomTextField!
    private var keyboardToolbar: UIToolbar!
    private var logInButton: UIButton!
    private var helperTextLabel: UILabel!
    
    private var idNumber: String = ""
    
    let dateModel = SignINModel()
    let profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bacgroundLayer = createBackgroundGradient()
        bacgroundLayer.frame = view.frame
        view.layer.insertSublayer(bacgroundLayer, at: 90)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showFirstScreen))
        view.addGestureRecognizer(tapGesture)
        
        safeArea = view.safeAreaLayoutGuide
        imageView = setupImageView()
        textField = setupTextField()
        helperTextLabel = setupHelperTextLabel()
        keyboardToolbar = setupKeyboardToolbar()
        logInButton = setupLogInButton()
        textField.delegate = self
        
        profileViewController.modalPresentationStyle = .fullScreen
        profileViewController.modalTransitionStyle = .flipHorizontal
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dateModel.subscribe(name: .SignInViewController)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dateModel.unsubscript()
    }
    
    func createBackgroundGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let color1 = UIColor(red: 87.0 / 255.0, green: 17.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 81.0 / 255.0, green: 80.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0).cgColor
        let color3 = UIColor(red: 43.0 / 255.0, green: 117.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.locations = [0.0, 0.75, 1.0]
        return gradientLayer
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
        let topConstraint = imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100)
        topConstraint.priority = UILayoutPriority(200)
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
        textField.layer.cornerRadius = 5
        textField.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150)
        topConstraint.priority = UILayoutPriority(rawValue: 500)
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150),
            textField.widthAnchor.constraint(equalToConstant: 280),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ])
        return textField
    }
    
    func setupHelperTextLabel() -> UILabel{
        let helperText = UILabel()
        helperText.clipsToBounds = true
        helperText.layer.cornerRadius = 4
        helperText.textColor = .red
        helperText.font = helperText.font.withSize(12)
        view.addSubview(helperText)
        helperText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helperText.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 12),
            helperText.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0),
            helperText.widthAnchor.constraint(equalToConstant: 256),
            helperText.heightAnchor.constraint(equalToConstant: 16)
        ])
        return helperText
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
            logInButton.topAnchor.constraint(equalTo: helperTextLabel.bottomAnchor, constant: 50),
            logInButton.widthAnchor.constraint(equalToConstant: 140),
            logInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        return logInButton
    }
    
    @objc func logInClicked(){
        guard let nuberOfTextChars = textField.text?.count,
            nuberOfTextChars < 8
            else {
                Dispatcher.dispatch(name: .SignInViewController, object: self, userInfo: ["idNumber": idNumber])
                self.navigationController?.pushViewController(profileViewController, animated: true)
                return
        }
        helperTextLabel.text = "Please set correct format"
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count ?? 0 < 8{
            helperTextLabel.text = "Please set correct format"
        }else{
            helperTextLabel.text = ""
            self.idNumber = textField.text ?? ""
        }
    }
}

