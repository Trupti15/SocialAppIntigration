//
//  ViewController.swift
//  SocialAPPLogin
//
//  Created by Trupti on 4/20/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import UIKit

extension String {
    init(sep:String, _ lines:String...){
        self = ""
        for (idx, item) in lines.enumerate() {
            self += "\(item)"
            if idx < lines.count-1 {
                self += sep
            }
        }
    }

    init(_ lines:String...){
        self = ""
        for (idx, item) in lines.enumerate() {
            self += "\(item)"
            if idx < lines.count-1 {
                self += "\n"
            }
        }
    }
}



class ViewController: UIViewController {
    @IBOutlet weak var fbLoginBtn: UIButton!
    @IBOutlet weak var responseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //<------------------------------------ Twitter

    @IBAction func loginTwitter(sender: UIButton) {
        loginTwitter()
    }
    

    @IBAction func logOutTwitter(sender: UIButton) {
        logOutTwitter()
    }



    @IBAction func loginFacebook(sender: UIButton) {
        loginFacebook()
    }

    @IBAction func logOutFacebook(sender: UIButton) {
        logOutFacebook()
    }

    @IBAction func loginGplus(sender: UIButton) {

    }

    @IBAction func logOutGplus(sender: UIButton) {

    }

    @IBAction func loginLinkedIn(sender: UIButton) {
        createSession()
    }

    @IBAction func logOutLinkedIn(sender: UIButton) {
        clearSession()
    }


}





