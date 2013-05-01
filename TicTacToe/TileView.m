//
//  MyView.m
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import "TileView.h"


@implementation TileView

@synthesize tag;
@synthesize id;
@synthesize tileLocked;
@synthesize whoseTurn;
@synthesize delegate;
@synthesize eImageView;
@synthesize aImageView;

-(void)updateView
{
    //Only update if this tile is not picked
    if(tileLocked == NO)
    {
        tag = 1;

        [self setGraphics];
        int idToPassBack = id;
        [self.delegate didSelectTile:idToPassBack];
    }
}

-(void)resetView
{
    if(tileLocked == NO)
    {
        tag = -1;
        aImageView.hidden = YES;
        eImageView.hidden = YES;
    }
}

-(void)addTileImages
{
    //ADD X IMAGE
    UIImage * eImage;
    eImage = [UIImage imageNamed: @"tile-e1.png"];
    eImageView = [[UIImageView alloc] initWithImage: eImage];
    [self addSubview:eImageView];
    
    //ADD A IMAGE
    UIImage * aImage;
    aImage = [UIImage imageNamed: @"tile-a.png"];
    aImageView = [[UIImageView alloc] initWithImage: aImage];
    [self addSubview:aImageView];
    
    aImageView.hidden = YES;
    eImageView.hidden = YES;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        tileLocked = NO;
        whoseTurn = 0;
        
        [self addTileImages];
        
        //CREATE MAIN BUTTON
        CGRect bFrame = CGRectMake(0.0f, 0.0f, 75.0f, 75.0f);
        UIButton *mainButton = [[UIButton alloc] initWithFrame:bFrame];
        
        
        [mainButton addTarget:self action:@selector(updateView) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:mainButton];     
    }
    return self;
}


- (void)setGraphics
{
      
    if (tag == 1)
    {
        aImageView.hidden = YES;
        eImageView.hidden = YES;
        
        if([self whoseTurn] == 0)
        {
            //DRAW "A"
            NSLog(@"Draw A");
            aImageView.hidden = NO;
        }
        
        else if([self whoseTurn] == 1)
        {
            NSLog(@"Draw E");
            eImageView.hidden = NO;
        }
    }
}

@end
