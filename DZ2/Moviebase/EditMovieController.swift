//
//  EditMovieController.swift
//  Moviebase
//
//  Created by Marko Burčul on 04/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class EditMovieController: UIViewController, MovieControllerDescriptionDelegate {
    
    @IBOutlet weak var movieDescriptionView: UITextView!
    weak var delegate: EditViewControllerDelegate!
    var text:String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.movieDescriptionView.text = self.text
        let leftBarButton = UIBarButtonItem(title:"Natrag na film", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myLeftSideBarButtonItemTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    
    @objc func myLeftSideBarButtonItemTapped() {
        
        if let navController = self.navigationController {
            delegate?.plotEdited(withText: self.movieDescriptionView.text)
            navController.popViewController(animated: true)
        }
    }
    
    
    func editingSelected(description: String) {
        self.text = description
    }
    
    



}
