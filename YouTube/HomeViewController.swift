//
//  HomeViewController.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var videos: [Video]?
    
    let menuBar: MenuBar = {
        return MenuBar()
    }()
    
    let settingsLauncher = SettingsLauncher()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        // Set text color to white for Navigationbar
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Make the CollectionView move below the navigation bars
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
        // Make the collectionView Scroll bar insets same as the collection View
        
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        //setup Menu Bar
        setupMenuBar()
        
        //setupNavBar Buttons
        setUpNavBarButtons()
    }
    
    private func setUpNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
        
    }
    
    private func setUpThumnailImage() {
        
    }
    
    private func fetchVideos() {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in
            if error != nil {
                print(error)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
                
                self.videos = [Video]()
                for dictionary in json as! [[String : AnyObject]]{
                    
                    let video = Video()
                    
                    video.title = dictionary["title"] as? String
                    //                    let numberOfViewRaw = dictionary["number_of_views"] as? String
                    //                    video.numberOfViews = NSNumber(numberOfViewRaw
                    video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as? [String : AnyObject]
                    
                    let channel = Channel()
                    
                    channel.name = channelDictionary?["name"] as? String
                    channel.profileImageName = channelDictionary?["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    self.videos?.append(video)
                    
                    
                    
                }
                
                //Bounce back to the main thread and upadate the UI
                
                self.collectionView?.reloadData()
                
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }
        task.resume()
    }
    
    // Add black view to the entire window.
    @objc private func handleMore() {
        settingsLauncher.handleMore()
    }
    
    @objc private func handleSearch() {
        print("123")
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    // MARK: UICollectionView Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? VideoCell else {
            return UICollectionViewCell()
        }
        
        let video = videos?[indexPath.item]
        cell.video = video
        
        return cell
    }
    
    //Eliminate extra spacing you have at the bottom of each cell.
    @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //we know what the width is, but need to figure out the height
        //we can get the with of the thumnail image by using the view of the cell and subracting -16 from each side and then we multiply it by 9/ 16 ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16 // we subtract the spacing from the left and right for the with. And then multiply by 9/16 ratio (this is the ratio for video)
        
        //The 68 below comes from all the spacing that we've addded in order to layout everything vertically. So 8 + 44 + 16
        return CGSize(width: view.frame.width, height: height + 16 + 68 + 20)
    }
}

