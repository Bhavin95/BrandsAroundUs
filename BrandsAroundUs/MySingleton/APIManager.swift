//
//  APIManager.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

final class APIManager {
    
    static let sharedInstance = APIManager()
    private init() {}
    
    let baseURL = ""
    
    let token = "5c90c6cfd0409"
    
    /*func postData(apiName: String,parameter: [String: Any], onSuccess: @escaping(Data) -> Void, onFailure: @escaping(Error) -> Void) {
        
        let api = baseURL + apiName
        guard let url = URL(string: api) else {
            print("Error: cannot create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(token, forHTTPHeaderField: "access_token")
        
        let postString = parameter
        let postData = postString.d
        request.httpBody = postData

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("error calling POST on \(apiName)" )
                print(error!)
                onFailure(error!)
                return
            }
            guard let data = data else {
                print("Error: did not receive data")
                onFailure(error!)
                return
            }
           
            onSuccess(data)
            
        }
        task.resume()
        
    }
    
    func getData(apiName: String,parameter: [String: Any], onSuccess: @escaping(Data) -> Void, onFailure: @escaping(Error) -> Void) {
        
        let api = baseURL + apiName
        guard let url = URL(string: api) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        let queryItems = parameter.map{
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
        
        urlComponents?.queryItems = queryItems
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "access_token")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("error calling POST on \(apiName)" )
                print(error!)
                onFailure(error!)
                return
            }
            guard let data = data else {
                print("Error: did not receive data")
                onFailure(error!)
                return
            }
            onSuccess(data)
            
        }
        task.resume()
    }*/
    
}
