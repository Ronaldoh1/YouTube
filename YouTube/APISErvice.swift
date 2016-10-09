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
    let baseURL = "https://s3-us-west-2.amazonaws.com/youtubeassets/"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForURL("\(baseURL)home.json", completion: completion)
    }
    
    func fetchTrendingVideos(completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForURL("\(baseURL)trending.json", completion: completion)
    }
    
    func fetchSubscriptionVideos(completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForURL("\(baseURL)subscriptions.json", completion: completion)
    }
    
    func fetchFeedForURL(_ urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in
            if error != nil {
                print(error)
            }
            do {
                if let data = data, let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as?  [[String : AnyObject]] {

                    let videos = json.map({ return Video(dictionary: $0)})
                        //Bounce back to the main thread and upadate the UI
                        DispatchQueue.main.async {
                            completion(videos)
                            
                        }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }
        task.resume()
    }
}
