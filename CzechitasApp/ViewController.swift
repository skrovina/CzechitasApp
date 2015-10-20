//
//  ViewController.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 20/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!//zabezpecuje propojeni do objektu view (nestaci sem rucne napsat! musime propojit s objektem ve view)
    
    
    //tahle metoda se vola pote co se naloaduje view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //stred mapy
        let center = CLLocationCoordinate2D(latitude: 49.2, longitude: 16.62)
        
        //spocitame jak siroky a vysoky vysek z mapy chceme minimalne ukazovat
        let span = MKCoordinateSpanMake(0.0, 0.06)//zemepisna sirka(latitude) staci 0.0 stupnu, ale delku(longitude) chceme alespon 0.06 stupne
        
        //spocitame co chceme zobrazovat podle toho kde je stred mapy a sirka zobrazovaneho vyrezu
        let region = MKCoordinateRegionMake(center, span)
        
        //nastavime to nasemu mapView -> protoze je IBOutlet propojeny s view ve storyboardu, tak se to tam promitne
        mapView.region = region
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



