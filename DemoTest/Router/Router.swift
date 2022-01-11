//
//  Router.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import Foundation
import UIKit
class Router {
    
    func navigateToDetail(controller:UIViewController,url:String) {
        let nextvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:detailViewController ) as? DetailViewController
      //  nextvc?.loadWebView(url: url)
        nextvc?.url = url
        controller.navigationController?.pushViewController(nextvc!, animated: true)
    }
}

