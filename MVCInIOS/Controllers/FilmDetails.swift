//
//  FilmDetails.swift
//  MVCInIOS
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class FilmDetails: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblOpeningCrawl: UILabel!
    
    var filmTitle: String?
    var releaseDate: String?
    var director: String?
    var openingCrawl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filmTitle = filmTitle,
           let releaseDate = releaseDate,
           let director = director,
           let openingCrawl = openingCrawl{
            
            lblTitle.text = "Title: \(String(describing: filmTitle))"
            lblReleaseDate.text = "Release Date: \(String(describing: releaseDate))"
            lblDirector.text = "Director: \(String(describing: director))"
            lblOpeningCrawl.text = "Opening Crawl: \(String(describing: openingCrawl))"
        }
        
        
    }
}
