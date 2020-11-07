//
//  DetailViewController.swift
//  CASTA
//
//  Created by Kamalesh Kumar Yadav on 06/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   private var textLable:UILabel!
	
	 var detaiViewModel: DetailViewModel?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
        displayDetail()
        self.view.backgroundColor = .white
        
    }
    
    func setUpUI() {
        textLable = UILabel(frame: .zero)
        textLable.numberOfLines = 0
        self.view.addSubview(textLable)
        self.textLable.textAlignment = .natural
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalTo(self.view).inset(10)
           // $0.bottom.equalTo(formImageItem.margin.bottom).priority(999)
        }
    }
    
    
    ///  customising textlabel
    func displayDetail() {
			guard let text =  detaiViewModel?.detailOfItem() else { return }
			textLable.text = text
    }

}
