//
//  RMCharacter.swift
//  RickAndMortyApp
//
//  Created by Элина on 22.09.2023.
//

import SnapKit
import Kingfisher
import UIKit

class ImageCell: UICollectionViewCell {
    // MARK: - Public
    func configure(image: UIImage?) {
        imageView.image = image
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
      
        return view
    }()
    
    
}
// MARK: Private methods
private extension ImageCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.edges.equalToSuperview().inset(5)
        }
    }
    }
        
        
        
        
      
