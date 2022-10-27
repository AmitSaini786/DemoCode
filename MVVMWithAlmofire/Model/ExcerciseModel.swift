//
//  ExcersieModel.swift
//  MVVMWithAlmofire
//
//  Created by Amit on 30/09/22.
//

import Foundation

class ExcersieModel : Decodable{
    var name : String?
    var description : String?
    
    init(name:String?,description:String?) {
        self.name = name
        self.description = description
    }
}
