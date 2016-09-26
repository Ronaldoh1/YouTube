//
//  UIImageView+Utils.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/25/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//
import UIKit

extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        

            
            let url = URL(string: urlString)
            let request = URLRequest(url: url!)
            let session =  URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                //Bounce back to the main thread and upadate the UI
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
                
                
            })
            
            session.resume()
        }
    
}
