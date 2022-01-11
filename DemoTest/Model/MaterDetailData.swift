//
//  MaterDetailData.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import Foundation

class MasterDetailData:Decodable {
    var topNews:[TopNewsData]
}
class TopNewsData:Decodable {
    var title:String?
    var url:String?
    var description:String?
    var content:String?
    var firstImageUrl: String?
    var headlineImageUrl: String?
    var articleImageUrl: String?
    var backgroundImageUrl:String?
    var videoType: String?
    var videoId: String?
    var videoUrl:String?
    var videoThumbnail: String?
    var newsKeywords:String?
    var authors:[AuthorsData]
    class AuthorsData:Decodable {
        var name:String?
        var title:String?
        var bio:String?
        var email:String?
        var phone: String?
        var facebook: String?
        var twitter: String?
        var googleplus:String?
        var subscription: String?
        var rss: String?
        var descriptionLong:String?
        var descriptionShort: String?
        var photo:String?
    }
    var instruments:[String?]
    var tags:[String?]
    var categories:[String?]
    var displayTimestamp:Int?
    var lastUpdatedTimestamp:Int?
}


