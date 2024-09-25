//
//  CollectionCell.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import UIKit

var isCellTapped: Bool = false
public var country: UIImage = UIImage()
public var city: String = ""

protocol CollectionCellDelegate: AnyObject {
    func didTapCellButton(_ cell: CollectionCell)
}

protocol CollectionCellProtocol {
    var imageString: String {get}
    var labelString: String {get}
}

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellLabel: UILabel!
    
    var delegate: CollectionCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.textColor = .white
//        cellButton.layer.cornerRadius = 4
        cellButton.imageView?.layer.cornerRadius = 4
    }
    
    func configureCell(model: CollectionCellProtocol) {
        cellLabel.text = model.labelString
        cellButton.setImage(UIImage(named: model.imageString), for: .normal)
        cellButton.imageView?.contentMode = .scaleAspectFill
        cellButton.imageView?.addoverlay(alpha: 0.2)
    }
    
    @IBAction func cellSelected(_ sender: UIButton!) {
        
        if !isCellTapped {
            country = (sender.imageView?.image)!
            print(country)
        } 
        if isCellTapped {
            city = cellLabel.text!
            print(city)
        }
        isCellTapped = true
        delegate?.didTapCellButton(self)
    }
}


