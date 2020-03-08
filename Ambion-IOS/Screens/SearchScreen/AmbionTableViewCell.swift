//  Copyright © 2020 Ashot Martirosyan. All rights reserved.


import UIKit

class AmbionTableViewCell: UITableViewCell {
    
    public var ambionImageView:UIImageView!
    public var ambionNameLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        ambionImageView = createAmbionImageView()
        ambionNameLabel = createAmbionNamelabel()
    }
    
    func createAmbionImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 72),
            imageView.widthAnchor.constraint(equalToConstant: 72),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ])
        return imageView
    }
    
    func createAmbionNamelabel() -> UILabel{
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 3
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: ambionImageView.rightAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -56)
        ])
        return nameLabel
    }
}
