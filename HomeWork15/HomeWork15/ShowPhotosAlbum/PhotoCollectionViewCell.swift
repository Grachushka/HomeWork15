//
//  PhotoCollectionViewCell.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var miniImage: UIImageView!
    
    private weak var miniImageTask: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        miniImage.image = nil
        miniImageTask?.cancel()
    }
    
    func loadMiniImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.miniImage.image = UIImage(data: data)
            }
        }
        miniImageTask = task
        task.resume()
    }
    func loadFullImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.miniImage.image = UIImage(data: data)
            }
        }
        miniImageTask = task
        task.resume()
    }
    

    
}
