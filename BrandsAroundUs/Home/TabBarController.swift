//
//  TabBarController.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/13/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.tintColor = .gray
        self.tabBar.barTintColor = .black
        self.tabBar.backgroundColor = .black
        tabBar.unselectedItemTintColor = .green
        setNavigationBar()
    }
    
    func setNavigationBar(){
        //UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
        self.navigationItem.hidesBackButton = true
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = .green
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.green,
                                                            .font : UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!]
        UINavigationBar.appearance().barTintColor = .black
        //UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
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
