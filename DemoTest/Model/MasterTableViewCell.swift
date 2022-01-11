//
//  MasterTableViewCell.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit
import SDWebImage
class MasterTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell (topNewsData:TopNewsData) {
        lblTitle.text = topNewsData.title
        lblDescription.text = topNewsData.description
        self.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        if let image = topNewsData.headlineImageUrl {
            self.imgView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
        }
    }

}
