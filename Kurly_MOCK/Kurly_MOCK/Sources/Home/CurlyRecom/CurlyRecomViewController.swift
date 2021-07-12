//
//  CurlyRecomViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import UIKit
import Kingfisher

class CurlyRecomViewController: BaseViewController {
    

    @IBOutlet weak var eventList: UIImageView!
    @IBOutlet weak var RecommendcollectionView: UICollectionView!
    @IBOutlet weak var DailycollectionView: UICollectionView!
    @IBOutlet weak var RandImage: UIImageView!
    @IBOutlet weak var RandEventName: UILabel!
    @IBOutlet weak var SalecollectionView: UICollectionView!
    @IBOutlet weak var NewcollectionView: UICollectionView!
    
    var data: RecomResponseResult?
    
    var recommends : [mdlist] = []
    var dailysales : [dailysalelist] = []
    var saleproducts : [saleproductlist] = []
    var news : [newproductlist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Constant.NICKNAME == ""{
            CurlyRecomReqDataManager().reqNewanonymous(self)
        }
        else{
            CurlyRecomReqDataManager().reqNew(self)
        }
        
        RecommendcollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        DailycollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        SalecollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        NewcollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
    }

}

extension CurlyRecomViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let nextVC = DetailViewController()
        let nextVC2 = ProfileViewController()
        
        if(collectionView == self.RecommendcollectionView)
        {
            nextVC.nameTitle = recommends[indexPath.row].productName
            nextVC.nameID = recommends[indexPath.row].productID
            nextVC2.pname = recommends[indexPath.row].productName
            nextVC2.nameID = recommends[indexPath.row].productID
            DetailReqDataManager().reqDetail(nextVC2)
        }
        else if(collectionView == self.DailycollectionView)
        {
            nextVC.nameTitle = dailysales[indexPath.row].productName
            nextVC.nameID = dailysales[indexPath.row].productID
            nextVC2.pname = dailysales[indexPath.row].productName
            nextVC2.nameID = dailysales[indexPath.row].productID
            DetailReqDataManager().reqDetail(nextVC2)
        }
        else if(collectionView == self.SalecollectionView)
        {
            nextVC.nameTitle = saleproducts[indexPath.row].productName
            nextVC.nameID = saleproducts[indexPath.row].productID
            nextVC2.pname = saleproducts[indexPath.row].productName
            nextVC2.nameID = saleproducts[indexPath.row].productID
            DetailReqDataManager().reqDetail(nextVC2)
        }
        else if(collectionView == self.NewcollectionView)
        {
            nextVC.nameTitle = news[indexPath.row].productName
            nextVC.nameID = news[indexPath.row].productID
            nextVC2.pname = news[indexPath.row].productName
            nextVC2.nameID = news[indexPath.row].productID
            DetailReqDataManager().reqDetail(nextVC2)
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == self.RecommendcollectionView)
        {
            return (data?.MDrecommendlist!.count)!
        }
        else if(collectionView == self.DailycollectionView)
        {
            return (data?.Dailysalelist!.count)!
        }
        else if(collectionView == self.SalecollectionView)
        {
            return (data?.Saleproductlist!.count)!
        }
        else if(collectionView == self.NewcollectionView)
        {
            return (data?.Newproductlist!.count)!
        }
        else
        {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell

        if(collectionView == self.RecommendcollectionView)
        {
            cell.configure(with: (data?.MDrecommendlist![indexPath.row].imgUrl)!, title: (data?.MDrecommendlist![indexPath.row].productName)!, price: (data?.MDrecommendlist![indexPath.row].price)!)

        }
        else if(collectionView == self.DailycollectionView)
        {
            cell.configure(with: (data?.Dailysalelist![indexPath.row].imgUrl)!, title: (data?.Dailysalelist![indexPath.row].productName)!, price: (data?.Dailysalelist![indexPath.row].price)!)
 
        }
        else if(collectionView == self.SalecollectionView)
        {
            cell.configure(with: (data?.Saleproductlist![indexPath.row].imgUrl)!, title: (data?.Saleproductlist![indexPath.row].productName)!, price: (data?.Saleproductlist![indexPath.row].price)!)

        }
        else if(collectionView == self.NewcollectionView)
        {
            cell.configure(with: (data?.Newproductlist![indexPath.row].imgUrl)!, title: (data?.Newproductlist![indexPath.row].productName)!, price: (data?.Newproductlist![indexPath.row].price)!)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 300)
    }
    
    
}


extension CurlyRecomViewController {
    func didSuccess(_ result: RecomResponseResult) {
//        self.data = result
//
//        recommends = (data?.MDrecommendlist)!
//        dailysales = (data?.Dailysalelist)!
//        saleproducts = (data?.Saleproductlist)!
//        news = (data?.Newproductlist)!
//        
//        let source = (data?.Eventlist![4].imgUrl)
//
//        let url = URL(string: source!)
//        eventList.contentMode = .scaleAspectFit
//        eventList.kf.setImage(with: url)
//
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 185, height: 300)
//        layout.scrollDirection = .horizontal
//
//        RecommendcollectionView.collectionViewLayout = layout
//        DailycollectionView.collectionViewLayout = layout
//        SalecollectionView.collectionViewLayout = layout
//        NewcollectionView.collectionViewLayout = layout
//
//        RecommendcollectionView.delegate = self
//        RecommendcollectionView.dataSource = self
//
//        DailycollectionView.delegate = self
//        DailycollectionView.dataSource = self
//
//        SalecollectionView.delegate = self
//        SalecollectionView.dataSource = self
//
//        NewcollectionView.delegate = self
//        NewcollectionView.dataSource = self
//
//        let randurl = URL(string: (data?.Randeventlist![0].imgUrl)!)
//        RandImage.contentMode = .scaleAspectFill
//        RandImage.kf.setImage(with: randurl)
//
//        RandEventName.text = (data?.Randeventlist![0].eventText)!
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
