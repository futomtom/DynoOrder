//
//  ExampleViewController.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko
//  Copyright © 2016 Yalantis Mobile. All rights reserved.
//

import UIKit
import Segmentio
import SideMenu

class ExampleViewController: UIViewController {
    
    var segmentioStyle = SegmentioStyle.imageBeforeLabel
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var segmentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var segmentioView: Segmentio!
    @IBOutlet fileprivate weak var containerView: UIView!
  //  @IBOutlet fileprivate weak var scrollView: UIScrollView!
    fileprivate lazy var viewControllers: [UIViewController] = []
    var items:[Dish] = []
    
    // MARK: - Init
    
    class func create() -> ExampleViewController {
        let board = UIStoryboard(name: "Main", bundle: nil)
        return board.instantiateViewController(withIdentifier: String(describing: self)) as! ExampleViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch segmentioStyle {
        case .onlyLabel, .imageBeforeLabel, .imageAfterLabel:
            segmentViewHeightConstraint.constant = 50
        case .onlyImage:
            segmentViewHeightConstraint.constant = 100
        default:
            break
        }
        
        let RightButtonItem = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action:  #selector(self.OpenMenu))
        self.navigationItem.setLeftBarButton(RightButtonItem, animated: true)
        
        LoadData()
    }
    
    func LoadData() {
        
        
    }
    
 
    
    func OpenMenu() {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSegmentioView()
       
        setupBadgeCountForIndex(1)
    }
    
    fileprivate func setupSegmentioView() {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions()
        )
        
        segmentioView.selectedSegmentioIndex = selectedSegmentioIndex()
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in
                print (segmentIndex )
        }
    }
    
    fileprivate func setupBadgeCountForIndex(_ index: Int) {
        segmentioView.addBadge(at: index, count: 10, color: ColorPalette.coral)
    }
    
    fileprivate func segmentioContent() -> [SegmentioItem] {
        return [
            SegmentioItem(title: "Tornado", image: UIImage(named: "tornado")),
            SegmentioItem(title: "Earthquakes", image: UIImage(named: "earthquakes")),
            SegmentioItem(title: "Extreme heat", image: UIImage(named: "heat")),
            SegmentioItem(title: "Eruption", image: UIImage(named: "eruption")),
            SegmentioItem(title: "Floods", image: UIImage(named: "floods")),
            SegmentioItem(title: "Wildfires", image: UIImage(named: "wildfires"))
        ]
    }
    
    fileprivate func segmentioOptions() -> SegmentioOptions {
        var imageContentMode = UIViewContentMode.center
        switch segmentioStyle {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: ColorPalette.white,
            maxVisibleItems: 3,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            segmentStates: segmentioStates()
        )
    }
    
    fileprivate func segmentioStates() -> SegmentioStates {
        let font = UIFont(name: "Avenir-Book", size: 13)!
        return SegmentioStates(
            defaultState: segmentioState(
                backgroundColor: .clear,
                titleFont: font,
                titleTextColor: ColorPalette.grayChateau
            ),
            selectedState: segmentioState(
                backgroundColor: .clear,
                titleFont: font,
                titleTextColor: ColorPalette.black
            ),
            highlightedState: segmentioState(
                backgroundColor: ColorPalette.whiteSmoke,
                titleFont: font,
                titleTextColor: ColorPalette.grayChateau
            )
        )
    }
    
    fileprivate func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
        return SegmentioState(backgroundColor: backgroundColor, titleFont: titleFont, titleTextColor: titleTextColor)
    }
    
    fileprivate func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(type: .bottom, ratio: 1, height: 5, color: ColorPalette.coral)
    }
    
    fileprivate func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(type: .topAndBottom, height: 1, color: ColorPalette.whiteSmoke)
    }
    
    fileprivate func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(ratio: 1, color: ColorPalette.whiteSmoke)
    }
    
    // Example viewControllers
    
   
    
    fileprivate func selectedSegmentioIndex() -> Int {
        return 0
    }

    
}

extension ExampleViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return array1.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let string = array1[section]
        let stringArray = string.characters.split{$0 == " "}.map(String.init)
        return stringArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        
        
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
    }
}
