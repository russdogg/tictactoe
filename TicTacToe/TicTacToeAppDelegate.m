//
//  TicTacToeAppDelegate.m
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

//MACROS
#define IS_IPHONE5 (([[UIScreen mainScreen]bounds].size.height-568)?NO:YES)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//IMPORTS
#import "TileView.h"
#import "TicTacToeAppDelegate.h"

@implementation TicTacToeAppDelegate

@synthesize titleLabel, aScoreLabel, eScoreLabel, tileChosen, currentTile, previousTile, whoseTurn, isWinner, turnCount, currRound, choiceArray, tileArray, v0, v1, v2, v3, v4, v5, v6, v7, v8, defaultImageView, resetButton, aScore, eScore, maxRounds;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIImage * defaultImage;
    if(IS_IPHONE5)
    {
        defaultImage = [UIImage imageNamed: @"Default-568h.png"];
    }
    else
    {
        defaultImage = [UIImage imageNamed: @"Default.png"];
    }
    
    defaultImageView = [[UIImageView alloc] initWithImage: defaultImage];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:defaultImageView];
    
    
    
    //TITLE LABEL
    CGRect titleFrame = IS_IPHONE5 ? CGRectMake(0, 38, 320, 98) : CGRectMake(0, 8, 320, 98);
    titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    titleLabel.lineBreakMode = NSLineBreakByClipping;
    titleLabel.textColor = UIColorFromRGB(0xD20C2A);
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:80.0];
    titleLabel.alpha = 0;
    titleLabel.text = @"ROUND 1";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //A SCORE LABEL
    CGRect aScoreFrame = IS_IPHONE5 ? CGRectMake(20, 445, 50, 50) : CGRectMake(20, 405, 50, 50);
    aScoreLabel = [[UILabel alloc] initWithFrame:aScoreFrame];
    aScoreLabel.lineBreakMode = NSLineBreakByClipping;
    aScoreLabel.textColor = UIColorFromRGB(0xffc604);
    aScoreLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:40.0];
    aScoreLabel.alpha = 1;
    aScoreLabel.text = @"0";
    aScoreLabel.textAlignment = NSTextAlignmentLeft;
    
    //E SCORE LABEL
    CGRect eScoreFrame =  IS_IPHONE5 ? CGRectMake(260, 445, 50, 50) : CGRectMake(260, 405, 50, 50);
    eScoreLabel = [[UILabel alloc] initWithFrame:eScoreFrame];
    eScoreLabel.lineBreakMode = NSLineBreakByClipping;
    eScoreLabel.textColor = UIColorFromRGB(0x00d0ff);
    eScoreLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:40.0];
    eScoreLabel.alpha = 1;
    eScoreLabel.text = @"0";
    eScoreLabel.textAlignment = NSTextAlignmentRight;
    
    
    /*
	 [UIView animateWithDuration:0.5
	 delay: 2.0
	 options: UIViewAnimationOptionCurveEaseIn
	 animations:^{titleLabel.alpha = 1.0;}
	 completion:nil
	 ];
     */
    
    //DRAW VIEW TILES
    //CGRect frame00 = CGRectMake(20, 100, 80, 80);
    //CGRect frame01 = CGRectMake(120, 100, 80, 80);
    //CGRect frame02 = CGRectMake(220, 100, 80, 80);
    
	// CGRect frame03 = CGRectMake(20, 200, 80, 80);
	// CGRect frame04 = CGRectMake(120, 200, 80, 80);
	// CGRect frame05 = CGRectMake(220, 200, 80, 80);
    
	// CGRect frame06 = CGRectMake(20, 300, 80, 80);
	// CGRect frame07 = CGRectMake(120, 300, 80, 80);
	// CGRect frame08 = CGRectMake(220, 300, 80, 80);
    
	
	
    CGRect frame00 = CGRectMake(120, 200, 80, 80);
    CGRect frame01 = CGRectMake(120, 200, 80, 80);
    CGRect frame02 = CGRectMake(120, 200, 80, 80);
    
    CGRect frame03 = CGRectMake(120, 200, 80, 80);
    CGRect frame04 = CGRectMake(120, 200, 80, 80);
    CGRect frame05 = CGRectMake(120, 200, 80, 80);
    
    CGRect frame06 = CGRectMake(120, 200, 80, 80);
    CGRect frame07 = CGRectMake(120, 200, 80, 80);
    CGRect frame08 = CGRectMake(120, 200, 80, 80);
    
	
    v0 = [[TileView alloc] initWithFrame:frame00];
    v1 = [[TileView alloc] initWithFrame:frame01];
    v2 = [[TileView alloc] initWithFrame:frame02];
    v3 = [[TileView alloc] initWithFrame:frame03];
    v4 = [[TileView alloc] initWithFrame:frame04];
    v5 = [[TileView alloc] initWithFrame:frame05];
    v6 = [[TileView alloc] initWithFrame:frame06];
    v7 = [[TileView alloc] initWithFrame:frame07];
    v8 = [[TileView alloc] initWithFrame:frame08];
	
    [v0 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v1 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v2 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v3 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v4 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v5 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v6 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v7 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    [v8 setBackgroundColor: UIColorFromRGB(0xD20C2A)];//[UIColor redColor]];
    
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
    [self.window addSubview:aScoreLabel];
    [self.window addSubview:eScoreLabel];
    
    [self.window addSubview:v0];
    [self.window addSubview:v1];
    [self.window addSubview:v2];
    [self.window addSubview:v3];
    [self.window addSubview:v4];
    [self.window addSubview:v5];
    [self.window addSubview:v6];
    [self.window addSubview:v7];
    [self.window addSubview:v8];
    
	
	tileArray = @[v0,v1,v2,v3,v4,v5,v6,v7,v8];
	
	
    choiceArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1],[NSNumber numberWithInt: -1], nil];
    
    previousTile = -1;
    whoseTurn = 0;
    turnCount = 0;
    currRound = 1;
    aScore = 0;
    eScore = 0;
    maxRounds = 3;
    tileChosen = NO;
    isWinner = NO;
    
    /*
	 //CONFIRM BUTTON
	 CGRect confirmFrame = CGRectMake(20.0f, 420.0f, 120.0f, 40.0f);
	 UIButton *confirmButton = [[UIButton alloc] initWithFrame:confirmFrame];
	 [confirmButton setBackgroundColor:UIColorFromRGB(0xD20C2A)];
	 [confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
	 [confirmButton setTitle:@"Confirming" forState:UIControlStateHighlighted];
	 confirmButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22.0];
	 [confirmButton addTarget:self action:@selector(confirmChoice) forControlEvents:UIControlEventTouchUpInside];
	 
	 [self.window addSubview:confirmButton];
     */
    
    
    //NEXT ROUND BUTTON
    CGRect resetFrame = IS_IPHONE5 ? CGRectMake(100.0f, 450.0f, 120.0f, 40.0f) : CGRectMake(100.0f, 410.0f, 120.0f, 40.0f);
    resetButton = [[UIButton alloc] initWithFrame:resetFrame];
    [resetButton setBackgroundColor:UIColorFromRGB(0xcccccc)];
    [resetButton setTitle:@"NEXT ROUND" forState:UIControlStateNormal];
    [resetButton setTitle:@"" forState:UIControlStateHighlighted];
    resetButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22.0];
    [resetButton addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:resetButton];
    resetButton.hidden = YES;
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //HIDE PLACEHOLDER IMAGE AFTER DELAY
    [self.window addSubview:defaultImageView];
    [self performSelector:@selector(hideImage) withObject:nil afterDelay:2.0];
    
    return YES;
}

#pragma mark - Helpers

- (TileView*) setTileFrame:(id) frame {
	return frame = [[TileView alloc] initWithFrame:CGRectMake(120, 200, 80, 80)];
}

-(void)hideImage
{
    defaultImageView.hidden = YES;
    [self setupGame];
    [UIView animateWithDuration:0.5
                          delay: 0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{titleLabel.alpha = 1.0;}
                     completion:nil
     ];
    
	
}

-(void)checkScore
{
    NSLog(@"SCORE CHECK: turnCount: %i, whoseTurn: %i, currentTile: %i", turnCount, whoseTurn, currentTile);
    int i;
    int count;
    count = 9;
    
    int w1 = -1;
    int w2 = -1;
    int w3 = -1;
    
    NSInteger topRowFirstInt = [[choiceArray objectAtIndex:0] integerValue];
    NSInteger topRowMiddleInt = [[choiceArray objectAtIndex:1] integerValue];
    NSInteger topRowLastInt = [[choiceArray objectAtIndex:2] integerValue];
    NSInteger middleRowFirstInt = [[choiceArray objectAtIndex:3] integerValue];
    NSInteger bottomRowFirstInt = [[choiceArray objectAtIndex:6] integerValue];
    
    //TOP ROW HORIZONTAL CHECK
    
    if ([[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:1]]
        && [[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:2]])
    {
        if (topRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 0;
            w2 = 1;
            w3 = 2;
        }
    }
    
    //MIDDLE ROW HORIZONTAL CHECK
    
    if ([[choiceArray objectAtIndex:3] isEqual: [choiceArray objectAtIndex:4]]
        && [[choiceArray objectAtIndex:3] isEqual: [choiceArray objectAtIndex:5]])
    {
        if (middleRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 3;
            w2 = 4;
            w3 = 5;
        }
    }
    
    //BOTTOM ROW HORIZONTAL CHECK
    
    if([[choiceArray objectAtIndex:6] isEqual: [choiceArray objectAtIndex:7]]
       && [[choiceArray objectAtIndex:6] isEqual: [choiceArray objectAtIndex:8]])
    {
        if (bottomRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 6;
            w2 = 7;
            w3 = 8;
        }
    }
    
    //FIRST COLUMN VERTICAL CHECK
    
    if ([[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:3]]
        && [[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:6]])
    {
        if (topRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 0;
            w2 = 3;
            w3 = 6;
        }
    }
    
    //SECOND COLUMN VERTICAL CHECK
    
    if ([[choiceArray objectAtIndex:1] isEqual: [choiceArray objectAtIndex:4]]
        && [[choiceArray objectAtIndex:1] isEqual: [choiceArray objectAtIndex:7]])
    {
        if (topRowMiddleInt != -1)
        {
            isWinner = YES;
            w1 = 1;
            w2 = 4;
            w3 = 7;
        }
    }
    
    //THIRD COLUMN VERTICAL CHECK
    
    if ([[choiceArray objectAtIndex:2] isEqual: [choiceArray objectAtIndex:5]]
        && [[choiceArray objectAtIndex:2] isEqual: [choiceArray objectAtIndex:8]])
    {
        if (topRowLastInt != -1)
        {
            isWinner = YES;
            w1 = 2;
            w2 = 5;
            w3 = 8;
        }
    }
    
    //TOP CORNER DIAGONAL CHECK
    
    if ([[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:4]]
        && [[choiceArray objectAtIndex:0] isEqual: [choiceArray objectAtIndex:8]])
    {
        if (topRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 0;
            w2 = 4;
            w3 = 8;
        }
    }
    
    //BOTTOM CORNER DIAGONAL CHECK
    
    if ([[choiceArray objectAtIndex:6] isEqual: [choiceArray objectAtIndex:4]]
        && [[choiceArray objectAtIndex:6] isEqual: [choiceArray objectAtIndex:2]])
    {
        if (bottomRowFirstInt != -1)
        {
            isWinner = YES;
            w1 = 6;
            w2 = 4;
            w3 = 2;
        }
    }
    
    if (isWinner)
    {
        titleLabel.alpha = 0;
        [UIView animateWithDuration:0.75
                         animations:^{titleLabel.alpha = 1.0;}];
        
        titleLabel.text = @"WIN";
        if (whoseTurn ==0)
        {
            aScore ++;
        }
        else
        {
            eScore ++;
        }
        
        NSLog(@"WINNER! Current score: Team A: %i Team E: %i", aScore, eScore);
        [self updateScore];
        if(currRound == maxRounds)
        {
            [resetButton setTitle:@"START OVER" forState:UIControlStateNormal];
        }
        
        else
        {
            [resetButton setTitle:@"NEXT ROUND" forState:UIControlStateNormal];
        }
        resetButton.alpha = 0;
        resetButton.hidden = NO;
        [UIView animateWithDuration:0.35
                         animations:^{resetButton.alpha = 1.0;}];
        //LOCK ALL TILES
        for (i = 0; i < count; i++)
        {
            [[tileArray objectAtIndex:i] setTileLocked:YES];
            
            if(i != w1 && i != w2 && i != w3)
            {
                //CHANGE COLOR FOR WINNERS
                [[tileArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(0xcccccc)];
            }
        }
    }
    else
    {
        //ELSE NOBODY WON...
        if(turnCount == 8)
        {
            titleLabel.alpha = 0;
            [UIView animateWithDuration:0.75
                             animations:^{titleLabel.alpha = 1.0;}];
            titleLabel.text =  @"TIED";
            titleLabel.textColor = UIColorFromRGB(0xcccccc);
            
            if(currRound == maxRounds)
            {
                [resetButton setTitle:@"START OVER" forState:UIControlStateNormal];
            }
            
            else
            {
                [resetButton setTitle:@"NEXT ROUND" forState:UIControlStateNormal];
            }
            
            resetButton.alpha = 0;
            resetButton.hidden = NO;
            [UIView animateWithDuration:0.35
                             animations:^{resetButton.alpha = 1.0;}];
            
            for (i = 0; i < count; i++)
            {
                [[tileArray objectAtIndex:i] setTileLocked:YES];
                [[tileArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(0xcccccc)];
            }
        }
        else
        {
			[self continueCurrentRound];
        }
    }
    
    
}

-(void)continueCurrentRound
{
    //ADVANCE TURN COUNT
    //NSLog(@"CONFIRMED! turnCount: %i, whoseTurn: %i", currRound, whoseTurn);
    
    turnCount ++;
    
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
}


-(void)updateScore
{
    [aScoreLabel setText:[NSString stringWithFormat:@"%i", aScore]];
    [eScoreLabel setText:[NSString stringWithFormat:@"%i", eScore]];
}



-(void)confirmChoice
{
    if (tileChosen)
    {
        if(whoseTurn ==0)
        {
            [[tileArray objectAtIndex:currentTile] setBackgroundColor:UIColorFromRGB(0xffc604)];
            
        }
        else
        {
            [[tileArray objectAtIndex:currentTile] setBackgroundColor:UIColorFromRGB(0x00d0ff)];
        }
        
        [choiceArray replaceObjectAtIndex:currentTile withObject:[NSNumber numberWithInt:whoseTurn]];
        
        [self checkScore];
    }
}

-(void)updateAfterRound
{
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:80.0];
    titleLabel.text = @"GO";
    if (whoseTurn == 0)
    {
        titleLabel.textColor = UIColorFromRGB(0xffc604);
    }
    else
    {
        titleLabel.textColor = UIColorFromRGB(0x00d0ff);
    }
    tileChosen = NO;
    [UIView animateWithDuration:0.35
                     animations:^{titleLabel.alpha = 1.0;}];
}

-(void)resetGame
{
    NSLog(@"RESET THE GAME");
    resetButton.hidden = YES;
    if(currRound < maxRounds)
    {
        currRound ++;
    }
    else
    {
        currRound = 1;
        aScore = 0;
        eScore = 0;
        [self updateScore];
    }
    titleLabel.alpha = 0.0;
    [UIView animateWithDuration:0.75
                     animations:^{titleLabel.alpha = 1.0;}];
    
    if (currRound == maxRounds)
    {
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:50.0];
        [titleLabel setText:[NSString stringWithFormat:@"FINAL ROUND"]];
    }
    else
    {
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:80.0];
        [titleLabel setText:[NSString stringWithFormat:@"ROUND %i", currRound]];
    }
    
    titleLabel.textColor = UIColorFromRGB(0xD20C2A);
    turnCount = 0;
    whoseTurn = 0;
    tileChosen = NO;
    isWinner = NO;
    
    int i;
    int count;
    count = 9;
    
    for (i = 0; i < count; i++)
    {
        [[tileArray objectAtIndex:i] setTileLocked:NO];
        [[tileArray objectAtIndex:i] setWhoseTurn:whoseTurn];
        //[[tileArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(0xD20C2A)];
        //[[tileArray objectAtIndex:i] resetView];
        
        [choiceArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:-1]];
        
        [UIView animateWithDuration:0.5f
                              delay:0.0
							options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [[tileArray objectAtIndex:i] setAlpha:0.0f];
                             [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 240)];
                         }
                         completion:^(BOOL finished)
		 {
			 [[tileArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(0xD20C2A)];
			 [[tileArray objectAtIndex:i] setAlpha:1.0f];
			 if (i == 8)
			 {
				 [self setupGame];
			 }
		 }
		 ];
    }
}




-(void)setupGame
{
    int i;
    int count;
    count = 9;
    
    for (i = 0; i < count; i++)
    {
        [[tileArray objectAtIndex:i] resetView];
        
        [UIView animateWithDuration:0.75f
		 
						 animations:^{
							 [[tileArray objectAtIndex:i] setAlpha:1.0f];
							 
							 if (IS_IPHONE5) {
								 switch (i)
								 {
									 case 0:
										 
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 180)];
										 break;
										 
									 case 1:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 180)];
										 break;
										 
									 case 2:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 180)];
										 break;
										 
									 case 3:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 280)];
										 break;
										 
									 case 4:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 280)];
										 break;
										 
									 case 5:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 280)];
										 break;
										 
									 case 6:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 380)];
										 break;
										 
									 case 7:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 380)];
										 break;
										 
									 case 8:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 380)];
										 break;
										 
									 default:
										 
										 break;
								 }
								 
							 } else {
								 switch (i)
								 {
									 case 0:
										 
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 140)];
										 break;
										 
									 case 1:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 140)];
										 break;
										 
									 case 2:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 140)];
										 break;
										 
									 case 3:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 240)];
										 break;
										 
									 case 4:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 240)];
										 break;
										 
									 case 5:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 240)];
										 break;
										 
									 case 6:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(60, 340)];
										 break;
										 
									 case 7:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(160, 340)];
										 break;
										 
									 case 8:
										 [[tileArray objectAtIndex:i] setCenter:CGPointMake(260, 340)];
										 break;
										 
									 default:
										 
										 break;
								 }
							 }
							 
							 
						 }];
    }
}
- (void)didSelectTile:(int)tile
{
    tileChosen = YES;
    currentTile = tile;
    
    //IF JUST TAPPED TILE ISNT THE SAME AS LAST TILE AND THIS ISNT THE FIRST PICKED TILE
    if (previousTile != currentTile  && previousTile != -1)
    {
        TileView *tempView = [tileArray objectAtIndex:previousTile];
        if(tempView.tileLocked == NO)
        {
            //RESET LAST PICKED TILE
            [[tileArray objectAtIndex:previousTile] resetView];
        }
    }
    //UPDATE PREVIOUS TILE INT FOR NEXT ROUND
    previousTile = currentTile;
    
    if (tileChosen)
    {
        if(whoseTurn ==0)
        {
            [[tileArray objectAtIndex:currentTile] setBackgroundColor:UIColorFromRGB(0xffc604)];
        }
        else
        {
            [[tileArray objectAtIndex:currentTile] setBackgroundColor:UIColorFromRGB(0x00d0ff)];
        }
        
        [choiceArray replaceObjectAtIndex:currentTile withObject:[NSNumber numberWithInt:whoseTurn]];
        [self checkScore];
    }
}
@end
