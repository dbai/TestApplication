//
//  Page2ViewController.swift
//  TestApplication
//
//  Created by GrandFunk on 2017/4/27.
//  Copyright © 2017年 GrandFunk. All rights reserved.
//

import Foundation
import UIKit
import Contacts
import MapKit

class Page2ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var coordsFromAddress: CLLocationCoordinate2D = CLLocationCoordinate2D()
        取得地址座標(addressString: "新北市三重區成功路153號", completion: {coordsFromAddress in
        
            let address = [CNPostalAddressStreetKey: "三重區成功路153號",
                           CNPostalAddressCityKey: "新北市",
                           CNPostalAddressISOCountryCodeKey: "TW"]
        
            let place = MKPlacemark(coordinate: coordsFromAddress, addressDictionary: address)
        
            let mapItem = MKMapItem(placemark: place)
            mapItem.openInMaps(launchOptions: nil)
        })
    }
    
    func 取得地址座標(addressString: String, completion: @escaping (CLLocationCoordinate2D) -> Void) {
        CLGeocoder().geocodeAddressString(addressString, completionHandler: {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed with error: \(error!.localizedDescription)")
            }
            else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                completion((location?.coordinate)!)
            }
        })
    }
}
