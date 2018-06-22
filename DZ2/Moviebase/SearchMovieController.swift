//
//  SearchMovieController.swift
//  Moviebase
//
//  Created by Marko Burčul on 04/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit


class SearchMovieController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputSearch: UITextField!
    weak var delegate: SearchControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputSearch.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.inputSearch.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text{
            if let movie = MovieDatabase.database.getMovie(title: text){
                let vc = MovieController()
                self.delegate = vc
                vc.movieFound(movie: movie)
                self.navigationController?.pushViewController(vc,animated: true)
            }
            else{
                let alert = UIAlertController(title: "Greška", message: "Film ne postoji u bazi", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }

        return true
    }

    
}
