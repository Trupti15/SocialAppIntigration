//
//  ViewController.swift
//  LinkedInEx
//
//  Created by Trupti on 4/20/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import UIKit
let clientID = "75ogjxmxurp9vv"
let clientSecret = "FwmOINNZSMOsXkgw"
let redirectUrl = "https://flashstorm-qa.herokuapp.com/"
let state = "DCEeFWf45A53sdfKef424"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Helper().connectToLinkedIn(redirectUrl, clientSecret: clientSecret, redirectUrl: redirectUrl, state: state) { (dict) -> Void in
            print(dict)

        }
    }

}

