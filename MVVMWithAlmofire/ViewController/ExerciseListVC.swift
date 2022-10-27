//
//  ExerciseListVC.swift
//  MVVMWithAlmofire
//
//  Created by Amit on 30/09/22.
//

import UIKit

class ExerciseListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet var tblList :UITableView!
    var arrExerciseList = [ExcerciseViewModel]()


    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.rowHeight = UITableView.automaticDimension
        tblList.estimatedRowHeight = 44.0;
        // Do any additional setup after loading the view.
        self.getData()
    }
    
    func getData(){
        Services.sharedInstance.getData { excersice, Error in
            if Error == nil{
                self.arrExerciseList = excersice?.map({return ExcerciseViewModel(exerciseListModel: $0)}) ?? []
                DispatchQueue.main.async {
                    self.tblList.reloadData()
                }
            
            }
        }
    }
    
    //MARK :UITbaleView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrExerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : tblExerciseListCell = tableView.dequeueReusableCell(withIdentifier: "tblExerciseListCell", for: indexPath) as! tblExerciseListCell
        let mvvm = arrExerciseList[indexPath.row]
        cell.setData(name: mvvm.name, description: mvvm.exercisedescription)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
