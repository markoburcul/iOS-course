//
//  Movie+CoreDataClass.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 30/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//
//

import Foundation
import CoreData
import AERecord

@objc(Movie)
public class Movie: NSManagedObject {
    class func createFrom(json: [String: Any]) -> Movie? {
        if
            let title = json["Title"] as? String,
            let year = json["Year"] as? String,
            let imageURL = json["Poster"] as? String{
            let movie = Movie.firstOrCreate(with: ["title": title])
        
            movie.title = title
            movie.year = year
            movie.imageURL = imageURL
            
            return movie
        }
        
        return nil
    }
}
