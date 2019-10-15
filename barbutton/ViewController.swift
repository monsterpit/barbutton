//
//  ViewController.swift
//  barbutton
//
//  Created by MB on 10/15/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let leftbarButton = UIBarButtonItem(image: resizeImage(image: UIImage(named: "back") ?? UIImage(), targetSize: CGSize(width: 30, height: 30)), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        self.navigationItem.leftBarButtonItem  = leftbarButton

            
     //   navigationItem.rightBarButtonItems = [item1]
    }
    
@objc
    func leftBarButtonTapped(){
    print("Hi")
    }
    
    func barButtontapped(){
        
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect =  CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
       
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
}


