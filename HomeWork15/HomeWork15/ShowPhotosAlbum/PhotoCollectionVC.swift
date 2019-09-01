//
//  PhotoCollectionVC.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionVC: UICollectionViewController {
    
    var albumId: Int?
    var photo: Photo!
    
    private var photos: [Photo] = []{
        
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.loadPhoto { result in
            
            switch result {
                
            case .success(let photos):
                
               
                self.photos = photos.filter { $0.albumID == self.albumId }
                
                for item in self.photos {
                    print(item.albumID)
                }
                
            case .failure(let error):
                print(error)
                
            }
        }

    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        photo = photos[indexPath.row]
        
        let next: TargetPhotoVC = self.storyboard?.instantiateViewController(withIdentifier: "TargetPhotoVC") as! TargetPhotoVC
        next.photo = photo
        self.navigationController?.pushViewController(next, animated: true)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.title.text = photo.title
        cell.loadMiniImage(url: photo.thumbnailURL)
        cell.loadFullImage(url: photo.url)
        return cell
    
        }
    }

    

