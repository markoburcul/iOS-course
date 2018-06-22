//
//  Movie.swift
//  Moviebase
//
//  Created by Marko Burčul on 04/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation

class MovieDatabase{
    
    static var database = MovieDatabase()
    private let movies:[Movie] = [
        Movie(imageURL:"https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1439,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1492113187/articles/2016/05/13/did-citizen-kane-predict-donald-trump/160513-schwartz-citizen-kane-trump-tease_yvvfbc",
              movieTitle:"Citizen Kane", movieYear:"1941",movieGenre:"Drama", movieDirector:"Orson Welles", movieDescription:"This is the labyrinthine study of the life of a newspaper tycoon."),
        Movie(imageURL:"https://images6.alphacoders.com/342/thumb-1920-342213.jpg", movieTitle:"North by Northwest", movieYear:"1959", movieGenre:"Mystery and Suspense", movieDirector:"Alfred Hitchcock", movieDescription:"Gripping, suspenseful, and visually iconic, this late-period Hitchcock classic laid the groundwork for countless action thrillers to follow."),
        Movie(imageURL:"https://resizing.flixster.com/YDm-KMElER5olKxCI3HqML6poM8=/206x305/v1.bTsxMTI5MjU0NDtqOzE3NzcwOzEyMDA7MTUzNjsyMDQ4", movieTitle:"Sunset Boulevard", movieYear:"1950", movieGenre:"Drama", movieDirector:"Billy Wilder", movieDescription:"Aging silent-film star Norma Desmond ensnares a young screenwriter in this poison-pen valentine to Hollywood."),
        Movie(imageURL:"https://i.pinimg.com/736x/9f/0d/01/9f0d0109366a3436c3751a7fadc5f690.jpg", movieTitle:"12 angry men", movieYear:"1957", movieGenre:"Drama", movieDirector:"Sidney Lumet", movieDescription:"Sidney Lumet's feature debut is a superbly written, dramatically effective courtroom thriller that rightfully stands as a modern classic.")
    ]
    
    private init(){}
    
    func getMovie(title:String)->Movie!{
        if let i = movies.first(where:{ $0.movieTitle == title }) {
            return i
        }
        return nil
    }

}


class Movie{
    
    var imageURL:String
    var movieTitle:String
    var movieYear:String
    var movieGenre:String
    var movieDirector:String
    var movieDescription:String
    
    init(imageURL:String, movieTitle:String, movieYear:String, movieGenre:String, movieDirector:String, movieDescription:String) {
        self.imageURL = imageURL
        self.movieTitle = movieTitle
        self.movieYear = movieYear
        self.movieGenre = movieGenre
        self.movieDirector = movieDirector
        self.movieDescription = movieDescription
    }
    
    
}
