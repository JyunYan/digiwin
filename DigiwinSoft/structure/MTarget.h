//
//  MTarget.h
//  DigiwinSoft
//
//  Created by Jyun on 2015/6/30.
//  Copyright (c) 2015年 Jyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTarget : NSObject

@property (nonatomic, strong) NSString* uuid;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* unit;


@property (nonatomic, strong) NSString* top;    //頂標
@property (nonatomic, strong) NSString* avg;    //均標
@property (nonatomic, strong) NSString* bottom; //底標
@property (nonatomic, strong) NSString* upMin;  //實績提升率min
@property (nonatomic, strong) NSString* upMax;  //實績提升率max


@end
