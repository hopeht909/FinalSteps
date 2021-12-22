//
//  PeopleDetails.swift
//  MVCInIOS
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class PeopleDetails: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirthYear: UILabel!
    @IBOutlet weak var lblMass: UILabel!
    
    var name: String?
    var gender: String?
    var birthYear: String?
    var mass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name,
           let gender = gender,
           let birthYear = birthYear,
           let mass = mass {
            
            lblName.text = "Name: \(String(describing: name))"
            lblGender.text = "Gender: \(String(describing: gender))"
            lblBirthYear.text = "Birth Year: \(String(describing: birthYear))"
            lblMass.text =  "Mass: \(String(describing: mass))"
        }
       
    }
}
