//
//  TicTacToeAppDelegate.h
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"


@interface TicTacToeAppDelegate : UIResponder <UIApplicationDelegate, MyViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UILabel *titleLabel;
@property int currentTile;
@property int previousTile;
@property int whoseTurn;
@property int currRound;
@property BOOL tileChosen;

@property NSArray *tileArray;
@property (strong, nonatomic) MyView *v0;
@property (strong, nonatomic) MyView *v1;
@property (strong, nonatomic) MyView *v2;
@property (strong, nonatomic) MyView *v3;
@property (strong, nonatomic) MyView *v4;
@property (strong, nonatomic) MyView *v5;
@property (strong, nonatomic) MyView *v6;
@property (strong, nonatomic) MyView *v7;
@property (strong, nonatomic) MyView *v8;

@end
