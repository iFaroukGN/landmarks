//
//  ViewController.swift
//  landmark
//
//  Created by Farouk GN on 16/08/2018.
//  Copyright © 2018 Farouk GN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView : UICollectionView!
    
    var screenSize = CGRect()
    
    var landscapeArrays:[LDKModel] = [LDKModel]()
    
    var navBar: UINavigationBar!
    
    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = UIColor.init(red:3.0/255, green:50.0/255, blue:9.0/255, alpha:1)
        
        
        landscapeArrays = [LDKModel(landmarkName: "The Colosseum",
                                    landmarkImage: #imageLiteral(resourceName: "colosseum")),
                           LDKModel(landmarkName: "The Eiffel Tower",
                                    landmarkImage: #imageLiteral(resourceName: "eiffel-tower")),
                           LDKModel(landmarkName: "Sagrada Familia",
                                    landmarkImage: #imageLiteral(resourceName: "la-sagrada-familia")),
                           LDKModel(landmarkName: "The Leaning Tower of Pisa",
                                    landmarkImage: #imageLiteral(resourceName: "pise")),
                           LDKModel(landmarkName: "Brandenburg Gate",
                                    landmarkImage: #imageLiteral(resourceName: "brandenburg-gate")),
                           LDKModel(landmarkName: "Ancient City Walls of Dubrovnik",
                                    landmarkImage: #imageLiteral(resourceName: "dubrovnik")),
                           LDKModel(landmarkName: "Acropolis",
                                    landmarkImage: #imageLiteral(resourceName: "acropolis")),
                           LDKModel(landmarkName: "Duomo, Florence",
                                    landmarkImage: #imageLiteral(resourceName: "cathedral-santa"))]
        
        screenSize = view.bounds
        
        let flowLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame:screenSize , collectionViewLayout: flowLayout)
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(LDKCollectionViewCell.self, forCellWithReuseIdentifier: LDKCollectionViewCell.reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }

    
    func setupNavigationBar() {
        
        if  #available(iOS 11.0, *) {
        
            navigationController?.navigationBar.prefersLargeTitles = true
            
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white];
            
            let searchController = UISearchController(searchResultsController: nil)
            
            searchController.searchBar.barStyle = .black
            
            searchController.searchBar.tintColor = UIColor.white
            searchController.searchBar.barTintColor = UIColor.white

            if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {

                    // Background color
                    backgroundview.backgroundColor = UIColor.white

                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            navigationItem.searchController = searchController
            
        } else {
            // Fallback on earlier versions

        }
        
        navigationController?.navigationBar.topItem?.title = "Landmarks"
        
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.setBackgroundImage( UIImage(), for: .default)
        
        navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor:UIColor.white]
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landscapeArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LDKCollectionViewCell.reuseIdentifier, for: indexPath) as! LDKCollectionViewCell
        
        cell.landmark = landscapeArrays[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let collectionViewWidth = collectionView.bounds.width/2
        
            let width = collectionViewWidth - 40
        
            return CGSize(width: width, height: width)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        feedbackGenerator = UISelectionFeedbackGenerator()
//
//        // Prepare the generator when the gesture begins.
//        feedbackGenerator?.prepare()
//
//        feedbackGenerator?.selectionChanged()
//
//        // Keep the generator in a prepared state.
//        feedbackGenerator?.prepare()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//         feedbackGenerator = nil
    }
    //set Minimum spacing between 2 items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
     //set minimum vertical line spacing here between two lines in collectionview
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {

        UIView.animate(withDuration: 0.2, animations: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, animations: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform.identity
        }, completion: nil)
//        feedbackGenerator = nil
    }
    
    
}

