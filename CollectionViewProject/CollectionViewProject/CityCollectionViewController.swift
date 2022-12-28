//
//  CityCollectionViewController.swift
//  CollectionViewProject
//
//  Created by Sawan Rana on 08/06/22.
//

import UIKit

class CityCollectionViewController: UICollectionViewController {
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
    private var cities: [CityCollectionViewCellModel] = [
        CityCollectionViewCellModel(image: "Ankara", name: "Ankara"),
        
        CityCollectionViewCellModel(image: "Antalya", name: "Antalya"),
        
        CityCollectionViewCellModel(image: "Aydin", name: "Aydin"),
        
        CityCollectionViewCellModel(image: "Bodrum", name: "Bodrum"),
        
        CityCollectionViewCellModel(image: "Canakkale", name: "Canakkale"),
        
        CityCollectionViewCellModel(image: "Cappadocia", name: "Cappadocia"),
        
        CityCollectionViewCellModel(image: "Efes", name: "Efes"),
        
        CityCollectionViewCellModel(image: "Eskisehir", name: "Eskisehir"),
        
        CityCollectionViewCellModel(image: "Fethiye", name: "Fethiye"),
        
        CityCollectionViewCellModel(image: "Istanbul", name: "Istanbul"),
        
        CityCollectionViewCellModel(image: "Izmir", name: "Izmir"),
        
        CityCollectionViewCellModel(image: "Mardin", name: "Mardin"),
        
        CityCollectionViewCellModel(image: "Nemrut", name: "Nemrut"),
        
        CityCollectionViewCellModel(image: "Pamukkale", name: "Pamukkale"),
        
        CityCollectionViewCellModel(image: "Patara", name: "Patara"),
        
        CityCollectionViewCellModel(image: "Rize", name: "Rize"),
        
        CityCollectionViewCellModel(image: "Salda", name: "Salda"),
        
        CityCollectionViewCellModel(image: "Sumela", name: "Sumela")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "City(s)"
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120.0, height: 120.0)
        self.collectionView.register(CityCollectionViewCell.nib(), forCellWithReuseIdentifier: CityCollectionViewCell.resuseIdentifier)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage" {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destination = segue.destination as! CityImageViewController
                let city = cities[indexPaths[0].row]
                destination.city = city
                collectionView.deselectItem(at: indexPaths[0], animated: true)
            }
        }
    }

}

extension CityCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.resuseIdentifier, for: indexPath) as! CityCollectionViewCell
        let cityModel = cities[indexPath.row]
        collectionViewCell.configureWith(model: cityModel)
        return collectionViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showImage", sender: nil)
    }
    
}

extension CityCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 15, height: 120.0)
    }
}
