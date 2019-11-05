//
//  Extensions.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/29.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
	func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
	func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

//MARK: - IndicatorView

var vSpinner: UIView?
extension UIViewController {
	
	func showSpinner(onView: UIView) {
		let spinnerView = UIView.init(frame: onView.bounds)
		spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
		let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
		ai.startAnimating()
		ai.center = spinnerView.center

		DispatchQueue.main.async {
			spinnerView.addSubview(ai)
			onView.addSubview(spinnerView)
		}

		vSpinner = spinnerView
	}

	func removeSpinner() {
		DispatchQueue.main.async {
			vSpinner?.removeFromSuperview()
			vSpinner = nil
		}
	}
	
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


extension String {
	 //Converts String to Int
	 public func toInt() -> Int? {
		  if let num = NumberFormatter().number(from: self) {
				return num.intValue
		  } else {
				return nil
		  }
	 }

	 //Converts String to Double
	 public func toDouble() -> Double? {
		  if let num = NumberFormatter().number(from: self) {
				return num.doubleValue
		  } else {
				return nil
		  }
	 }

	 /// EZSE: Converts String to Float
	 public func toFloat() -> Float? {
		  if let num = NumberFormatter().number(from: self) {
				return num.floatValue
		  } else {
				return nil
		  }
	 }

	 //Converts String to Bool
	 public func toBool() -> Bool? {
		  return (self as NSString).boolValue
	 }
}
