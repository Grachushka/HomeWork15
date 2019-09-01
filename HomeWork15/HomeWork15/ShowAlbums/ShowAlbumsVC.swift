//
//  ShowAlbumsVC.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class ShowAlbumsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var showAlbumsTable: UITableView!

    private var albums: [Album] = [] {
        
        didSet {
            showAlbumsTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAlbumsTable.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        NetworkManager.shared.loadAlbums { result in
            
            switch result {
                
            case .success(let albums):
                self.albums = albums
                print(albums.count)
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: "ShowAlbumsVC", sender: indexPath)
        print(albums[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albums.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        
        let album = albums[indexPath.row]
        cell.idAlbum.text = "\(album.id)"
        cell.titleAlbum.text = "\(album.title)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let albumId = albums[(sender as! IndexPath).row].id
        if let vc = segue.destination as? PhotoCollectionVC {
            vc.albumId = albumId
            
            
        }
    }
}


