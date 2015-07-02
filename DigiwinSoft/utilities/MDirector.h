//
//  MDirector.h
//  DigiwinSoft
//
//  Created by Jyun on 2015/6/26.
//  Copyright (c) 2015年 Jyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUser.h"
#import "MPhenomenon.h"
#import "MIssue.h"

@interface MDirector : NSObject

@property (nonatomic, strong) MUser* currentUser;   // 目前的user

@property (nonatomic, strong) MPhenomenon* selectedPhen;
@property (nonatomic, strong) MIssue* selectedIssue;

+(MDirector*) sharedInstance;

- (UIColor *)getCustomGrayColor;
- (UIColor *)getCustomLightGrayColor;
- (UIColor *)getCustomBlueColor;
- (UIColor *)getCustomRedColor;

@end
