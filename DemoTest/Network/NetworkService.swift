//
//  NetworkService.swift
//  DemoTest
//
//  Created by Reetika Sharma on 23/08/21.
//

import Foundation
import UIKit

class NetworkService {
    
    //MARK: FUNCTIONS
    func sendRequest(request:String,completion:@escaping(Result<Data?, Error>)->Void) {
        let url = NSURL(string: getDataUrl)
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        downloadTask.httpMethod = request
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            if error != nil{
                completion(Result.failure(error?.localizedDescription as! Error))
            } else {
                completion(Result.success(data))
            }
            
        }).resume()
    }
}

