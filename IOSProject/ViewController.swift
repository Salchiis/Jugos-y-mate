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
       // title = "Bar Items"
        
        let button = UIButton(frame: CGRect(x: 40, y: 400, width: 120, height: 50))
        let button2 = UIButton(frame: CGRect(x: 32, y: 470, width: 220, height: 50))
        let button3 = UIButton(frame: CGRect(x: 32, y: 570, width: 220, height: 50))
        
        
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(button3)
        
        
        
        
      // button.backgroundColor = .systemPink
        //button.setTitle("Go to view 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
       //button2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.bottom
        //button2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
       
      //  button2.backgroundColor = .systemGray
      //  button2.setTitle("Go to view 3", for: .normal)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
        
       // button3.backgroundColor = .systemGray
       // button3.setTitle("Go to view 4", for: .normal)
        button3.addTarget(self, action: #selector(didTapButton3), for: .touchUpInside)
        
        //configureItems()
        
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
    
    @objc func didTapButton2(){
        let vc = UIViewController()
        vc.title = "View 3"
        vc.view.backgroundColor = .systemRed
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapButton3(){
        let vc = UIViewController()
        vc.title = "View 4"
        vc.view.backgroundColor = .systemGreen
        
      // vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: nil)
       // navigationController?.pushViewController(vc, animated: true)
    }
    
    }




    
    
