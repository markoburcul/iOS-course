//
//  ImageViewController.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 18/06/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, MovieControllerImageDelegate, UIScrollViewDelegate {

    @IBOutlet var scrollArea: UIScrollView!
    @IBOutlet var imageArea: UIImageView!
    var image:UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.imageArea.image = self.image
        
        scrollArea.minimumZoomScale = 1.0
        scrollArea.maximumZoomScale = 5.0
        let leftBarButton = UIBarButtonItem(title:"Natrag na film", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myLeftSideBarButtonItemTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    
    
    @objc func myLeftSideBarButtonItemTapped() {
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    

    func imageSelected(image: UIImage) {
        
        self.image = image
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageArea
    }

}
