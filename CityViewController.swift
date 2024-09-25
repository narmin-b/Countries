//
//  CityViewController.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import UIKit

class CityViewController: UIViewController, CollectionCellDelegate {

    @IBOutlet private weak var collection: UICollectionView!
    private var cities: [Cities] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        generateCities()
    }
    
    func generateCities() {
        switch country {
        case UIImage(named: "aze"):
            cities = [Cities(image: "bakuImg", name: "Baku"),
                      Cities(image: "genceImg", name: "Ganja"),
                      Cities(image: "mingecevirImg", name: "Mingachevir"),
                      Cities(image: "shushaImg", name: "Shusha")]
        case UIImage(named: "italy"):
            cities = [Cities(image: "romeImg", name: "Rome"),
                      Cities(image: "veniceImg", name: "Venice"),
                      Cities(image: "florenceImg", name: "Florence"),
                      Cities(image: "milanImg", name: "Milan")]
        case UIImage(named: "poland"):
            cities = [Cities(image: "gdanskImg", name: "Gdansk"),
                      Cities(image: "krakowImg", name: "Krakow"),
                      Cities(image: "poznanImg", name: "Poznan"),
                      Cities(image: "warsawImg", name: "Warsaw")]
        case UIImage(named: "spain"):
            cities = [Cities(image: "madridImg", name: "Madrid"),
                      Cities(image: "sevilleImg", name: "Seville"),
                      Cities(image: "valenciaImg", name: "Valencia"),
                      Cities(image: "barcelonaImg", name: "Barcelona")]
        default:
            return
        }
        collection.reloadData()
    }
    
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func didTapCellButton(_ cell: CollectionCell) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    
}


extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.configureCell(model: cities[indexPath.row] as CollectionCellProtocol)
        cell.delegate = self
        isCellTapped = true

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2 - 8, height: collectionView.frame.height/4)
    }
}
