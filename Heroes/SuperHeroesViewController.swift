//
//  ViewController.swift
//  Heroes
//
//  Created by Максим Удальцов on 13.11.2023.
//

import UIKit
import Kingfisher

class SuperHeroesViewController: UICollectionViewController {
    
    private var superheroes: [Superhero] = []
    private let networkmanager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperheroes()
    }
    
    // MARK: - UIcolectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superheroes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "superhero", for: indexPath) as! CollectionViewCell
        let superhero = superheroes[indexPath.row]
        cell.configure(witch: superhero)
        return cell
    }

    @IBAction func clearCache(_ sender: UIBarButtonItem) {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache {
            print("Done")
        }
    }
    
    private func fetchSuperheroes() {
        networkmanager.fetchData { result in
            switch result {
            case .success(let superheroes):
                self.superheroes = superheroes
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

