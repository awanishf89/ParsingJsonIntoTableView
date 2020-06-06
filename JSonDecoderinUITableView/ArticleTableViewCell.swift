//
//  ArticleTableViewCell.swift
//  JSonDecoderinUITableView
//
//  Created by Awanish Sharma on 06/06/20.
//  Copyright © 2020 Awanish Sharma. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var articleContentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
