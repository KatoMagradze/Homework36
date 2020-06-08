//
//  ViewController.swift
//  Homework36
//
//  Created by Kato on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages = [Page]()
    var currentPage = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        self.setUpPages()
    }
    
    // Skips to last page
    @IBAction func skipTapped(_ sender: UIButton) {
        let index = IndexPath(item: pages.count-1, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    
    @IBAction func nextTapped(_ sender: UIButton) {

        if pageControl.currentPage >= pages.count - 1 {
            collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)

        }
        else if pageControl.currentPage < pages.count - 1 {
            collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage+1, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage += 1
        }

        
    }
    
    private func setUpPages() {
        
        let firstPage = Page(imageNamed: "first_page_img", title: "Online shopping", text: "Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price")
        let secondPage = Page(imageNamed: "second_page_img", title: "Add to cart", text: "Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons")
        let thirdPage = Page(imageNamed: "third_page_img", title: "Payment Successful", text: "Your payment has been successfully completed. You will receive a confirmation email within a few minutes.")
        
        self.pages.append(firstPage)
        self.pages.append(secondPage)
        self.pages.append(thirdPage)
        
        pageControl.numberOfPages = self.pages.count
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.identifier, for: indexPath) as! PageCell
        
        let page = pages[indexPath.row]
        cell.bind(page: page)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let offset = targetContentOffset.pointee
        let x = offset.x
        
        let pageIndex = x / collectionView.frame.width
        pageControl.currentPage = Int(pageIndex)
    }
    
    
}

