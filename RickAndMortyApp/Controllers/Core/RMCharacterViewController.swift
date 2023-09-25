//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Элина on 22.09.2023.
//
import SnapKit
import UIKit

final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initialize()
       loadImages()
        
       title = "Characters"
    }
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var images: [UIImage?] = []
    private let apiManager = APIManager()
}
    
// MARK: - Private methods
    private extension RMCharacterViewController {
        func initialize() {
            let collectionViewLayout = UICollectionViewFlowLayout()
            
            collectionViewLayout.scrollDirection = .vertical
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            view.addSubview(collectionView)
            collectionView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalToSuperview().inset(200)
                make.height.equalTo(500)
            }
            
            view.addSubview(collectionView)
            

            collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.showsVerticalScrollIndicator = false
        }
        func loadImages() {
            let imageIDs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            var images: [UIImage?] = []
            
            let group = DispatchGroup()
            imageIDs.forEach {
                group.enter()
                apiManager.loadImage(id: $0) {image in
                    images.append(image)
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                self.images = images
                self.collectionView.reloadData()
            }
        }
    }

// MARK: - UICollectionViewDataSource

extension RMCharacterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { images.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.configure(image: images[indexPath.item])
        return cell
    }
}

extension RMCharacterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        CGSize(width: 160, height: 160)
    }
}
    



