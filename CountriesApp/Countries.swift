//
//  Countries.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import Foundation


struct Countries {
    let image: String
    var name: String
}

extension Countries : CollectionCellProtocol {
    var imageString: String {
        image
    }
    
    var labelString: String {
        name
    }
}
