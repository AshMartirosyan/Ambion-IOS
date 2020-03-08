//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class DatePart{

    private let this: ProfileViewController!
    private var dateView: UIView!
    private var photoView: UIImageView!
    private var nameLabel:UILabel!
    private var facultyLabel: UILabel!
    private var groupeLabel: UILabel!

    required init(this: ProfileViewController) {
        self.this = this
        dateView = createDateView()
        photoView = createPhotoView()
        nameLabel = createNameLabel()
        facultyLabel = createFacultyLabel()
        groupeLabel = createGroupLabel()
    }
    
    func createDateView() -> UIView{
        let dateView = UIView()
        dateView.translatesAutoresizingMaskIntoConstraints = false
        this.view.addSubview(dateView)
        NSLayoutConstraint.activate([
            dateView.topAnchor.constraint(equalTo: this.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            dateView.rightAnchor.constraint(equalTo: this.view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            dateView.leftAnchor.constraint(equalTo: this.view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            dateView.bottomAnchor.constraint(equalTo: this.containerView.topAnchor, constant: 0)
        ])
        return dateView
    }

    func createPhotoView() -> UIImageView{
        let photoView = UIImageView(image: UIImage(named: "profilePhoto"))
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 50
        photoView.backgroundColor = #colorLiteral(red: 0.5490647444, green: 1, blue: 0.1500946382, alpha: 1)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        dateView.addSubview(photoView)
        NSLayoutConstraint.activate([
            photoView.centerXAnchor.constraint(equalTo: dateView.centerXAnchor, constant: 0),
            photoView.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 30),
            photoView.widthAnchor.constraint(equalToConstant: 100),
            photoView.heightAnchor.constraint(equalToConstant: 100)
        ])
        return photoView
    }

    func createNameLabel() -> UILabel{
        let nameLabel = UILabel()
        nameLabel.text = "Աշոտ Մարտիրոսյան"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        nameLabel.textColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor, constant: 0),
        ])
        return nameLabel
    }
    
    func createFacultyLabel() -> UILabel{
        let facultyLabel = UILabel()
        facultyLabel.text = "ԻԿՄ"
        facultyLabel.textColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        facultyLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        facultyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateView.addSubview(facultyLabel)
        NSLayoutConstraint.activate([
            facultyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            facultyLabel.leftAnchor.constraint(equalTo: dateView.centerXAnchor, constant: -75)
        ])
        return facultyLabel
    }

    func createGroupLabel() -> UILabel{
        let groupLabel = UILabel()
        groupLabel.text = "701"
        groupLabel.textColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        groupLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        groupLabel.translatesAutoresizingMaskIntoConstraints = false
        dateView.addSubview(groupLabel)
        NSLayoutConstraint.activate([
            groupLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            groupLabel.rightAnchor.constraint(equalTo: dateView.centerXAnchor, constant: 75)
        ])
        return facultyLabel
    }
}
