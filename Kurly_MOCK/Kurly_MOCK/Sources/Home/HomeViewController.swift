//
//  HomeViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let homeViews : [BaseViewController] = [CurlyRecomViewController(), NewViewController(), BestViewController(), ShoppingViewController(), BenefitViewController()]
    
    func addNavBarImage() {

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "홈로고")
        imageView.image = image

        navigationItem.titleView = imageView
    }
    
    func scrollToMenuIndex(menuIdx: Int){
        let indexPath = NSIndexPath(item: menuIdx, section: 0)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        collectionView.isPagingEnabled = true
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeviewcontroller = self
        return mb
    }()
    
    private func setUpMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuBar()
        addNavBarImage()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(DetailCollectionViewCell.nib(), forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 5
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        self.addChild(homeViews[indexPath.item])
        cell.addSubview(homeViews[indexPath.item].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

