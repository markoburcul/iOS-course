//
//  ImageController.swift
//  Moviebase
//
//  Created by Marko Burčul on 05/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class ImageController: UIViewController, MovieControllerImageDelegate {
    
    var image:UIImage!
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView = UIImageView(image: self.image)
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)

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
    

}
