//
//  ViewController.swift
//  IOSProject
//
//  Created by Alumno on 29/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Barra de navegaciòn Tests"
        configureItems()
        
    }
    private func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }


}

    
    
