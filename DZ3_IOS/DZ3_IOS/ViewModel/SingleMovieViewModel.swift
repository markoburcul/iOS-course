//
//  SingleMovieViewModel.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 06/06/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation
import CoreData
import AERecord
import Alamofire
import Reachability

class SingleMovieViewModel{
    
    let movie: Movie
    let reachability = Reachability()!
    let baseUrl = "https://www.omdbapi.com/?apikey=b689819b"
    
    init(movie:Movie) {
        self.movie = movie
    }
    
    func fetchMovie(completion: @escaping (() -> Void)) -> Void {
        if(reachability.connection != .none){
            guard let url = URL(string: baseUrl) else {
                return
            }
            
            Alamofire.request(url,
                              method: .get,
                              parameters: ["t":self.movie.title!])
                .validate()
                .responseJSON{ response in
                    guard response.result.isSuccess else {
                        return
                    }
                    if let value = response.result.value as? [String: Any]{
                        self.movie.director = value["Director"] as? String
                        self.movie.genre = value["Genre"] as? String
                        self.movie.summary = value["Plot"] as? String
                        try? AERecord.Context.main.save()
                        completion()
                    }
                    return
            }
        }
    }
    
    
}
