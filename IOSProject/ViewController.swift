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
        title = "Bar Items"
        
        let button = UIButton(frame: CGRect(x: 100, y: 70, width: 200, height: 50))
        let button2 = UIButton(frame: CGRect(x: 100, y: 50, width: 30, height: 30))
        let button3 = UIButton(frame: CGRect(x: 100, y: 50, width: 30, height: 30))
        
        
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(button3)
        
        
        
        
        button.backgroundColor = .systemPink
        button.setTitle("Go to view 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
       //button2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.bottom
        //button2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
       
        button2.backgroundColor = .systemGray
        button2.setTitle("Go to view 3", for: .normal)
        button2.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        configureItems()
        
        // Do any additional setup after loading the view.
    }
    
    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    
    }
    
    @objc func didTapButton(){
        let vc = UIViewController()
        vc.title = "View 2"
        vc.view.backgroundColor = .systemCyan
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    }




    
    
