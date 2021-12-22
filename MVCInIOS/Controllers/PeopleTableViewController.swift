//
//  ViewController.swift
//  MVCInIOS
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    let movieApi = "https://swapi.dev/api/people/"
    
    var movieArray: [MovieCharacter] = []
    
    struct MovieCharacter {
        let name: String
        let birthYear: String
        let gender: String
        let mass: String
        let species: [String]
        
        init?(dict: [String: Any]){
            guard let name = dict["name"] as? String,
                  let birthYear = dict["birth_year"] as? String,
                  let gender = dict["gender"] as? String,
                  let mass = dict["mass"] as? String,
                  let species = dict["species"] as? [String] else {
                      return nil
                  }
            
            self.name = name
            self.birthYear = birthYear
            self.gender = gender
            self.mass = mass
            self.species = species
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieApi()
    }
    
    func getMovieApi(){
        ApiManager.getApiResponse(urlPath: movieApi) { responseObj, error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            }
            else{
                if let resbonseDict = responseObj as? [String:Any],
                   let resultArr = resbonseDict["results"] as? [[String:Any]]{
                    for result in resultArr {
                        if let movieObj = MovieCharacter.init(dict: result){
                            self.movieArray.append(movieObj)
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
        return movieArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
        cell.textLabel?.text = movieArray[indexPath.row].name
        return cell
    }
}
