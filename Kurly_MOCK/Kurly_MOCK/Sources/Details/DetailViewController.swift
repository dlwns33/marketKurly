//
//  DetailViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var buy: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func toBuy(_ sender: UIButton) {
        let nextVC = ToBuyViewController()
        nextVC.proID = nameID
        nextVC.proName = nameTitle
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        self.present(navBarOnModal, animated: true, completion: nil)
//        self.present(ToBuyViewController(), animated: true, completion: nil)
    }
    
    var nameTitle = "상품정보"
    var nameID = 0
    var productDetailsArray : DetailResponseResult?
    
    func scrollToMenuIndex(menuIdx: Int){
        let indexPath = NSIndexPath(item: menuIdx, section: 0)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        collectionView.isPagingEnabled = true
    }
    
    lazy var menuBar: DetailMenuBar = {
        let mb = DetailMenuBar()
        mb.detailviewcontroller = self
        return mb
    }()
    
    let detailViews : [UIViewController] = [ProfileViewController(), ProductImageViewController(), InfoViewController(), FeedbackViewController(), AskViewController()]
    
    private func setUpMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buy.kurlybutton_purple()
//        self.tabBarController?.tabBar.isHidden = true
        setUpMenuBar()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(DetailCollectionViewCell.nib(), forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
//        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
//        self.navigationItem.leftBarButtonItem = exitBarButtonItem
    }
    
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = nameTitle
    }
}

extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
        
        self.addChild(detailViews[indexPath.item])
        cell.addSubview(detailViews[indexPath.item].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

extension DetailViewController {
    func didSuccess() {
        print("printprint")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

