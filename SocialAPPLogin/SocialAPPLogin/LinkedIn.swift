//
//  LinkedIn.swift
//  SocialAPPLogin
//
//  Created by Trupti on 4/22/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

import Foundation

extension ViewController{
   func createSession(){
    LISDKSessionManager.createSessionWithAuth([LISDK_BASIC_PROFILE_PERMISSION], state: "trupti", showGoToAppStoreDialog: false, successBlock: { (returnState) -> Void in
        //let session = LISDKSessionManager.sharedInstance().session
        if LISDKSessionManager.hasValidSession() {
            let url = "https://api.linkedin.com/v1/people/~"
            LISDKAPIHelper.sharedInstance().getRequest(url, success: { (response) -> Void in
                self.responseLabel.text = response.description
                }, error: { (error) -> Void in
                    print(error)
            })
        }
        }) { (error) -> Void in
                print("Error: \(error)")
            //open safari


            }
    }



    func linkedInligin(){
        var accessToken: LISDKAccessToken?

        func loadAccount(then: (() -> Void)?, or: ((String) -> Void)?) { // then & or are handling closures
            if let token = accessToken {
                LISDKSessionManager.createSessionWithAccessToken(token)
                if LISDKSessionManager.hasValidSession() {
                    LISDKAPIHelper.sharedInstance().getRequest("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,formatted-name,headline,location,industry,current-share,num-connections,num-connections-capped,summary,specialties,positions,picture-url,picture-urls::(original))?format=json",
                        success: {
                            response in
                            print(response.data)
                            then?()
                        },
                        error: {
                            error in
                            print(error)
                            or?("error")
                        }
                    )
                }
            } else {
                LISDKSessionManager.createSessionWithAuth([LISDK_BASIC_PROFILE_PERMISSION], state: nil, showGoToAppStoreDialog: true,
                    successBlock: {
                        (state) in
                        let accessToken = LISDKSessionManager.sharedInstance().session.accessToken
                        if LISDKSessionManager.hasValidSession() {
                            LISDKAPIHelper.sharedInstance().getRequest("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,formatted-name,headline,location,industry,current-share,num-connections,num-connections-capped,summary,specialties,positions,picture-url,picture-urls::(original))?format=json",
                                success: {
                                    response in
                                    print(response.data)
                                    then?()
                                },
                                error: {
                                    error in
                                    print(error)
                                    or?("error")
                                }
                            )
                        }
                    },
                    errorBlock: {
                        (error) in
                        switch error.code {
                        default:
                            if let errorUserInfo = error.userInfo["error"] as? NSString {
                                or?(errorUserInfo as String)
                            } else {
//                                or?(UIError.Code.Unknown)
                            }
                        }
                    }
                )
            }
        }

    }




    func clearSession(){
//       let session = LISDKSessionManager.sharedInstance().session
        LISDKSessionManager.clearSession()
    }
}