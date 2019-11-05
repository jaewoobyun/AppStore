//
//  Ratings&Reviews.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/04.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class Ratings_Reviews: UIViewController {

	@IBOutlet weak var rating: UILabel!
	
	@IBOutlet weak var fivestarRating: UIProgressView!
	@IBOutlet weak var fourstarRating: UIProgressView!
	@IBOutlet weak var threestarRating: UIProgressView!
	@IBOutlet weak var twostarRating: UIProgressView!
	@IBOutlet weak var onestarRating: UIProgressView!
	
	@IBOutlet weak var totalRatings: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ReviewCell: UIView {
	
}
