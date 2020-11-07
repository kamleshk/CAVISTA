//
//  ViewController.swift
//  CASTA
//
//  Created by Kamalesh Kumar Yadav on 05/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
class ListViewController: UIViewController {
    var viewmodel:ListViewModel = ListViewModel(apiProtocol: FetchItemFromApi())
    
    var listTableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.estimatedRowHeight = 120
        tableview.rowHeight = UITableView.automaticDimension
       tableview.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUi()
        setupInitialMethods()
        viewmodel.fetchList()
    }
    
    override func viewDidLayoutSubviews() {
        listTableview.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }
    
	
	/// Initial UI setups
    func setUpUi()  {
        self.view.addSubview(listTableview)
        listTableview.dataSource = self
        listTableview.delegate = self
        self.view.backgroundColor = .white
    }
	
    func setupInitialMethods() {
        self.viewmodel.refreshUi = self.refreshUI
        viewmodel.handaleError = self.handaleError
    }
    
	
	/// function for refreshing ui if any changes occurs
    func refreshUI() {
        listTableview.reloadData()
    }
	
	/// error handling if any error occurs due any reasion
	/// - Parameter error: cutom error enum  ErrorResult
    func handaleError(alertMessage:ErrorResult) {
			switch alertMessage {
			case .custom(string: let message):
				UIAlertController.alert(title: "Error", msg: message, target: self)
			case .network(string: let message):
				UIAlertController.alert(title: "Error", msg: message, target: self)
			case .parser(string: let message):
				UIAlertController.alert(title: "Error", msg: message, target: self)
			case .URLError(string: let message):
				UIAlertController.alert(title: "Error", msg: message, target: self)
			}
			         
    }
    
    func showDetailPage(item:ItemModel) {
        let detailcont = DetailViewController()
			detailcont.detaiViewModel = DetailViewModel(item: item)
        self.navigationController?.pushViewController(detailcont, animated: true)
    }
   
    
}



//MARK:- Extension section

extension ListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        cell.itemData = viewmodel.itemForIndex(indexPath: indexPath)
        return cell
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.showDetailPage(item: viewmodel.itemForIndex(indexPath: indexPath))
   }
}


extension UIAlertController {
    class func alert(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}



