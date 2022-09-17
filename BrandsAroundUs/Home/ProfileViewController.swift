//
//  ProfileViewController.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/13/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         navigationController?.navigationBar.isTranslucent = false
               navigationController?.navigationBar.barTintColor = .black
               navigationController?.navigationBar.tintColor = .green
               navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        self.view.backgroundColor = .black
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
