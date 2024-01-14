//
//  ExpTableViewCell.swift
//  ExCollectionView
//
//  Created by RLogixxTraining on 24/08/23.
//

import UIKit

class ExpTableViewCell: UITableViewCell {

    @IBOutlet weak var txtDescription: UILabel!
    @IBOutlet weak var txtname: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    
    @IBOutlet weak var btnChild: UIButton!
    @IBOutlet weak var btnMarried: UIButton!
    @IBOutlet weak var TxtVwYear: UILabel!
    @IBOutlet weak var txtBranch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
//    @IBAction func btnMarried(_ sender: Any) {
//        btnMarried.isEnabled = true
//    }
//
//    @IBAction func btnChild(_ sender: Any) {
//        btnChild.isEnabled = true
//
//    }
    
    
}
