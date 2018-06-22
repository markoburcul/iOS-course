//
//  MovieController.swift
//  Moviebase
//
//  Created by Marko Burčul on 05/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class MovieController: UIViewController, UIGestureRecognizerDelegate, EditViewControllerDelegate, SearchControllerDelegate  {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    var movie:Movie!
    weak var delegateForImage: MovieControllerImageDelegate!
    weak var delegateForDescription: MovieControllerDescriptionDelegate!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        tapGestureRecognizer.delegate = self
        self.movieImage.isUserInteractionEnabled = true
        self.movieImage.addGestureRecognizer(tapGestureRecognizer)
        
        self.setControllerElements()
        self.movieDescription.isEditable = false
        
        let rightBarButton = UIBarButtonItem(title:"Uredi", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myRightSideBarButtonItemTapped))
        let leftBarButton = UIBarButtonItem(title:"Povratak na pretragu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(myLeftSideBarButtonItemTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
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
            editController.editingSelected(description: self.movie.movieDescription)
            navController.pushViewController(editController, animated: true)
        }
    }
    
    func plotEdited(withText text: String) {
        self.movieDescription.text = text
    }
    
    func movieFound(movie: Movie) {
            self.movie = movie
    }

    func setControllerElements() {
        
        fetchImage(withUrl: URL(string:self.movie.imageURL))
        
        self.movieTitle?.text = self.movie.movieTitle
        self.movieYear?.text = self.movie.movieYear
        self.movieGenre?.text = self.movie.movieGenre
        self.movieDirector?.text = self.movie.movieDirector
        self.movieDescription?.text = self.movie.movieDescription
    }
    
    func fetchImage(withUrl url: URL?) {
        
        guard let url = url else {
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let imageContents = data {
                    DispatchQueue.main.async {
                        self.movieImage.image = UIImage(data: imageContents)
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            let imageScreen = ImageController()
            self.delegateForImage = imageScreen
            imageScreen.imageSelected(image: self.movieImage.image!)
            self.navigationController?.pushViewController(imageScreen, animated: true)
        }
    }

}
