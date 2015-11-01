//
//  AppDelegate.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 20/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import UIKit
import MapKit
import CoreData

//tady budeme skladovat anotace co jsme si uz vyrobili, k premennej je pristup zo vsetkych suborov
var arrayOfPOIAnnotations = [POIAnnotation]()



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        loadPOIDataFromPlist()
        
        return true
	}
	
	func loadPOIDataFromPlist() {

		//nacteme obsah souboru POIs.plist do array
		if let filePath = NSBundle.mainBundle().pathForResource("POIs", ofType: "plist")
		{
			let pois = NSArray(contentsOfFile: filePath)

			//projdeme to zaznam po zaznamu a nacteme data
			for poi in pois! {

				let point = CGPointFromString(poi["location"] as! String)
				let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
				let title = poi["name"] as! String
				let typeRawValue = Int((poi["type"] as! String))!
				let type = POIType(rawValue: typeRawValue)!
				let subtitle = poi["subtitle"] as! String

				//vyrobime podle dat anotaci
				let annotation = POIAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)

				//ulozime si ji
				arrayOfPOIAnnotations.append(annotation)
			}
		}
	}

}

