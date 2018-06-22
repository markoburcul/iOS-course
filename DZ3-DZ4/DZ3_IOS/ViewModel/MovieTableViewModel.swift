//
//  MovieViewModel.swift
//  Moviebase
//
//  Created by Marko Burčul on 30/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation
import AERecord
import CoreData
import Alamofire
import Reachability


class MovieTableViewModel{
    var movies: [Movie]? {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        let descriptor = NSSortDescriptor(key: "title", ascending: true, selector:#selector(NSString.localizedStandardCompare(_:)))
        request.predicate = NSPredicate(format: "title CONTAINS[c] %@", self.searchstring )
        request.sortDescriptors = [descriptor]
        let context = AERecord.Context.main
        let movie = try? context.fetch(request)
        return movie
    }
    
    let reachability = Reachability()!
    let baseUrl = "https://www.omdbapi.com/?apikey=b689819b"
    var searchstring:String!
    
    init(searchString:String!) {
        if let ss = searchString{
            self.searchstring = ss
        }
    }
    
    func fetchMovies(completion: @escaping (([Movie]?) -> Void)) -> Void {
        if(reachability.connection != .none){
            guard let url = URL(string: baseUrl) else {
                completion(nil)
                return
            }

            Alamofire.request(url,
                              method: .get,
                              parameters: ["s":searchstring!])
                .validate()
                .responseJSON{ response in
                    guard response.result.isSuccess else {
                        completion(nil)
                        return
                    }
                        if
                            let value = response.result.value as? [String: Any],
                            let results = value["Search"] as? [[String: Any]]{
                            let movies = results.map({ json -> Movie? in
                                if self.entityExists(title: (json["Title"] as? String)!){
                                    let movie = Movie.createFrom(json: json)
                                    return movie
                                }else{
                                    return nil
                                }
                            }).filter { $0 != nil } .map { $0! }
                            try? AERecord.Context.main.save()
                            completion(movies)
                            return
                        } else {
                            completion(nil)
                            return
                            
                        }
                    }
        }
    }
    
    
    func entityExists(title: String) -> Bool {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", title)
        
        var results: [Movie] = []
        
        do {
            results = try AERecord.Context.main.fetch(request)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        
        return results.count == 0
    }
    

    func movie(atIndex index: Int) -> Movie? {
        guard let movies = movies else {
            return nil
        }
        
        return movies[index]
    }
    
    func numberOfMovies() -> Int {
        return movies?.count ?? 0
    }


}
