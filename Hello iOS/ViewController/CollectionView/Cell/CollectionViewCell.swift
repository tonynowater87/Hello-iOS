//
//  CollectionCellCollectionViewCell.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setText(text: String) {
        backgroundColor = .green
        label.text = text
    }
}
