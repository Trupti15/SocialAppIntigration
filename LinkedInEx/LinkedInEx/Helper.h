//
//  Helper.h
//  LinkedInEx
//
//  Created by Trupti on 4/20/16.
//  Copyright © 2016 LiftOff LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

- (void)logoutLinkedIn;
//-(void)connectToLinkedIn:(NSString *)clientId  clientSecret:(NSString *)clientSecret redirectUrl:(NSString*)redirectUrl state:(NSString *)state;
-(void)connectToLinkedIn:(NSString *)clientId  clientSecret:(NSString *)clientSecret redirectUrl:(NSString*)redirectUrl state:(NSString *)state userInfo:(void (^)(NSDictionary*))userDict;

- (BOOL)isLinkedInAccessTokenValid ;
@end
