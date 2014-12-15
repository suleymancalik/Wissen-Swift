//
//  ViewController.swift
//  Ders7
//
//  Created by Suleyman Calik on 22.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {

    @IBOutlet weak var koleksiyon: UICollectionView!
    
    var githubPictures   = Array<String>()
    var facebookPictures = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for var i = 0 ; i<10 ; i++ {
            githubPictures.append("github")
        }
        
        for var i = 0 ; i<10 ; i++ {
            facebookPictures.append("facebook")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - CollectionView Methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    // collectionView'da her section'da gosterilecek kac tane item oldugunu return ediyoruz
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return githubPictures.count
        case 1:
            return facebookPictures.count
        default:
            return 0
        }
    }
    
    // her bir item icin icerik olusturup return ediyoruz
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // collectionView'den cache'lenmis cell'i KoleksiyonCellID identifier'i ile cekiyoruz
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("KoleksiyonCellID", forIndexPath: indexPath) as KoleksiyonCell
        cell.picture.alpha = 1
        
        switch indexPath.section {
        case 0:
            // ilk section icin picture'lari githubPictures dizisinden aliyoruz
            cell.picture.image = UIImage(named: githubPictures[indexPath.item])
        case 1:
            // ikinci section icin picture'lari facebookPictures dizisinden aliyoruz
            cell.picture.image = UIImage(named: facebookPictures[indexPath.item])
        default:
            // 0 ve 3 disinda bir section gelirse(gelmeyecek ama biz yaziyoruz)
            // picture'i bosaltiyoruz
            cell.picture.image = nil
        }
        
        return cell
    }

    
    // Header icin gerekli method
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        // storyboard'da olusturdugumuz header'i cache'lenmis olarak aliyoruz
        var header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "KoleksiyonHeaderID", forIndexPath: indexPath) as KoleksiyonHeader
        
        // section'i kontrol ederek basligini atiyoruz
        switch indexPath.section {
        case 0:
            header.lblTitle.text = "Github"
        case 1:
            header.lblTitle.text = "Facebook"
        default:
            header.lblTitle.text = ""

        }
        
        // duzenlemeyi yaptiktan sonra header'i collectionview'e geri donuyoruz
        return header
    }
    
}








