//
//  MasterViewModel.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import Foundation
class MasterViewModel {
    
    //MARK: PROPERTIES
    var service = NetworkService()
    
    //MARK: FUNCTIONS
    func request(completion:@escaping(Result<MasterDetailData?,Error>)->Void) {
        service.sendRequest(request: "GET") { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let messages = try? decoder.decode(MasterDetailData.self, from: data!)
                print(messages as Any)
                completion(.success(messages))
            case .failure(let error):
                print(error)
                completion(Result.failure(error))
            }
        }
    }
}

