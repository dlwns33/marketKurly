//
//  NewViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import UIKit

class NewViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var foods: [ProductResponseResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewReqDataManager().reqNew(self)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 300)
        collectionView.collectionViewLayout = layout
        collectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension NewViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let food = foods[indexPath.row]

        let nextVC = DetailViewController()
        let nextVC2 = ProfileViewController()
        nextVC.nameTitle = food.productName
        nextVC.nameID = food.productID
        nextVC2.pname = food.productName
        nextVC2.nameID = food.productID
        DetailReqDataManager().reqDetail(nextVC2)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let food = foods[indexPath.row]
        cell.configure(with: food.imgUrl, title: food.productName, price: food.price)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
    
    
}
