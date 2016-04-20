//
//  ViewController.swift
//  SocialAPPLogin
//
//  Created by Trupti on 4/20/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import UIKit
import TwitterKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {
    @IBOutlet weak var fbLoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }

    //<------------------------------------ Twitter

    @IBAction func loginTwitter(sender: UIButton) {
        Twitter.sharedInstance().logInWithMethods([.All]) { twitterSession, error in
            if let session = twitterSession {
                print(session.userID)
                print(session.userName)
                print(session.authToken)
                print(session.authTokenSecret)
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
    

    @IBAction func logOutTwitter(sender: UIButton) {
        if let store = Twitter.sharedInstance().sessionStore as TWTRSessionStore?{
            if let session = store.session(){
                if let userID = session.userID as String?{
                    store.logOutUserID(userID)
                }
            }
        }
      }



//<------------------------------------ Facebook
    @IBAction func loginFacebook(sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()

        fbLoginManager.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
                }
            }
        }

    }


    @IBAction func logOutFacebook(sender: UIButton) {

    }





    func getFBUserData (){
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(100).height(100)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in

            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let id : NSString = result.valueForKey("id") as! String
                print("User ID is: \(id)")
            }
        })
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {

    }


    //<------------------------------------ Facebook





    @IBAction func loginGplus(sender: UIButton) {

    }
    @IBAction func logOutGplus(sender: UIButton) {

    }



//<------------------------------------ Facebook
    @IBAction func loginLinkedIn(sender: UIButton) {

//        var url = NSString(string:"https://api.linkedin.com/v1/people/~")
//
//        if LISDKSessionManager.hasValidSession {
//            LISDKAPIHelper.sharedInstance().getRequest(url, success: {
//                response in
//                //Do something with the response
//                }, error: {
//                    error in
//                    //Do something with the error
//            })
//        }

    }

    @IBAction func logOutLinkedIn(sender: UIButton) {

    }


}





