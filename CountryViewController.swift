//
//  CountryViewController.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import UIKit


class CountryViewController: UIViewController, CollectionCellDelegate {
    
    @IBOutlet private weak var collection: UICollectionView!
    private var countries: [Countries] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollection()
        generateCountries()
    }
    
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func didTapCellButton(_ cell: CollectionCell) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "CityViewController") as! CityViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    fileprivate func generateCountries() {
        countries = [Countries(image: "aze", name: "Azerbaijan"),
                     Countries(image: "spain", name: "Spain"),
                     Countries(image: "italy", name: "Italy"),
                     Countries(image: "poland", name: "Poland")
        ]
        collection.reloadData()
    }
}

extension CountryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.configureCell(model: countries[indexPath.row] as CollectionCellProtocol)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2 - 8, height: collectionView.frame.height/4)
    }
}

extension UIView {
func addoverlay(color: UIColor = .black, alpha : CGFloat = 0.6) {
    let overlay = UIView()
    overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    overlay.frame = bounds
    overlay.backgroundColor = color
    overlay.alpha = alpha
    addSubview(overlay)
    }
}
