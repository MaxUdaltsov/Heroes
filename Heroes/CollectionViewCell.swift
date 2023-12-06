//
//  CollectionViewCell.swift
//  Heroes
//
//  Created by Максим Удальцов on 15.11.2023.
//

import UIKit
import Kingfisher

final class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 15
        }
    }
    
    func configure(witch superhero: Superhero) {
        mainLabel.text = superhero.name
        let imageUrl = URL(string: superhero.images.lg)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        ) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.lastPathComponent ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
