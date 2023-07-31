//
//  FollowersVC.swift
//  GetFollowers App
//
//  Created by ahlam on 30/07/2023.
//

import UIKit

class FollowersVC: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
 
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var followersCV: UICollectionView!
    var userName = ""
    let currentDate = Date()
    var birthDate : Date? = nil
    let calender = Calendar.current
    var followers = ["Ahmed ali" , "Mona" , "Adel fawzy" , "Asmaa mohamed" , "Koka"]

    override func viewDidLoad() {
        super.viewDidLoad()

       registerCell()
        
        name.text = "Good Morning,\(userName)"
        if birthDate != nil {
            let ageComponents = calender.dateComponents([.year], from: birthDate! , to: currentDate)
            if  let ageNum = ageComponents.year {
                age.text = "your age is : \(ageNum) years"

            }
        }
        
    
    }
    
    func registerCell(){
        followersCV.dataSource = self
        followersCV.delegate = self
        followersCV.register(UINib(nibName: "FollowerCell", bundle: nil), forCellWithReuseIdentifier: "FollowerCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowerCell", for: indexPath) as! FollowerCell
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .full
        dateFormater.timeStyle = .short
        cell.currentTimeLbl.text = "Current Time : \(dateFormater.string(from: currentDate))"
        cell.followerNameLbl.text = followers[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height/5)
    }

  

}
