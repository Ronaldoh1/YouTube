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
    let titles = ["Home", "Trending", "Subscriptions", "Account"]
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self //ad reference to the homeview controller, to make this accessible, we have to make it a lazy var 
        return mb
    }()
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    let feedCellID = "feedCellID"
    let trendingCellID = "trendingCellID"
    let subscriptionCellID = "subscriptionCellID"
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set text color to white for Navigationbar
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        
  
        setupCollectionView()
        
        //setup Menu Bar
        setupMenuBar()
        
        //setupNavBar Buttons
        setUpNavBarButtons()
    }
    
    private func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0 // this removes the gap between the cells.
        }
        
        collectionView?.backgroundColor = UIColor.white
        
       // collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: feedCellID)
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: feedCellID)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellID)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellID)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Make the CollectionView move below the navigation bars
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
        // Make the collectionView Scroll bar insets same as the collection View
        
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        //this allows you to page in the horizontal direction
        collectionView?.isPagingEnabled = true
        
        collectionView?.isScrollEnabled = true
        
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

    // Add black view to the entire window.
    @objc private func handleMore() {
        settingsLauncher.handleMore()
       // showControllerForSetting()
     
    }
    
    func showController(for setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
    
    @objc private func handleSearch() {
        scrollToMenuIndex(menuIndex: 2)
    }
    
    private func setupMenuBar() {
        //hide navigation by when the user scrolls up 
        navigationController?.hidesBarsOnSwipe = true
        
        //Add a red view to the background so that when the user scrolls up there isn't an empty space
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        view.addSubview(redView)
        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: redView)
        
        
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
        
        // hide bar beneath the status bar 
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    //make the collection view scroll to an indexPath
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        changeTitle(for: menuIndex)
    }
    
    //helper methods
    fileprivate  func changeTitle(for index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[Int(index)])"
        }
    }
    
    //Eliminate extra spacing you have at the bottom of each cell.
//    @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}

extension HomeViewController {
    
    // MARK: UICollectionView Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //these 4 sections are the sections that will be presented each time the user taps on menue item
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    // These are the cells that are getting presented
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier: String
        
        if indexPath.item == 0 {
            identifier = feedCellID
        } else if indexPath.item == 1 {
           identifier = trendingCellID
        } else if indexPath.item == 2 {
            identifier = subscriptionCellID
        } else {
            identifier = feedCellID
        }
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
    }
    
    // the horrizontal constraint for the bar is changed based on the scrollView's content offset. so now if the user swipes right or left the white bar also moves with it.
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    // this method lets you know where the scroll view is (based on the with of the screen). The targetContentOffSet is how wide each cell is... if we know the view's frame, then we can get the index by deviding targetContentOffset.pointee.x / view.frame.width and using the index to get our indexPath.
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index) , section: 0)
        menuBar.collectionView.selectItem(at:indexPath , animated: true, scrollPosition: .centeredHorizontally)
        
        changeTitle(for: Int(index))
    }
}

 //This determines the cell's height

extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //we know what the width is, but need to figure out the height
//        //we can get the with of the thumnail image by using the view of the cell and subracting -16 from each side and then we multiply it by 9/ 16 ratio
//        let height = (view.frame.width - 16 - 16) * 9 / 16 // we subtract the spacing from the left and right for the with. And then multiply by 9/16 ratio (this is the ratio for video)
//        
//        //The 68 below comes from all the spacing that we've addded in order to layout everything vertically. So 8 + 44 + 16
//        return CGSize(width: view.frame.width, height: height + 16 + 68 + 20)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
}

