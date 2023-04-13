//
//  NetworkManager.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Alamofire
import RxSwift

final class NetworkManager {
    static let shared = NetworkManager()
    
    public func request<T:Decodable>(path:String)->Observable<T> {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(NetworkConstants.apiToken)"
        ]
        return Observable.create { observer in
            AF.request(path, headers: headers).validate().responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let model):
                    observer.onNext(model)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
