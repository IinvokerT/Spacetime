//
//  GuideViewController.swift
//  Spacetime
//
//  Created by 刘研飞 on 2018/5/29.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let pageNumber: Int = 3
    var pageLabel:Array<String> = [
        "不同时段不同主题\n多重空间任你选择",
        "3分钟即时匿名聊天\n相互喜欢成为朋友",
        "创造时间和空间上的相遇\n开启场景社交新时达"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        //print(pageLabel.endIndex)
    
    }
    
    func buildUI() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UIScreen.main.bounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension GuideViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Guide Cell", for: indexPath) as! GuideCollectionViewCell
        
        cell.label.text = pageLabel[indexPath.row]
        
        cell.beginButton.isHidden = true
        if indexPath.row == pageLabel.endIndex-1 {
            cell.beginButton.isHidden = false
        }
        
        return cell
    }
}
