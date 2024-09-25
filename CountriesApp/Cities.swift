//
//  Cities.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import Foundation

struct Cities {
    let image: String
    var name: String
}

extension Cities: CollectionCellProtocol {
    var imageString: String {
        image
    }
    
    var labelString: String {
        name
    }
}
