//
//  NSObject_GameState.h
//  CarGame
//
//  Created by John Kriston on 7/8/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject ()

@property (nonatomic, assign) int score;
@property (nonatomic, assign) int bestScore;

+ (instancetype)sharedInstance;

@end
