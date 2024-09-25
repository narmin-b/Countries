//
//  InfoViewController.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 07.09.24.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet private weak var cityImage: UIImageView!
    @IBOutlet private weak var cityData: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        generateInfo()
    }
    
    fileprivate func generateInfo() {
        switch country {
        case UIImage(named: "aze"):
            switch city {
            case "Baku":
                cityImage.image = UIImage(named: "bakuImg")
                cityData.text = String(data: (NSDataAsset(name: "baku")!).data, encoding: .utf8)
            case "Ganja":
                cityImage.image = UIImage(named: "genceImg")
                cityData.text = String(data: (NSDataAsset(name: "gence")!).data, encoding: .utf8)
            case "Mingachevir":
                cityImage.image = UIImage(named: "mingecevirImg")
                cityData.text = String(data: (NSDataAsset(name: "mingecevir")!).data, encoding: .utf8)
            case "Shusha":
                cityImage.image = UIImage(named: "shushaImg")
                cityData.text = String(data: (NSDataAsset(name: "shusha")!).data, encoding: .utf8)
            default:
                return
            }
        case UIImage(named: "spain"):
            switch city {
            case "Madrid":
                cityImage.image = UIImage(named: "madridImg")
                cityData.text = String(data: (NSDataAsset(name: "madrid")!).data, encoding: .utf8)
            case "Seville":
                cityImage.image = UIImage(named: "bakuImg")
                cityData.text = String(data: (NSDataAsset(name: "baku")!).data, encoding: .utf8)
            case "Valencia":
                cityImage.image = UIImage(named: "valenciaImg")
                cityData.text = String(data: (NSDataAsset(name: "valencia")!).data, encoding: .utf8)
            case "Barcelona":
                cityImage.image = UIImage(named: "barcelonaImg")
                cityData.text = String(data: (NSDataAsset(name: "barcelona")!).data, encoding: .utf8)
            default:
                return
            }
        case UIImage(named: "italy"):
            switch city {
            case "Rome":
                cityImage.image = UIImage(named: "romeImg")
                cityData.text = String(data: (NSDataAsset(name: "rome")!).data, encoding: .utf8)
            case "Venice":
                cityImage.image = UIImage(named: "veniceImg")
                cityData.text = String(data: (NSDataAsset(name: "venice")!).data, encoding: .utf8)
            case "Florence":
                cityImage.image = UIImage(named: "florenceImg")
                cityData.text = String(data: (NSDataAsset(name: "florence")!).data, encoding: .utf8)
            case "Milan":
                cityImage.image = UIImage(named: "milanImg")
                cityData.text = String(data: (NSDataAsset(name: "milan")!).data, encoding: .utf8)
            default:
                return
            }
        case UIImage(named: "poland"):
            switch city {
            case "Gdansk":
                cityImage.image = UIImage(named: "gdanskImg")
                cityData.text = String(data: (NSDataAsset(name: "gdansk")!).data, encoding: .utf8)
            case "Krakow":
                cityImage.image = UIImage(named: "krakowImg")
                cityData.text = String(data: (NSDataAsset(name: "krakow")!).data, encoding: .utf8)
            case "Poznan":
                cityImage.image = UIImage(named: "poznanImg")
                cityData.text = String(data: (NSDataAsset(name: "poznan")!).data, encoding: .utf8)
            case "Warsaw":
                cityImage.image = UIImage(named: "warsawImg")
                cityData.text = String(data: (NSDataAsset(name: "warsaw")!).data, encoding: .utf8)
            default:
                return
            }
        default:
            return
        }
    }
}

