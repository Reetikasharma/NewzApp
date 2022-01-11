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
        let url = generate(url: URL.init(string: getDataUrl)!)
        service.sendRequest(request: url) { (result) in
            switch result {
            case .success(let data):
//                let decoder = JSONDecoder()
//                let messages = try? decoder.decode(MasterDetailData.self, from: data!)
//                completion(.success(messages))
                do {
                    let decoder = JSONDecoder()
                    let messages = try decoder.decode(MasterDetailData.self.self, from: data!)
                    print(messages as Any)
                    completion(.success(messages))
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            case .failure(let error):
                print(error)
                completion(Result.failure(error))
            }
        }
    }
    
    func generate(url:URL)->URLRequest {
        var request = URLRequest.init(url: url)
        request.method = .get
        return request
    }
    
}

