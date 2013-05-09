//
//  TicTacToeAppDelegate.h
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TileView.h"


@interface TicTacToeAppDelegate : UIResponder <UIApplicationDelegate, TileViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *aScoreLabel;
@property (strong, nonatomic) UILabel *eScoreLabel;
@property int currentTile;
@property int previousTile;
@property int whoseTurn;
@property int turnCount;
@property int currRound;
@property int aScore;
@property int eScore;
@property int maxRounds;
@property BOOL tileChosen;
@property BOOL isWinner;

@property NSArray *tileArray;
@property NSMutableArray *choiceArray;
@property (strong, nonatomic) TileView *v0;
@property (strong, nonatomic) TileView *v1;
@property (strong, nonatomic) TileView *v2;
@property (strong, nonatomic) TileView *v3;
@property (strong, nonatomic) TileView *v4;
@property (strong, nonatomic) TileView *v5;
@property (strong, nonatomic) TileView *v6;
@property (strong, nonatomic) TileView *v7;
@property (strong, nonatomic) TileView *v8;
@property (strong, nonatomic) UIButton *resetButton;

@property (strong, nonatomic) UIImageView *defaultImageView;

@end
