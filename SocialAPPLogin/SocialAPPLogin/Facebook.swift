//
//  Facebook.swift
//  SocialAPPLogin
//
//  Created by Trupti on 4/22/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit

extension ViewController{

    func loginFacebook(){
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
                    let token = FBSDKAccessToken.currentAccessToken().tokenString
                        print("token -->  \(token)")
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
                }
            }
        }
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

                var imageUrl = ""
                if let picture  = result["picture"] as? [String:AnyObject]{
                    if let data = picture["data"] as? [String:AnyObject]{
                        if let url = data["url"] as? String {
                            imageUrl = url
                        }
                    }

                }

                let id  = result.valueForKey("id") as! String
                var name = ""
                var email = ""
                if let fbname = result.valueForKey("name") as? String{
                    name = fbname
                }
                if let emailID = result.valueForKey("email") as? String{
                    email = emailID
                }

                self.responseLabel.text =
                    String(
                        "userID -- >  \(id)",
                        "",

                        "name -- >  \(name)",
                        "",

                        "email -- >  \(email)",
                        "",
                        "picUrl -- >  \(imageUrl)"
                )


            }
        })
    }
    

    func logOutFacebook(){
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logOut()
    }

}