//
//  MasterViewController.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit
protocol MasterViewControllerDelegate {
    func rowSelected(url:String)
}

class MasterViewController: UIViewController {
    
    
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: VARIABLES
    var topNewsData:[TopNewsData] = []
    var viewModel = MasterViewModel()
    var router = Router()
    var delegate: MasterViewControllerDelegate?


    
    //MARK: VIEWLIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
    }
    
    //MARK: FUNCTIONS
    func getProfileData() {
        viewModel.request { [weak self] (result) in
            switch result{
            case .success(let topNewsData):
                if let topNewsdata = topNewsData {
                    self?.topNewsData = topNewsdata.topNews
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: TABLEVIEW DELEGATE AND DATASOURCE
extension MasterViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topNewsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: masterInfoCell, for: indexPath) as! MasterTableViewCell
        cell.configureCell(topNewsData: topNewsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let url =  topNewsData[indexPath.row].url {
           // self.delegate?.rowSelected(url: url)
            router.navigateToDetail(controller: self, url: url)
        }
    }
}
