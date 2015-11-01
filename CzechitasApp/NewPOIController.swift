//
//  NewPOIController.swift
//  CzechitasApp
//
//  Created by Martin Vytrhlík on 22/10/15.
//  Copyright © 2015 Martin Vytrhlík. All rights reserved.
//

import UIKit
import MapKit

class NewPOIController: UITableViewController {
    
    //natahame si sem ze storyboardu outlety na dulezite veci
    
	@IBOutlet weak var nameInput: UITextField!
	@IBOutlet weak var poiTypeControl: UISegmentedControl!

    @IBOutlet weak var longitudeInput: UITextField!
    @IBOutlet weak var latitudeInput: UITextField!

    @IBOutlet weak var subtitleInput: UITextView!

    //tahle metoda se vola pote co se naloaduje view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //metoda ktera se zavola po tapnuti na create
    @IBAction func touchedCreateButton(sender: AnyObject) {

        let type : POIType

        //podle toho co je vybrane v type se nastavi nas typ te anotace
        switch self.poiTypeControl.selectedSegmentIndex {
            case 1:
            type = .POIBar
            break
            case 2:
            type = .POICafe
            break
            case 3:
            type = .POIRestaurant
            break
            
        default:
            type = .POIDefault
            break
        }

		//nacteme nazev a popisek
		let name = nameInput.text!
		let subtitle = subtitleInput.text!

		//nacteme longitude a latitude (je to text) a prevedeme to na desetine cislo
		if let long = Double(longitudeInput.text!)
			, lat = Double(latitudeInput.text!)
		{
			//vyrobime podle dat anotaci
			let annotation = POIAnnotation(coordinate: CLLocationCoordinate2DMake(lat, long), title: name, subtitle: subtitle, type: type)

			//ulozime si ji
			arrayOfPOIAnnotations.append(annotation)

			self.dismissViewControllerAnimated(true
				, completion: nil)
		} else {
			//abychom informovali ze zo zadanych dat nelze vytvorit POI, hodime uzivateli upozorneni
			let myAlert = UIAlertController(title: "Error in form", message: "Can't create a POI from inserted data.\n\nPlease enter valid longitude and latitude.", preferredStyle: .Alert)
			//k upozorneni pridame tlacitko
			let myAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
			myAlert.addAction(myAction)
			//a cele to zobrazime
			self.presentViewController(myAlert, animated: true, completion: nil)
		}
    }

	@IBAction func dismiss(sender: AnyObject) {
		self.dismissViewControllerAnimated(true
			, completion: nil)
	}
}