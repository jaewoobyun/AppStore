//
//  CollectionBaseVC.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/13.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class CollectionBaseVC: UIViewController {

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

extension CollectionBaseVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
		cell.appIconImage.image = UIImage(systemName: "magnifyingglass")
		cell.appIconImage.layer.cornerRadius = 25
		cell.appIconImage.clipsToBounds = true
		
		cell.appNameLabel.text = "Hello"
		cell.appCategoryLabel.text = "World"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
			let lineSpacing = Metric.lineSpacing * (Metric.numberOfLine - 1)
			let horizontalPadding = Metric.leftPadding + Metric.rightPadding
			let itemSpacing = Metric.itemSpacing * (Metric.numberOfItem - 1)
			let verticalPadding = Metric.topPadding + Metric.bottomPadding
			let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / Metric.numberOfLine
			let height = (collectionView.frame.height - itemSpacing - verticalPadding) / Metric.numberOfItem
	//		let width = self.popularCollectionView.frame.width - 10
	//		let height = (self.popularCollectionView.frame.height / 2) - Metric.lineSpacing
			
			
			return CGSize(width: width, height: height)
		}
		
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
			return Metric.lineSpacing
		}
		
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
			return Metric.lineSpacing
		}
		
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
			return UIEdgeInsets(top: Metric.topPadding, left: Metric.leftPadding, bottom: Metric.bottomPadding, right: Metric.rightPadding)
		}
	
}


