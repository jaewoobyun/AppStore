//
//  HeaderTableViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/24.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
//    var smallTitle: UILabel = {
//       let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 10)
//        label.text = "10월 23일 수요일"
//        label.textColor = UIColor.white
//        return label
//    }()
//    
//    var LargeTitle: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 40)
//        label.text = "투데이"
//        label.textColor = UIColor.white
//        
//        return label
//    }()
//    
//    var avatarImage: UIImageView = {
//       let imageView = UIImageView()
//        imageView.image = UIImage(named: "")//
//        imageView.layer.cornerRadius = 20
//        imageView.clipsToBounds = true
//        
//        return imageView
//    }()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIButton!
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profilePicture.layer.cornerRadius = 25
        profilePicture.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
