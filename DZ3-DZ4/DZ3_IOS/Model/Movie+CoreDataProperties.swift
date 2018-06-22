//
//  Movie+CoreDataProperties.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 30/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var summary: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var genre: String?
    @NSManaged public var year: String?
    @NSManaged public var director: String?

}
