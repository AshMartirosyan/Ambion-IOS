//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class ProfileViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    private var containerView: UIView!
    private var tableView:UITableView!
    private var containerViewTopConstrait: NSLayoutConstraint!

    var startingConstraint: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setViewControllers([self], animated: false)
        navigationItem.setHidesBackButton(true, animated:true)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        let bacgroundLayer = createBackgroundGradient()
        bacgroundLayer.frame = view.frame
        view.layer.insertSublayer(bacgroundLayer, at: 0)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        
        safeArea = view.safeAreaLayoutGuide
        containerView = createContainerView()
        tableView = createTableView()
        containerView.addGestureRecognizer(panGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
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

    func createBackgroundGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let color1 = UIColor(red: 87.0 / 255.0, green: 17.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 81.0 / 255.0, green: 80.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0).cgColor
        let color3 = UIColor(red: 43.0 / 255.0, green: 117.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.locations = [0.0, 0.75, 1.0]
        return gradientLayer
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
        panView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.7493397887)
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
    
    func createTableView() -> UITableView{
        
        let tableView = UITableView()
        tableView.layer.cornerRadius = 15
        tableView.layer.masksToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(tableView)
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
           ])

        return tableView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
