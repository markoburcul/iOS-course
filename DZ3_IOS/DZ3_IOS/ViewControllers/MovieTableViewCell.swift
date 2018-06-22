//
//  MovieTableViewCell.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 17/06/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieLabel.text = ""
        movieImage?.image = nil
    }
    
    func setup(withMovie movie: Movie) {
        movieLabel.text = movie.title
        
        if
            let urlString = movie.imageURL,
            let url = URL(string: urlString) {
            self.movieImage.kf.setImage(with: url)
        }
    }
    
}
