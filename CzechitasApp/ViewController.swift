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
    
    @IBOutlet weak var mapControl: UISegmentedControl! //bazmek ktery pouzivame na prepinani typu mapy
    
    
    //tahle metoda se vola pote co se naloaduje view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        //bod reprezentujici stred mapy
        let center = CLLocationCoordinate2D(latitude: 49.2, longitude: 16.6)
        
        //spocitame jak siroky a vysoky vysek z mapy chceme minimalne ukazovat
        let span = MKCoordinateSpanMake(0.0, 0.06)//zemepisna sirka(latitude) staci 0.0 stupnu, ale delku(longitude) chceme alespon 0.06 stupne
        
        //spocitame co chceme zobrazovat podle toho kde je stred mapy a sirka zobrazovaneho vyrezu
        let region = MKCoordinateRegionMake(center, span)
        
        //nastavime to nasemu mapView -> protoze je IBOutlet propojeny s view ve storyboardu, tak se to tam promitne
        mapView.region = region
        
        //smazeme anotace ktere tam mohly zustat z drivejska
        mapView.removeAnnotations(mapView.annotations)
        
        //nahrajeme nase body zajmu
        addPOIPins()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //tahle metoda se vykona kdyz nekdo tapne na mapControl
    @IBAction func mapControlTouched(sender: AnyObject) {
        
        switch mapControl.selectedSegmentIndex {
            
        case 0:
            mapView.mapType = MKMapType.Standard //nastavi se standardni mapa
            break
            
        case 1:
            mapView.mapType = MKMapType.Satellite //nastavi se satelitni mapa
            break
            
        default:
            mapView.mapType = MKMapType.Satellite
            break
        }
    }
    
    //pridava piny na mapu
    func addPOIPins() {
        
        //projdeme si nagenerovane body a pridame je do mapy
        for annotation in arrayOfPOIAnnotations {
            mapView.addAnnotation(annotation)
        }
    }

    
    
    
    //budeme delat nase mapView jinak nez v generickem MKMapView, protoze my tam pridame navic nase body zajmu
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let poiView = POIAnnotationView(annotation: annotation, reuseIdentifier: "POI")//tady tam pridavame ty nase body zajmu
        poiView.canShowCallout = true //tohle nam ukaze bublinu po tapnuti na POI
        poiView.centerOffset = CGPointMake(0, -poiView.image!.size.height / 2); // posuneme zobrazovani obrazku tak aby spicka pinu mirila na nasi lokaci
        return poiView
    }
}



