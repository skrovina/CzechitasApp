//
//  NewPOIController.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 22/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import UIKit
import MapKit

class NewPOIController: UIViewController {
    
    //natahame si sem ze storyboardu outlety na dulezite veci
    
    @IBOutlet weak var longitudeInput: UITextField!
    @IBOutlet weak var latitudeInput: UITextField!
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var subtitleInput: UITextView!
    
    @IBOutlet weak var buttonCreate: UIButton!
    
    //tahle metoda se vola pote co se naloaduje view
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //metoda ktera se zavola po tapnuti na create
    @IBAction func touchedCreateButton(sender: AnyObject) {
        
        var type : POIType
        var long : Double = 0.0
        var lat : Double = 0.0
        var name : String = ""
        var subtitle : String = ""
        
        //podle toho co je napsane v type se nastavi nas typ te anotace
        switch typeInput.text! {
            case "bar":
            type = .POIBar
            break
            case "cafe":
            type = .POICafe
            break
            case "restaurant":
            type = .POIRestaurant
            break
            
        default:
            type = .POIDefault
            break
        }
        
        //nacteme longitude a latitude (je to text) a prevedeme to na desetine cislo
        long = Double(longitudeInput.text!)!
        
        lat = Double(latitudeInput.text!)!
        
        //nacteme nazev a popisek
        name = nameInput.text!
        subtitle = subtitleInput.text!
        
        //vyrobime podle dat anotaci
        let annotation = POIAnnotation(coordinate: CLLocationCoordinate2DMake(lat, long), title: name, subtitle: subtitle, type: type)
        
        //ulozime si ji
        arrayOfPOIAnnotations.append(annotation)
        
        //abychom informovali ze jsme neco vyrobili, hodime uzivateli upozorneni
        let myAlert = UIAlertController(title: "HOTOVO", message: "Přidali jsme nový bod zájmu!", preferredStyle: .Alert)
        //k upozorneni pridame tlacitko
        let myAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(myAction)
        //a cele to zobrazime
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
}