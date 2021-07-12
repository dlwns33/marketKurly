//
//  BaseTabBarController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let homeViewController  = HomeViewController()
    let recomViewController = NewViewController()
    let categoryViewController  = CategoryViewController()
    let searchViewController  = SearchViewController()
    var mycurlyViewController : UIViewController?
    
    
    let homeTabBarItem  = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    let recomTabBarItem = UITabBarItem(title: "추천", image: UIImage(systemName: "star.fill"), tag: 1)
    let categoryTabBarItem  = UITabBarItem(title: "카테고리", image: UIImage(systemName: "line.horizontal.3"), tag: 2)
    let searchTabBarItem  = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 3)
    let mycurlyTabBarItem  = UITabBarItem(title: "마이컬리", image: UIImage(systemName: "person.fill"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if JwtToken.token == ""{
            mycurlyViewController  = LoginXViewController()
        }
        else{
            mycurlyViewController  = LoginOViewController()
        }
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let recomNavigationController = UINavigationController(rootViewController: recomViewController)
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let mycurlyNavigationController = UINavigationController(rootViewController: mycurlyViewController!)
        
        homeNavigationController.tabBarItem = homeTabBarItem
        recomNavigationController.tabBarItem = recomTabBarItem
        categoryNavigationController.tabBarItem  = categoryTabBarItem
        searchNavigationController.tabBarItem  = searchTabBarItem
        mycurlyNavigationController.tabBarItem  = mycurlyTabBarItem
       
        self.viewControllers = [homeNavigationController,
                                recomNavigationController,
                                categoryNavigationController,
                                searchNavigationController,
                                mycurlyNavigationController]
        
        self.delegate = self
        
        UITabBar.appearance().tintColor = .mainPurple
        
    }
    
}
