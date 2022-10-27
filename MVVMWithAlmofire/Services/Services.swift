//
//  Services.swift
//  MVVMWithAlmofire
//
//  Created by Amit on 30/09/22.
//

import UIKit
import Foundation
import Alamofire

class Services: NSObject {
    
    static let sharedInstance = Services()

//    func getData(completion:@escaping([ExcerciseModel]?, Error?) ->()){
//        let urlString = "https://wger.de/api/v2/exercise"
//
//      guard let url = URL(string: urlString) else {return}
//        URLSession.shared.dataTask(with: url) { (data, url, error) in
//            if let err = error{
//                completion(nil,err)
//                print("error \(err.localizedDescription)")
//            }else{
//                guard let data = data else {return}
//                do{
//                    var arrExcersieData = [ExcerciseModel]()
//                    let result = try JSONDecoder().decode(resultModel.self, from: data)
//
//                    for excecise in result.results{
//                        arrExcersieData.append(ExcerciseModel(name: excecise.name, description: excecise.description))
//                    }
//                    completion(arrExcersieData,nil)
//                }
//                catch let jsonErr{
//                    print("json error:\(jsonErr.localizedDescription)")
//                }
//            }
//        }.resume()
// }
    
    func getData(completion:@escaping([ExcerciseModel]?, Error?) -> ()){
        let strURL = "https://wger.de/api/v2/exercise"
        guard let url = URL(string: strURL) else{return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData{ response in
            if response.value != nil{
                
                do{
                    var arrExerciseData = [ExcerciseModel]()
                    let result = try JSONDecoder().decode(resultModel.self, from: response.data!)
                    
                    for exercise in result.results{
                        arrExerciseData.append(ExcerciseModel(name: exercise.name, description: exercise.description))
                    }
                    completion(arrExerciseData,nil)
                }
                catch let jsonError{
                    print("json error : \(jsonError.localizedDescription)")
                    completion(nil,nil)
                }
            }else{
                print("value is nil")
            }
        }
    }
}
