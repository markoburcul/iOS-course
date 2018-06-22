//
//  SearchMovieController.swift
//  Moviebase
//
//  Created by Marko Burčul on 04/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit
import CoreData
import AERecord


class SearchMovieController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputSearch: UITextField!
    @IBOutlet weak var searchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputSearch.delegate = self
        let leftBarButton = UIBarButtonItem(title:"Odjava", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myLeftSideBarButtonItemTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.inputSearch.text = ""
    }
    @objc func myLeftSideBarButtonItemTapped() {
        
        if let navController = self.navigationController {
            let translateX = UIScreen.main.bounds.size.width
            UIView.animate(withDuration: 0.7, animations: {
                self.searchLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.inputSearch.transform = CGAffineTransform(translationX: translateX, y: 0)
            }, completion: {(finished:Bool) in
                 navController.popViewController(animated: true)
            })
        }
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let translatex = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: 0, animations: {
            self.inputSearch.transform = CGAffineTransform(translationX: translatex, y: 0)
            self.searchLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            self.inputSearch.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.searchLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text{
            let translateX = UIScreen.main.bounds.size.width
            UIView.animate(withDuration: 0.7, animations: {
                self.searchLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.inputSearch.transform = CGAffineTransform(translationX: -translateX, y: 0)
            }, completion: {(finished:Bool) in
                let model = MovieTableViewModel(searchString: text)
                let vc = TableViewController(viewModel: model)
                self.navigationController?.pushViewController(vc,animated: true)
            })
            
        }

        return true
    }

    
}
