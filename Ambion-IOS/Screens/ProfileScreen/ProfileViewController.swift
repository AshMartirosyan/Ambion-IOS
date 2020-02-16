//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class ProfileViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    private var tableView:UITableView!

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

        safeArea = view.safeAreaLayoutGuide
        tableView = setTableView()
        
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
    
    func setTableView() -> UITableView{
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 300),
            tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
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
