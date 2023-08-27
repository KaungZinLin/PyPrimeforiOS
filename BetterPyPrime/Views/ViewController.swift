//
//  ViewController.swift
//  BetterPyPrime
//
//  Created by Kaung Zin Lin on 27.08.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadFPFNPVCPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FPFNPVC", sender: self)
        
    }
    
    @IBAction func loadCPFFVCPressed(_ sender: UIButton) {
    
        self.performSegue(withIdentifier: "CPFFVC", sender: self)
    }
    
    
    @IBAction func loadAboutVCPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ABOUTVC", sender: self)
    }
    

  


}

