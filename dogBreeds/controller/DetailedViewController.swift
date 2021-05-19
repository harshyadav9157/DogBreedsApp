//
//  DetailedViewController.swift
//  dogBreeds
//
//  Created by harsh yadav on 19/05/21.
//

import UIKit
import Kingfisher

class DetailedViewController: UITableViewController {
    
    @IBOutlet weak var lblBreed: UILabel!
    @IBOutlet weak var lblTemprament: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblLifeSpan: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    var strName : String = ""
    var strLifeSpan : String = ""
    var strBreed : String = ""
    var strOrigin : String = ""
    var strTemperament : String = ""
    

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Details"
            lblName.text = strName
            lblLifeSpan.text = strLifeSpan
            lblBreed.text = strBreed
            lblOrigin.text = strOrigin
            lblTemprament.text = strTemperament
        }
    
}
