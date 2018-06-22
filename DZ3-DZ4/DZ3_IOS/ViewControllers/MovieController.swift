//
//  MovieController.swift
//  Moviebase
//
//  Created by Marko Burčul on 05/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit
import AERecord

class MovieController: UIViewController, UIGestureRecognizerDelegate, EditViewControllerDelegate  {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    var viewModel:SingleMovieViewModel!
    weak var delegateForImage: MovieControllerImageDelegate!
    weak var delegateForDescription: MovieControllerDescriptionDelegate!
    
    convenience init(viewModel:SingleMovieViewModel){
        self.init()
        self.viewModel = viewModel

        if viewModel.movie.summary == nil{
            viewModel.fetchMovie{
                self.viewDidLoad()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        tapGestureRecognizer.delegate = self
        
        self.movieImage.isUserInteractionEnabled = true
        self.movieImage.addGestureRecognizer(tapGestureRecognizer)
        self.movieDescription.isEditable = false
        
        let rightBarButton = UIBarButtonItem(title:"Uredi", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myRightSideBarButtonItemTapped))
        let leftBarButton = UIBarButtonItem(title:"Povratak na pretragu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myLeftSideBarButtonItemTapped))
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        
    }
    
    func setupData(){
        if  let urlString = self.viewModel.movie.imageURL,
            let url = URL(string: urlString) {
            movieImage.kf.setImage(with: url)
        }
        self.movieTitle?.text = self.viewModel.movie.title
        self.movieTitle.adjustsFontSizeToFitWidth = true
        self.movieYear?.text = self.viewModel.movie.year
        self.movieGenre?.text = self.viewModel.movie.genre
        self.movieGenre.adjustsFontSizeToFitWidth = true
        self.movieDirector?.text = self.viewModel.movie.director
        self.movieDescription?.text = self.viewModel.movie.summary
    }

    @objc func myLeftSideBarButtonItemTapped() {
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @objc func myRightSideBarButtonItemTapped() {
        
        if let navController = self.navigationController {
            let editController = EditMovieController()
            editController.delegate = self
            if let summary = self.viewModel.movie.summary{
                editController.text = summary
            }else{
                editController.text = ""
            }
            navController.pushViewController(editController, animated: true)
        }
    }
    
    func plotEdited(withText text: String) {
        self.movieDescription.text = text
        self.viewModel.movie.summary = text
        try? AERecord.Context.main.save()
    }


    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            let imageScreen = ImageViewController()
            self.delegateForImage = imageScreen
            imageScreen.imageSelected(image: self.movieImage.image!)
            self.navigationController?.pushViewController(imageScreen, animated: true)
        }
    }

}
