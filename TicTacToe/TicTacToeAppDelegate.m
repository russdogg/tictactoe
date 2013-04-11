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

@synthesize titleLabel, tileChosen, currentTile, previousTile, whoseTurn, currRound, choiceArray, tileArray, v0, v1, v2, v3, v4, v5, v6, v7, v8, defaultImageView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIImage * defaultImage = [UIImage imageNamed: @"Default.png"];
    defaultImageView = [[UIImageView alloc] initWithImage: defaultImage];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window addSubview:defaultImageView];
    
    //TITLE FRAME
    CGRect titleFrame = CGRectMake(0, 30, 320, 50);
    
    titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    titleLabel.text = @"Player X's turn!";
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:45.0];
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
    choiceArray = [[NSMutableArray alloc] initWithObjects:v0,v1,v2,v3,v4,v5,v6,v7,v8, nil];
    
    previousTile = -1;
    whoseTurn = 0;
    currRound = 0;
    tileChosen = NO;
    
    //CONFIRM BUTTON
    CGRect confirmFrame = CGRectMake(20.0f, 420.0f, 120.0f, 40.0f);
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:confirmFrame];
    [confirmButton setBackgroundColor:[UIColor redColor]];
    [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
    [confirmButton setTitle:@"Confirming" forState:UIControlStateHighlighted];
    confirmButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22.0];
    [confirmButton addTarget:self action:@selector(confirmChoice) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:confirmButton];
    
    
    //RESET BUTTON
    CGRect resetFrame = CGRectMake(180.0f, 420.0f, 120.0f, 40.0f);
    UIButton *resetButton = [[UIButton alloc] initWithFrame:resetFrame];
    [resetButton setBackgroundColor:[UIColor redColor]];
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [resetButton setTitle:@"Reseting" forState:UIControlStateHighlighted];
    resetButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22.0];
    [resetButton addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:resetButton];
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    [self.window addSubview:defaultImageView];
    
    [self performSelector:@selector(hideImage) withObject:nil afterDelay:2.0];
    
    return YES;
}




-(void)hideImage
{
    
    defaultImageView.hidden = YES;
}


-(void)confirmChoice
{
    if (tileChosen)
    {
        //ADVANCE ROUND COUNT
        NSLog(@"CONFIRMED! currRound: %i, whoseTurn: %i", currRound, whoseTurn);
        
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
            [[tileArray objectAtIndex:currentTile] setTileLocked:YES];
            
        }
        
        int i;
        int count;
        
        count = [tileArray count];
        
        for (i = 0; i < count; i++)
        {
            [[tileArray objectAtIndex:i] setWhoseTurn:whoseTurn];
            [[tileArray objectAtIndex:i] resetView];
        }
        
        
        
        
        [UIView animateWithDuration:0.35
                         animations:^{titleLabel.alpha = 0.0;}
                         completion:^(BOOL finished){ [self updateAfterRound]; }];
        
        NSLog(@"CurrentTile: %i", currentTile);
        //NEED TO UPDATE CHOSEN ARRAY WITH THIS ITEM< EITHER X OR O, 0 or 1
        //[self updateAfterRound];
    }
    
    
}

-(void)updateAfterRound
{
    if (whoseTurn == 0)
    {
        titleLabel.text = @"Player X's Turn!";
    }
    else
    {
        titleLabel.text = @"Player O's Turn!";
    }
    NSLog(@"ROUND COUNT: %i", currRound + 1);
    
    //if (currRound ==9)
    //{
     //   titleLabel.text = @"TIED GAME :(";
    //}
    tileChosen = NO;
    
    [UIView animateWithDuration:0.35
                     animations:^{titleLabel.alpha = 1.0;}];
    
}

-(void)resetGame
{
    NSLog(@"RESET THE GAME!");
    titleLabel.text = @"Player X's Turn!";
    currRound = 0;
    whoseTurn = 0;
    tileChosen = NO;
    
    int i;
    int count;
    
    count = [tileArray count];
    
    for (i = 0; i < count; i++)
    {
        [[tileArray objectAtIndex:i] setTileLocked:NO];
        [[tileArray objectAtIndex:i] setWhoseTurn:whoseTurn];
        [[tileArray objectAtIndex:i] resetView];
    }    
}

- (void)didSelectTile:(int)tile
{
    NSLog(@"Returned from Tile Myview %i",tile);
    tileChosen = YES;
    currentTile = tile;
    //IF JUST TAPPED TILE ISNT THE SAME AS LAST TILE AND THIS ISNT THE FIRST PICKED TILE
    if (previousTile != currentTile  && previousTile != -1)
    {
        TileView *tempView = [tileArray objectAtIndex:previousTile];
        if(tempView.tileLocked == NO)
        {
            NSLog(@"previous tile not matched to currentTile %i %i", currentTile, previousTile);
            //RESET LAST PICKED TILE
            [[tileArray objectAtIndex:previousTile] resetView];
        }
    }
    //UPDATE PREVIOUS TILE INT FOR NEXT ROUND
    previousTile = currentTile;
}

@end
