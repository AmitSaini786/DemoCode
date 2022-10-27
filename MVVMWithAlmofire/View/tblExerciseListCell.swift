//
//  tblExerciseListCell.swift
//  MVVMWithAlmofire
//
//  Created by Amit on 30/09/22.
//

import UIKit

class tblExerciseListCell: UITableViewCell {
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblDescription : UILabel!
    
    
    func setData(name:String?,description:String?){
        lblName.text = name
        lblDescription.text = description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
