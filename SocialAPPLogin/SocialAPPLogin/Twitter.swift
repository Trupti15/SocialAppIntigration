//
//  Twitter.swift
//  SocialAPPLogin
//
//  Created by Trupti on 4/22/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//


import Foundation
import TwitterKit

extension ViewController{

    /*
    Callback for login success or failure.
    The TWTRSession is also available on the [Twitter sharedInstance] singleton.
    Here we pop an alert just to give an example of how to read Twitter user info out of a TWTRSession.*/
    //        let logInButton = TWTRLogInButton { (session, error) in
    //            if let unwrappedSession = session {
    //                print(unwrappedSession.userName)
    //            }
    //        }
    //        logInButton.center = self.view.center
    //        self.view.addSubview(logInButton)

    
    
    func loginTwitter(){
        Twitter.sharedInstance().logInWithMethods([.All]) { twitterSession, error in
            if let session = twitterSession {
                self.responseLabel.text =
                    String(
                    "userID -- >  \(session.userID)",
                    "",

                    "userName -- >  \(session.userName)",
                    "",

                    "authToken -- >  \(session.authToken)",
                    "",
                    "authTokenSecret -- >  \(session.authTokenSecret)"
                )
            }
            //for email request
            let client = TWTRAPIClient.clientWithCurrentUser()
            let request = client.URLRequestWithMethod("GET",
                URL: "https://api.twitter.com/1.1/account/verify_credentials.json",
                parameters: ["include_email": "true", "skip_status": "true"],
                error: nil)
            client.sendTwitterRequest(request) { response, data, connectionError in
                //                print(response)
                //                print(request)
            }
        }
        /* can fetch more then one session
        let store = Twitter.sharedInstance().sessionStore
        let lastSession = store.session
        let sessions = store.existingUserSessions()

        //get session from userID
        let specificSession = store.sessionForUserID("123")
        */
    }


   func logOutTwitter(){
    if let store = Twitter.sharedInstance().sessionStore as TWTRSessionStore?{
        if let session = store.session(){
            if let userID = session.userID as String?{
                store.logOutUserID(userID)
            }
        }
    }

    }
}