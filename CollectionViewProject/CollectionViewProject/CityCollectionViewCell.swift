//
//  CityCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by Sawan Rana on 08/06/22.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    static let resuseIdentifier = "CityCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "CityCollectionViewCell", bundle: nil)
    }

    func configureWith(model: CityCollectionViewCellModel) {
        self.imageView.layer.cornerRadius = self.imageView.frame.height/2
        self.imageView.image = UIImage(named: model.image)
        self.cityName.text = model.cityName
    }
}

struct CityCollectionViewCellModel {
    var image: String = ""
    var cityName: String = ""
    
    init(image: String, name: String) {
        self.image = image
        self.cityName = name
    }
}
