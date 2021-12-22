//
//  FilmTableViewController.swift
//  MVCInIOS
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class FilmTableViewController: UITableViewController {

    let filmApi = "https://swapi.dev/api/films/"
    
    var filmArray: [filmCharacter] = []
    

    struct filmCharacter {
        let title: String
        let director: String
        let releaseDate: String
        let openingCrawl: String
       
        
        init?(dict: [String: Any]){
            guard let title = dict["title"] as? String,
                  let director = dict["director"] as? String,
                  let releaseDate = dict["release_date"] as? String,
                  let openingCrawl = dict["opening_crawl"] as? String else {
                      return nil
                  }
            
            self.title = title
            self.director = director
            self.releaseDate = releaseDate
            self.openingCrawl = openingCrawl
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmApi()
        print(filmArray)
        
    }
    func getFilmApi(){
        ApiManager.getApiResponse(urlPath: filmApi) { responseObj, error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            }
            else{
                if let resbonseDict = responseObj as? [String:Any],
                   let resultArr = resbonseDict["results"] as? [[String:Any]]{
                    for result in resultArr {
                        if let filmObj = filmCharacter.init(dict: result){
                            self.filmArray.append(filmObj)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath)
        
        cell.textLabel?.text = filmArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmDetailsVC = storyboard?.instantiateViewController(withIdentifier: "FilmDetails") as! FilmDetails
        
        let item = filmArray[indexPath.row]
        
        filmDetailsVC.filmTitle = item.title
        filmDetailsVC.director = item.director
        filmDetailsVC.openingCrawl = item.openingCrawl
        filmDetailsVC.releaseDate = item.releaseDate
         
        
        self.navigationController?.pushViewController(filmDetailsVC, animated: true)
    }
    
}
