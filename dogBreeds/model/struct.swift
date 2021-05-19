//
//  struct.swift
//  dogBreeds
//
//  Created by harsh yadav on 25/01/21.
//

import Foundation
import SwiftyJSON
import Kingfisher

struct jsonModel : Decodable {
    
    var name : String!  = " "
    var bred_for : String! = " "
    var life_span : String! = " "
    var temperament : String! = " "
    var origin : String! = " "
    var url : String! = " "
    let image : picture


}

struct picture : Decodable {
    var url : String!

}

