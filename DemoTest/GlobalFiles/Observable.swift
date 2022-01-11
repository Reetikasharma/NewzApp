//
//  Observable.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import Foundation
class Observable<T>:Disposable {
    
    //MARK: VARIABLES
    typealias Observer = (T)->Void
    var observers:[Observer] = []
    
    //MARK: FUNCTIONS
    func update(_ value:T) {
        observers.forEach { (observer) in
            observer(value)
        }
    }
    
    func observe(_ observer:@escaping Observer) {
        observers.append(observer)
    }
    
    func dispose() {
        observers.removeAll()
    }
}

protocol Disposable {
    func dispose()
}

class DisposeBag {
    
    //MARK: VARIABLES
    var disposables:[Disposable] = []
    
    //MARK: FUNCTIONS
    func add(_ disposable:Disposable) {
        disposables.append(disposable)
    }
    
    func dispose() {
        disposables.forEach { (item) in
            item.dispose()
        }
    }
}
