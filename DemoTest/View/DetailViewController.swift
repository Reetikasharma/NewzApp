//
//  DetailViewController.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit
import SDWebImage
class DetailViewController: UIViewController{
    
    //MARK: OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: VARIABLES
    var url:String = ""
    var tittle:String = ""
    var detail:String = ""
    var image:String = ""
    var router = Router()
    
    //MARK: VIEWLIFECYCLE
    override func viewWillAppear(_ animated: Bool) {
        navigationaBarSetup(title: "Master")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = tittle
        lblDescription.text = detail
        self.imageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
        addGestures()
        navigationaBarSetup(title: "Master")
    }
    
    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToWebController))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func navigateToWebController() {
        router.navigateToWeb(controller: self, url: url)
    }
}

extension UIViewController {
    func navigationaBarSetup(title:String) {
        navigationController?.navigationBar.barTintColor  = #colorLiteral(red: 0.3568627451, green: 0.6117647059, blue: 0.7647058824, alpha: 0.8048735119)
        navigationController?.navigationBar.tintColor = UIColor.black
        let longTitleLabel = UILabel()
        longTitleLabel.text = title
        longTitleLabel.font = UIFont(name: "HankRnd-Regular.ttf", size: 16)
        
        longTitleLabel.textColor = UIColor.black
        longTitleLabel.sizeToFit()
        longTitleLabel.textAlignment = .right
        
        let leftTitle = UIBarButtonItem(customView: longTitleLabel)
        
        let backBtn  = UIImage(named: "ic_back")
        let btnBack = UIBarButtonItem(image:backBtn, style: .plain, target: self, action: #selector(didTapBackButton))
        btnBack.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25.0)
        navigationItem.leftBarButtonItems = [btnBack,leftTitle ]
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension UINavigationController {
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}
