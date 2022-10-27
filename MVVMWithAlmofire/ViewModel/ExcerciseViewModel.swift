//
//  ExcersieViewModel.swift
//  MVVMWithAlmofire
//
//  Created by Amit on 30/09/22.
//

import Foundation

class ExcerciseViewModel : NSObject{
     var exercisedescription: String?
     var name: String?
    
    init(exerciseListModel : ExcerciseModel) {
        self.name = exerciseListModel.name
        self.exercisedescription = exerciseListModel.description
    }
}
