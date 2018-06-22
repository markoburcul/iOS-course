//
//  EditViewControllerDelegate.swift
//  Moviebase
//
//  Created by Marko Burčul on 05/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation
import UIKit


protocol MovieControllerImageDelegate: class {
    
    func imageSelected(image:UIImage)
}


protocol EditViewControllerDelegate: class {
    
    func plotEdited(withText text: String)
    
}


protocol SearchControllerDelegate:class{
    
    func movieFound(movie:Movie)
}


protocol MovieControllerDescriptionDelegate: class {
    
    func editingSelected(description:String)
}
