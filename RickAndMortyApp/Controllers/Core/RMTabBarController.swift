//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Элина on 22.09.2023.
//

import SnapKit
import UIKit

final class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        navigationItem.title = "Rick and Morty"
        
    }
    }

//private var collectionView = UICollectionView()

private extension RMTabBarController {
    
    private func initialize() {
        view.backgroundColor = .systemBackground
        setUpTabs()
        navigationItem.rightBarButtonItem = makeRightBarButtonItem()
    }
    
    
    private func setUpTabs() {
        let charactersVC = RMCharacterViewController()
        let describesVC = RMDescribesViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        describesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: describesVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.circle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Describes", image: UIImage(systemName: "person.badge.shield.checkmark.fill"), tag: 2)
        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2],
            animated: true)
    }
    private func makeRightBarButtonItem() -> UIBarButtonItem {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapHeartButton))
        return addBarButtonItem
    }
    @objc func didTapHeartButton() {
        print("heart")
    }
    
   
}

