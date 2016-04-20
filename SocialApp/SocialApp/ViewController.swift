//
//  ViewController.swift
//  SocialApp
//
//  Created by Trupti on 4/19/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnTwitterLogin: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()


        /* twitter button */
        //        let logInButton = TWTRLogInButton { (session, error) in
        //            if let unwrappedSession = session {
        //                let alert = UIAlertController(title: "Logged In",
        //                    message: "User \(unwrappedSession.userName) has logged in",
        //                    preferredStyle: UIAlertControllerStyle.Alert
        //                )
        //                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        //                self.presentViewController(alert, animated: true, completion: nil)
        //            } else {
        //                NSLog("Login error: %@", error!.localizedDescription);
        //            }
        //        }
        //
        //        logInButton.center = self.view.center
        //        self.view.addSubview(logInButton)
    }


//
//    @IBAction func loginAction(sender: UIButton) {
//
//        //        Twitter.sharedInstance().logInWithCompletion { (session, error) -> Void in
//        //            if let twSession = session {
//        //                twSession.userID
//        //                twSession.userName
//        //                twSession.authToken
//        //                twSession.authTokenSecret
//        //            }
//        //            print(session)
//        //        }
//
//        Twitter.sharedInstance().logInWithMethods([.All]) { twitterSession, error in
//            if let session = twitterSession {
//                print(session.userID)
//                print(session.userName)
//                print(session.authToken)
//                print(session.authTokenSecret)
//            }
//
//
//
//            //for email request
//            let client = TWTRAPIClient.clientWithCurrentUser()
//            let request = client.URLRequestWithMethod("GET",
//                URL: "https://api.twitter.com/1.1/account/verify_credentials.json",
//                parameters: ["include_email": "true", "skip_status": "true"],
//                error: nil)
//            client.sendTwitterRequest(request) { response, data, connectionError in
//                //                print(response)
//                //                print(request)
//            }
//
//        }
//
//
//
//        /*
//        let store = Twitter.sharedInstance().sessionStore
//        let lastSession = store.session
//        let sessions = store.existingUserSessions()
//
//        //get session from userID
//        let specificSession = store.sessionForUserID("123")
//        */
//
//    }
//    
//    @IBAction func logOutTwitter(sender: UIButton) {
//        if let store = Twitter.sharedInstance().sessionStore as TWTRSessionStore?{
//            if let session = store.session(){
//                if let userID = session.userID as String?{
//                    store.logOutUserID(userID)
//                }
//            }
//        }
//        
//        
//        
//    }

    
    
}