//
//  POAnnotationView.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 20/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import UIKit
import MapKit

class POIAnnotationView: MKAnnotationView {
    // Required for MKAnnotationView
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // tohle se bude volat kdyz budeme vykreslovat POIAnnotationView
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        //predelame si objekt z tridy MKAnnotation do nasi tridy POIAnnotation
        let poiAnnotation = self.annotation as! POIAnnotation
        
        //a podle typu tomu pak nacteme spravny obrazek
        switch (poiAnnotation.type) {
        case .POIBar:
            image = UIImage(named: "bar")
        case .POICafe:
            image = UIImage(named: "cafe")
        case .POIRestaurant:
            image = UIImage(named: "restaurant")
        default:
            image = UIImage(named: "default")
        }
    }
    
    
}