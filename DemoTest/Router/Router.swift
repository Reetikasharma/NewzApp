//
//  Router.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import Foundation
import UIKit
class Router {
    
    func navigateToDetail(controller:UIViewController,url:String,title:String,description:String,image:String) {
        let nextvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:detailViewController ) as? DetailViewController
        nextvc?.url = url
        nextvc?.tittle = title
        nextvc?.detail = description
        nextvc?.image = image
        controller.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    func navigateToWeb(controller:UIViewController,url:String) {
        let nextvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:webViewController ) as? WebViewController
        nextvc?.url = url
        controller.navigationController?.pushViewController(nextvc!, animated: true)
    }
}

