//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class ProfileViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    
    public var containerView: UIView!
    private var tableView:UITableView!
    public var containerViewTopConstrait: NSLayoutConstraint!
    private var firstNameLabel: UILabel!
    private var lastNameLabel: UILabel!
    private var notBookingView: UIView!
    private var addButton: UIButton!

    var startingConstraint: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setViewControllers([self], animated: false)
        navigationItem.setHidesBackButton(true, animated:true)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        let bacgroundLayer = createBaseBackgroundGradient()
        bacgroundLayer.frame = view.frame
        view.layer.insertSublayer(bacgroundLayer, at: 0)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        

        safeArea = view.safeAreaLayoutGuide
        containerView = createContainerView()
        
        containerView.addGestureRecognizer(panGesture)

        
        _ = DatePart(this: self)
        
        
    }

    func createBaseBackgroundGradient() -> CAGradientLayer {
        let baseGradientLayer = CAGradientLayer()
        let color1 = UIColor(red: 87.0 / 255.0, green: 17.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 81.0 / 255.0, green: 60.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0).cgColor
        let color3 = UIColor(red: 43.0 / 255.0, green: 117.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0).cgColor
        baseGradientLayer.colors = [color1, color2, color3]
        baseGradientLayer.locations = [0.0, 0.75, 1.0]
        return baseGradientLayer
    }

    override func viewWillAppear(_ animated: Bool) {
        if DataSource.isEntered == true{
            _ = TableViewPart(this: self)
        }else{
            notBookingView = createNotBookingView()
            addButton = createAddButton()
        }
    }
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            self.startingConstraint = self.containerViewTopConstrait.constant
        case .changed:
            let translation = sender.translation(in: self.view)
            if translation.y <= 200.0{
                self.containerViewTopConstrait.constant = startingConstraint + translation.y
            }else{
                self.containerViewTopConstrait.constant = 400.0
            }
        case .ended:
            if self.containerViewTopConstrait.constant <= 200{
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                    self.containerViewTopConstrait.constant = 200
                    self.view.layoutIfNeeded()
                })
            }else{
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                    self.containerViewTopConstrait.constant = 300
                    self.view.layoutIfNeeded()
                })
            }
        default:
            break
        }
    }
    
    func createAddButton() -> UIButton{
        let addButton = UIButton(type: .custom)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = #colorLiteral(red: 0.3607843137, green: 0.1215686275, blue: 0.3176470588, alpha: 1)
        addButton.setTitle("Գրանցվել", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1) ,for: .normal)
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        notBookingView.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50),
            addButton.centerXAnchor.constraint(equalTo: notBookingView.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 300),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        let infoLabel = UILabel()
        infoLabel.text = "Դուք այս պահին չունեք գրանցված կուրսային աշխատանք"
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        infoLabel.textColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        infoLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        notBookingView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -200),
            infoLabel.centerXAnchor.constraint(equalTo: notBookingView.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 400),
            infoLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        return addButton
    }
    
    @objc func addButtonClicked(){
        let chooseTableViewController = AmbionsTableViewController()
        self.present(chooseTableViewController, animated: true, completion: nil)
    }

    func createNotBookingView() -> UIView{
        let notBookingView = UIView()
        notBookingView.translatesAutoresizingMaskIntoConstraints = false
        notBookingView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.06666666667, blue: 0.2901960784, alpha: 0.5)
        notBookingView.layer.cornerRadius = 15
        containerView.addSubview(notBookingView)
        NSLayoutConstraint.activate([
            notBookingView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            notBookingView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            notBookingView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            notBookingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        return notBookingView
    }
    
    

    func createContainerView() -> UIView{
        let containerView = UIView()
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        self.containerViewTopConstrait = containerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200)
        self.containerViewTopConstrait.isActive = true
        NSLayoutConstraint.activate([
            containerView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
               ])

        let panView = UIView()
        panView.translatesAutoresizingMaskIntoConstraints = false
        panView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        panView.layer.cornerRadius = 5
        containerView.addSubview(panView)
        NSLayoutConstraint.activate([
            panView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            panView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            panView.widthAnchor.constraint(equalToConstant: 60),
            panView.heightAnchor.constraint(equalToConstant: 10)
        ])
        return containerView
    }

}

