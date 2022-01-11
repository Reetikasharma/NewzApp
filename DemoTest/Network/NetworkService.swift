//
//  NetworkService.swift
//  DemoTest
//
//  Created by Reetika Sharma on 23/08/21.
//

import Foundation
import Alamofire
import UIKit
class NetworkService {
    
    //MARK: FUNCTIONS
    func sendRequest(request:URLRequest,completion:@escaping(Result<Data?, Error>)->Void){
        Alamofire.AF.request(request).responseJSON { (response) in
            switch response.result {
            case .success( _):
                completion(Result.success(response.data))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
