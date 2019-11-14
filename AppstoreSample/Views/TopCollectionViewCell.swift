//
//  TopCollectionViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/14.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var featuredLabel: UILabel!
	@IBOutlet weak var appNameLabel: UILabel!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		imageView.layer.cornerRadius = 10
		imageView.clipsToBounds = true
		
    }

}
