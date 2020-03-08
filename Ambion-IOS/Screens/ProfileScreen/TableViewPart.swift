//
//  TableViewPart.swift
//  Ambion-IOS
//
//  Created by Ashot Martirosyan on 3/7/20.
//  Copyright © 2020 Ashot Martirosyan. All rights reserved.
//

import UIKit

class TableViewPart {
 
    private let this: ProfileViewController!
    private var tableView: UITableView!
    
    required init(this: ProfileViewController) {
        self.this = this
        tableView = createTableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
//        tableView.delegate = this
//        tableView.dataSource = this
    }
 
    
    func createTableView() -> UITableView{
        let tableView = UITableView()
        tableView.layer.cornerRadius = 15
        tableView.layer.masksToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        this.containerView.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: this.containerView.topAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: this.containerView.rightAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: this.containerView.leftAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: this.containerView.bottomAnchor, constant: 0)
           ])
        return tableView
    }
}

//extension ProfileViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
//
//extension ProfileViewController: UITableViewDelegate{
//    
//}
