//
//  MasterTableViewCell.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit
import SDWebImage
class MasterTableViewCell: UITableViewCell {

    //MARK: OUTLETS
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblLastUpdatedTime: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    //MARK: FUNCTIONS
    func configureCell (topNewsData:TopNewsData) {
        if let updatedTime = topNewsData.lastUpdatedTimestamp {
            let newTime = TimeInterval(updatedTime) / 1000
            lblLastUpdatedTime.text = newTime.getLastUpdatedTime()
        }
        if let dateTime = topNewsData.displayTimestamp {
            let newTime = TimeInterval(dateTime) / 1000
            lblDateTime.text = newTime.getDateAndTime()
        }
        lblDescription.text = topNewsData.title
        self.imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        if let image = topNewsData.headlineImageUrl {
        self.imgView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
          
        }
    }

}

extension TimeInterval {
    func getLastUpdatedTime()->String {
        let date = Date.init(timeIntervalSince1970: self)
        return date.timeAgoSinceDate()
    }
    
    func getDateAndTime()-> String {
        let date = Date.init(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}

extension Date {
    func timeAgoSinceDate() -> String {
        let fromDate = self
        let toDate = Date()
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }
        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
        }
        
        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            return interval == 1 ? "yesterday" : "\(interval)" + " " + "days ago"
        }
        
        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
        }
        
        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
        }
        
        //seconds
        if let interval = Calendar.current.dateComponents([.second], from: fromDate, to: toDate).second, interval > 0 {
            return interval == 1 ? "just now" : "\(interval)" + " " + "seconds ago"
        }
        return "Now"
    }
}
