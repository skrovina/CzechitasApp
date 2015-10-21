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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        //predelame si objekt z tridy MKAnnotation do nasi tridy POIAnnotation
        let poiAnnotation = self.annotation as! POIAnnotation
        
        
        //obrazky pochazeji z http://www.freepik.com/free-vector/vectors_802102.htm - Designed by Freepik
        
        
        
        //a podle typu tomu pak nacteme spravny obrazek
        //vsimnete si ze mame obrazky bar.png a bar@2x.png - ty jsou pro ruzne rozliseni displeju, ale my to nemusime resit
        //pro mensi se pouziva bar.png a pro vetsi bar@2x.png - to @2x tam rika ze je to pro displeje 2x vetsi nez zakladni
        //system uz se rozhodne sam jestli bude pouzivat bar.png nebo bar@2x.png, my proste rekneme ze se jmenuje bar
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