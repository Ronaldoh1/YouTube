//
//  UIImageView+Utils.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/25/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//
import UIKit
import Foundation



let imageCache = NSCache<AnyObject, AnyObject>()


class CustomImageView: UIImageView {
    
    var imageURLString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageURLString = urlString
        
        let url = URL(string: urlString)
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        let request = URLRequest(url: url!)
        let session =  URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            //Bounce back to the main thread and upadate the UI
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data!)
                
                if self.imageURLString == urlString {
                    self.image = imageToCache
                    
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                
            }
            
        })
        
        session.resume()
    }
    
}
