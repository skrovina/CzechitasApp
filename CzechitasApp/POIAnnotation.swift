//
//  POIOverlay.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 20/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import MapKit


//tento nas enum je nejaka mnozina pojmenovanych cisel. automaticky se zvysuje typicky od 0 ... cili kdyz zavolam POIBar tak to bude pri preveden na INT cislo 1 Muzeme si tam ale pripisovat dalsi nebo nejakemu natvrdo nastavit nejakou hodnotu, jako v tomto pripade POIDefault ma nastavenou natvrdo 0
enum POIType: Int {
    case POIDefault = 0
    case POIBar
    case POICafe
    case POIRestaurant
}



//tohle je nase trida reprezentujici jednu polozku na mape
class POIAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D//souradnice
    var title: String? = "POI" //nazev - nastavujeme defaultne na "POI", ale nemuseli bychom, jen pro ukazku jak se to dela
    var subtitle: String? //podtitulek
    var type: POIType //typ - budeme pouzivat pro rozliseni obrazkem na mape
    
    
    
    
    //inicializace(vyroba) noveho objektu tohoto typu - rikame ze to budme vyrabet se zadanim souradnic, nazvu, podtitulku a typu
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: POIType) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
    
    
}
