//
//  ViewController.swift
//  AppIconChanger
//
//  Created by sys on 2017. 12. 20..
//  Copyright © 2017년 sys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
        
            if UIApplication.shared.supportsAlternateIcons {
                if let alternateIconName = UIApplication.shared.alternateIconName {
                    print("current icon is \(alternateIconName), change to primary icon")
                    UIApplication.shared.setAlternateIconName(nil)
                } else {
                    print("current icon is primary icon, change to alternative icon")
                    UIApplication.shared.setAlternateIconName("thunderstorms"){ error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            print("Done!")
                        }
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

