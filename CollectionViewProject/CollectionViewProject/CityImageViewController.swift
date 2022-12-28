//
//  CityImageViewController.swift
//  CollectionViewProject
//
//  Created by Sawan Rana on 08/06/22.
//

import Foundation
import UIKit

class CityImageViewController: UIViewController {
    var city: CityCollectionViewCellModel?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    private var alertSeenOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryName.text = city?.cityName
        self.imageView.image = UIImage(named: city?.image ?? "")
        
        postAlert()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }
    
    private func postAlert() {
        
        let alert = UIAlertController(title: "Hello!", message: "You are in \(city!.cityName)", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
