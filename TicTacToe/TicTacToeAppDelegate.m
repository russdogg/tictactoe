//
//  TicTacToeAppDelegate.m
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//
#import "TileView.h"
#import "TicTacToeAppDelegate.h"

@implementation TicTacToeAppDelegate

@synthesize titleLabel, tileChosen, currentTile, previousTile, whoseTurn, currRound, tileArray, v0, v1, v2, v3, v4, v5, v6, v7, v8;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //TITLE FRAME
    CGRect titleFrame = CGRectMake(0, 30, 320, 50);
    
    titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    titleLabel.text = @"PLAYER X's TURN!";
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:30.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //DRAW VIEW TILES
    CGRect frame00 = CGRectMake(20, 100, 80, 80);
    CGRect frame01 = CGRectMake(120, 100, 80, 80);
    CGRect frame02 = CGRectMake(220, 100, 80, 80);
    
    CGRect frame03 = CGRectMake(20, 200, 80, 80);
    CGRect frame04 = CGRectMake(120, 200, 80, 80);
    CGRect frame05 = CGRectMake(220, 200, 80, 80);
    
    CGRect frame06 = CGRectMake(20, 300, 80, 80);
    CGRect frame07 = CGRectMake(120, 300, 80, 80);
    CGRect frame08 = CGRectMake(220, 300, 80, 80);
    
    v0 = [[TileView alloc] initWithFrame:frame00];
    v1 = [[TileView alloc] initWithFrame:frame01];
    v2 = [[TileView alloc] initWithFrame:frame02];
    v3 = [[TileView alloc] initWithFrame:frame03];
    v4 = [[TileView alloc] initWithFrame:frame04];
    v5 = [[TileView alloc] initWithFrame:frame05];
    v6 = [[TileView alloc] initWithFrame:frame06];
    v7 = [[TileView alloc] initWithFrame:frame07];
    v8 = [[TileView alloc] initWithFrame:frame08];
        
    [v0 setBackgroundColor: [UIColor redColor]];
    [v1 setBackgroundColor: [UIColor redColor]];
    [v2 setBackgroundColor: [UIColor redColor]];
    [v3 setBackgroundColor: [UIColor redColor]];
    [v4 setBackgroundColor: [UIColor redColor]];
    [v5 setBackgroundColor: [UIColor redColor]];
    [v6 setBackgroundColor: [UIColor redColor]];
    [v7 setBackgroundColor: [UIColor redColor]];
    [v8 setBackgroundColor: [UIColor redColor]];
    
    [v0 setTag:-1];
    [v1 setTag:-1];
    [v2 setTag:-1];
    [v3 setTag:-1];
    [v4 setTag:-1];
    [v5 setTag:-1];
    [v6 setTag:-1];
    [v7 setTag:-1];
    [v8 setTag:-1];
    
    [v0 setId:0];
    [v1 setId:1];
    [v2 setId:2];
    [v3 setId:3];
    [v4 setId:4];
    [v5 setId:5];
    [v6 setId:6];
    [v7 setId:7];
    [v8 setId:8];
    
    v0.delegate = self;
    v1.delegate = self;
    v2.delegate = self;
    v3.delegate = self;
    v4.delegate = self;
    v5.delegate = self;
    v6.delegate = self;
    v7.delegate = self;
    v8.delegate = self;
    
    [self.window addSubview:titleLabel];
    
    [self.window addSubview:v0];
    [self.window addSubview:v1];
    [self.window addSubview:v2];
    [self.window addSubview:v3];
    [self.window addSubview:v4];
    [self.window addSubview:v5];
    [self.window addSubview:v6];
    [self.window addSubview:v7];
    [self.window addSubview:v8];
    
    
    tileArray = [[NSArray alloc] initWithObjects:v0,v1,v2,v3,v4,v5,v6,v7,v8, nil];
    previousTile = -1;
    whoseTurn = 0;
    currRound = 0;
    tileChosen = NO;
    
    //CONFIRM BUTTON
    CGRect confirmFrame = CGRectMake(20.0f, 420.0f, 120.0f, 40.0f);
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:confirmFrame];
    [confirmButton setBackgroundColor:[UIColor redColor]];
    [confirmButton setTitle:@"CONFIRM" forState:UIControlStateNormal];
    [confirmButton setTitle:@"CONFIRMING" forState:UIControlStateHighlighted];
    confirmButton.titleLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:21.0];
    [confirmButton addTarget:self action:@selector(confirmChoice) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:confirmButton];
    
    
    //RESET BUTTON
    CGRect resetFrame = CGRectMake(180.0f, 420.0f, 120.0f, 40.0f);
    UIButton *resetButton = [[UIButton alloc] initWithFrame:resetFrame];
    [resetButton setBackgroundColor:[UIColor redColor]];
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [resetButton setTitle:@"RESETTING" forState:UIControlStateHighlighted];
    resetButton.titleLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:21.0];
    [resetButton addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:resetButton];
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)confirmChoice
{
    if (tileChosen)
    {
        currRound ++;
        
        if (whoseTurn == 0)
        {
            whoseTurn = 1;
        }
        else
        {
            whoseTurn = 0;
        }
        
        TileView *tempView = [tileArray objectAtIndex:currentTile];
        
        if (tempView.tag!= -1)
        {
            [[tileArray objectAtIndex:currentTile] setPicked:YES];
        }
        
        int i;
        int count;
        
        count = [tileArray count];
        
        for (i = 0; i < count; i++)
        {
            [[tileArray objectAtIndex:i] setWhoseTurn:whoseTurn];
            [[tileArray objectAtIndex:i] resetView];
        }

        
        NSLog(@"CONFIRMED! currRound: %i, whoseTurn: %i", currRound, whoseTurn);
        
        
        [self updateAfterRound];
    }
    
    
}

-(void)updateAfterRound
{
    if (whoseTurn == 0)
    {
        titleLabel.text = @"PLAYER X's TURN!";
    }
    else
    {
        titleLabel.text = @"PLAYER O's TURN!";
    }
    
    if (currRound ==9)
    {
        titleLabel.text = @"TIED GAME :(";
    }
    tileChosen = NO;
}

-(void)resetGame
{
    NSLog(@"RESET THE GAME!");
    titleLabel.text = @"PLAYER X's TURN";
    currRound = 0;
    whoseTurn = 0;
    tileChosen = NO;
    
    int i;
    int count;
    
    count = [tileArray count];
    
    for (i = 0; i < count; i++)
    {
        [[tileArray objectAtIndex:i] setPicked:NO];
        [[tileArray objectAtIndex:i] setWhoseTurn:whoseTurn];
        [[tileArray objectAtIndex:i] resetView];
    }    
}

- (void)didSelectTile:(int)tile
{
    NSLog(@"Returned from Tile Myview %i",tile);
    tileChosen = YES;
    currentTile = tile;
    if (previousTile != currentTile  && previousTile != -1)
    {
        TileView *tempView = [tileArray objectAtIndex:previousTile];
        if(tempView.picked == NO)
        {
            NSLog(@"previous tile not matched to currentTile %i %i", currentTile, previousTile);
            [[tileArray objectAtIndex:previousTile] resetView];
        }
    }
    
    previousTile = currentTile;
}

@end
