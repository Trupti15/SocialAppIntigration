//
//  Helper.m
//  LinkedInEx
//
//  Created by Trupti on 4/20/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

#import "Helper.h"
#import "LinkedInHelper.h"

@implementation Helper
#pragma mark - Button Actions -

- (void)logoutLinkedIn {

    LinkedInHelper *linkedIn = [LinkedInHelper sharedInstance];
    [linkedIn logout];
}

- (BOOL)isLinkedInAccessTokenValid {
    return [LinkedInHelper sharedInstance].isValidToken;
}

//- (IBAction)btnConnectTapped:(UIButton *)sender {
-(void)connectToLinkedIn:(NSString *)clientId  clientSecret:(NSString *)clientSecret redirectUrl:(NSString*)redirectUrl state:(NSString *)state userInfo:(void (^)(NSDictionary*))userDict{
    LinkedInHelper *linkedIn = [LinkedInHelper sharedInstance];

    // If user has already connected via linkedin in and access token is still valid then
    // No need to fetch authorizationCode and then accessToken again!

    if (linkedIn.isValidToken) {

        linkedIn.customSubPermissions = [NSString stringWithFormat:@"%@,%@", first_name, last_name];

        // So Fetch member info by elderyly access token
        [linkedIn autoFetchUserInfoWithSuccess:^(NSDictionary *userInfo) {
            // Whole User Info

            //            NSString * desc = [NSString stringWithFormat:@"first name : %@\n last name : %@", userInfo[@"firstName"], userInfo[@"lastName"] ];
            //            [self showAlert:desc];

            NSLog(@"user Info : %@", userInfo);
            userDict(userInfo);
        } failUserInfo:^(NSError *error) {
            NSLog(@"error : %@", error.userInfo.description);
        }];
    } else {

        linkedIn.cancelButtonText = @"Close"; // Or any other language But Default is Close

        NSArray *permissions = @[@(BasicProfile),
                                 @(EmailAddress),
                                 @(Share),
                                 @(CompanyAdmin)];

        linkedIn.showActivityIndicator = YES;


        [linkedIn requestMeWithSenderViewController:self
                                           clientId:clientId
                                       clientSecret:clientSecret
                                        redirectUrl:@"www.liftoffllc.com"
                                        permissions:permissions
                                              state:state
                                    successUserInfo:^(NSDictionary *userInfo) {

//                                        self.btnLogout.hidden = !linkedIn.isValidToken;
                                        
                                                                                NSString * desc = [NSString stringWithFormat:@"first name : %@\n last name : %@",
                                                                                                   userInfo[@"firstName"], userInfo[@"lastName"] ];
                                        //                                        [self showAlert:desc];

                                        // Whole User Info
                                        NSLog(@"user Info : %@", userInfo);
                                        // You can also fetch user's those informations like below
                                        NSLog(@"job title : %@",     [LinkedInHelper sharedInstance].title);
                                        NSLog(@"company Name : %@",  [LinkedInHelper sharedInstance].companyName);
                                        NSLog(@"email address : %@", [LinkedInHelper sharedInstance].emailAddress);
                                        NSLog(@"Photo Url : %@",     [LinkedInHelper sharedInstance].photo);
                                        NSLog(@"Industry : %@",      [LinkedInHelper sharedInstance].industry);
                                        
                                        userDict(userInfo);

                                    }
                                  failUserInfoBlock:^(NSError *error) {
                                      NSLog(@"error : %@", error.userInfo.description);
//                                      self.btnLogout.hidden = !linkedIn.isValidToken;
                                  }
         ];
    }
}

@end
