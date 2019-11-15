//
//  ReviewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/06.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class ReviewCell: UIView {
	@IBOutlet weak var wrapper: UIView!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	@IBOutlet weak var fiveStarLabel: UILabel!
	@IBOutlet weak var nicknameLabel: UILabel!
	
	@IBOutlet weak var reviewContentLabel: UILabel!
	
	@IBOutlet weak var developerResponseDateLabel: UILabel!
	
	@IBOutlet weak var developerResponseLabel: UILabel!
	
	@IBAction func MoreButton(_ sender: UIButton) {
		print("more tapped")
	}
	//	private let xibName = "ReviewCell"
//
//	override init(frame: CGRect) {
//		 super.init(frame: frame)
//		 self.commonInit()
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		 super.init(coder: aDecoder)
//		 self.commonInit()
//	}
//
//	private func commonInit(){
//		 let view = Bundle.main.loadNibNamed("ReviewCell", owner: self, options: nil)?.first as! UIView
//		 view.frame = self.bounds
//		 self.addSubview(view)
//	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
