//
//  WebViewController.swift
//  DemoTest
//
//  Created by Reetika Sharma on 12/01/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: VARIABLES
    var url:String = ""
    
    //MARK: VIEWLIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls:URL = URL(string: url)!
        let urlRequest:URLRequest = URLRequest(url: urls)
        webView.load(urlRequest)
        navigationaBarSetup(title: "Detail")
    }
}
