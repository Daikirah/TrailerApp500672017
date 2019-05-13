//
//  TrailerView.swift
//  TrailerApp500672017
//
//  Created by Joshua William on 12/05/2019.
//  Copyright © 2019 Joshua William. All rights reserved.
//

import Foundation
import UIKit

final class TrailerView: UITableViewCell{
    
    @IBOutlet weak var trailerDescription: UILabel!
    @IBOutlet weak var trailerTitle: UILabel!
    @IBOutlet weak var trailerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trailerTitle.text = nil
        trailerDescription.text = nil
        trailerImage.image = nil
    }
}


