//
//  API.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {

    class func getMostPopularArticle (api_key: String, completion: @escaping (_ error: Error?, _ articles:  [Article]?) -> Void) {

        let url = URLs.mostPopularArticle

        let parameters = [

            "api-key": api_key

        ]

        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)


        
            .responseJSON { response in

                switch response.result {


                case .failure(let error):
                    print(error)
                    completion(error, nil)

                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    
                    
                    let mostPopular = try? JSONDecoder().decode(MostPopular.self, from: response.data!)

                    completion(nil, mostPopular?.results)

                }
        }
    }




}
