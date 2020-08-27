//
//  MainNewsCell.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//

import UIKit

class MainNewsCell: UITableViewCell {



    @IBOutlet var generalView: UIView!
    @IBOutlet var newsImg: UIImageView!
    @IBOutlet var newsTitleLbl: UILabel!
    @IBOutlet var newsDetailsLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        generalView.addShadowCornerRedius(cornerRadius: 10)
        newsImg.addShadowCornerRedius(cornerRadius: 10)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
