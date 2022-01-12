//
//  MasterViewController.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit

class MasterViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: VARIABLES
    var topNewsData:[TopNewsData] = []
    var technicalAnalysis:[TopNewsData] = []
    var specialReport:[TopNewsData] = []
    var viewModel = MasterViewModel()
    var router = Router()
    
    //MARK: VIEWLIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.frame = self.view.frame
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.setStatusBar(backgroundColor: #colorLiteral(red: 0.3568627451, green: 0.6117647059, blue: 0.7647058824, alpha: 0.7975659014))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: FUNCTIONS
    func getProfileData() {
        viewModel.request { [weak self] (result) in
            switch result{
            case .success(let topNewsData):
                if let topNewsdata = topNewsData {
                    self?.topNewsData = topNewsdata.topNews
                    self?.technicalAnalysis = topNewsdata.technicalAnalysis
                    self?.specialReport = topNewsdata.specialReport
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerTableViewCell) as! HeaderTableViewCell
        switch(section) {
        case 0:
            headerCell.lblHeader.text = "Top News"
            return headerCell
        case 1:
            headerCell.lblHeader.text = "Technical Analysis"
            return headerCell
        case 2:
            headerCell.lblHeader.text = "Special Report"
            return headerCell
            
        default: fatalError()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return self.topNewsData.count
        case 1:
            return self.technicalAnalysis.count
        case 2:
            return self.specialReport.count
        default: fatalError()
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: masterInfoCell, for: indexPath) as! MasterTableViewCell
        cell.selectionStyle = .none
        switch(indexPath.section) {
        case 0:
            cell.configureCell(topNewsData: topNewsData[indexPath.row])
            return cell
        case 1:
            cell.configureCell(topNewsData: technicalAnalysis[indexPath.row])
            return cell
        case 2:
            cell.configureCell(topNewsData: specialReport[indexPath.row])
            return cell
        default: fatalError()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch(indexPath.section) {
        case 0:
            if  let url = topNewsData[indexPath.row].url,let title = topNewsData[indexPath.row].title,let description =  topNewsData[indexPath.row].description,let img = topNewsData[indexPath.row].headlineImageUrl {
                router.navigateToDetail(controller: self, url: url,title:title, description: description, image: img)
                    
            }
        case 1:
            if  let url = technicalAnalysis[indexPath.row].url,let title = technicalAnalysis[indexPath.row].title,let description =  technicalAnalysis[indexPath.row].description,let img = technicalAnalysis[indexPath.row].headlineImageUrl {
                router.navigateToDetail(controller: self, url: url,title:title, description: description, image: img)
            }
        case 2:
            if  let url =  specialReport[indexPath.row].url,let title = specialReport[indexPath.row].title,let description =  specialReport[indexPath.row].description,let img = specialReport[indexPath.row].headlineImageUrl {
                router.navigateToDetail(controller: self, url: url,title:title, description: description, image: img)
            }
        default: fatalError()
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
