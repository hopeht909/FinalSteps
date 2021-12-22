//
//  ApiManager.swift
//  MVCInIOS
//
//  Created by admin on 18/05/1443 AH.
//

import Foundation
class ApiManager {
    
    class func getApiResponse(urlPath: String, completionHandler: @escaping (Any?, Error?) -> Void ) {
        let urlSession = URLSession.shared
        guard let url = URL.init(string: urlPath) else { return }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completionHandler(nil, error)
            } else {
                if let data = data {
                   let obj = ApiManager().parseData(data: data)
                    completionHandler(obj, nil)
                }
            }
        }
        task.resume()
    }
    
    private func parseData(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: [])
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
