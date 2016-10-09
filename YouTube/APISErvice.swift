//
//  APISErvice.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/2/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//
import UIKit

class APIService: NSObject {
    
    static let sharedInstance = APIService()
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in
            if error != nil {
                print(error)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
                
                var videos = [Video]()
                for dictionary in json as! [[String : AnyObject]]{
                    
                    let video = Video()
                    
                    video.title = dictionary["title"] as? String
                    
                    video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as? [String : AnyObject]
                    
                    let channel = Channel()
                    
                    channel.name = channelDictionary?["name"] as? String
                    channel.profileImageName = channelDictionary?["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                    
                }
                
                //Bounce back to the main thread and upadate the UI
                DispatchQueue.main.async {
                    completion(videos)
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }
        task.resume()
    }
}
