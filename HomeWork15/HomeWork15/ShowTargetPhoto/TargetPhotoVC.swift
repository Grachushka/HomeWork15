//
//  TargetPhotoVC.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 01/09/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class TargetPhotoVC: UIViewController {
    
    @IBOutlet weak var fullImagePhoto: UIImageView!
    private weak var imageTask: URLSessionDataTask?
    var photo: Photo!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFullImage(url: photo.url)
    }
    
    func loadFullImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.fullImagePhoto.image = UIImage(data: data)
            }
        }
        imageTask = task
        task.resume()
    }
   
}
