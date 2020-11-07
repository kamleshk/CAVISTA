//
//  ListTableViewCell.swift
//  CASTA
//
//  Created by Kamalesh Kumar Yadav on 05/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import UIKit
import SnapKit
class ListTableViewCell: UITableViewCell {
var textLable: UILabel!
	let grey = UIColor.init(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    
    ///  creating  or setting label on view
    func configure() {
        textLable = UILabel(frame: .zero)
        textLable.numberOfLines = 0
        textLable.font = UIFont.systemFont(ofSize:13, weight: .light)
        self.contentView.addSubview(textLable)
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalTo(self.contentView).inset(10)
           // $0.bottom.equalTo(formImageItem.margin.bottom).priority(999)
        }
    }

    
    /// property for  getting data from cont
    var itemData : ItemModel? {
        didSet{
            self.populateCell(data: itemData)
        }
    }
    
    ///  customising textlabel
    /// - Parameter data: datamodel
    func populateCell(data:ItemModel?) {
        guard let itemData = data else {return}
       // self.textLable.text = "ID:\(itemData.id ?? "") \n Type: \(itemData.type ?? "") \n Data: \(itemData.data ?? "") \n Date: \(itemData.date ?? "")"
			
			let mutableAttrString = NSMutableAttributedString()
			mutableAttrString.append(self.getAttributedString(text:  "Type: ", fontsize: 16, color: .black))
			mutableAttrString.append(self.getAttributedString(text: itemData.type ?? "", fontsize: 14, color: grey))
			
			mutableAttrString.append(self.getAttributedString(text:  "\nData: ", fontsize: 16, color: .black))
			mutableAttrString.append(self.getAttributedString(text: itemData.data ?? "", fontsize: 14, color: grey))
			
			mutableAttrString.append(self.getAttributedString(text:  "\nDate: ", fontsize: 16, color: .black))
			mutableAttrString.append(self.getAttributedString(text: itemData.date ?? "", fontsize: 14, color: .red))
			self.textLable.attributedText = mutableAttrString
    }
	
	func getAttributedString(text:String,fontsize:Int, color:UIColor) -> NSAttributedString {
		let myAttribute: [NSAttributedString.Key : Any] = [ NSAttributedString.Key.font: UIFont(name: "Helvetica", size: CGFloat(fontsize)) ?? UIFont() , .foregroundColor : color  ]
			let myAttrString = NSAttributedString(string: text, attributes: myAttribute)
			return myAttrString
	}
    
}
