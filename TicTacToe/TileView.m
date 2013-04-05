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
@synthesize picked;
@synthesize whoseTurn;
@synthesize delegate;

-(void)updateView
{
    //Only update if this tile is not picked
    if(picked == NO)
    {
        tag = 1;

        [self setNeedsDisplay];
        int idToPassBack = id;
        [self.delegate didSelectTile:idToPassBack];
    }
}

-(void)resetView
{
    if(picked == NO)
    {
    NSLog(@"resetView");
    tag = -1;
    [self setNeedsDisplay];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        picked = NO;
        whoseTurn = 0;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
   // NSLog(@"trace ID: %i", id);
    
    //PICK UP THE PEN
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //SET PEN WIDTH
    CGContextSetLineWidth(context, 8);
    
    //SET PEN COLOR
    CGContextSetRGBStrokeColor(context, 50.0, 2.0, 9.0, 1.0);
    
    //GET BOUNDS
    CGRect b = [self bounds];
    
    CGRect e = CGRectMake(2.0, 2.0, 78.0, 78.0);
    
    if (tag == 1)
    {
        if([self whoseTurn] == 0)
        {
            //DRAW "X"
            CGContextMoveToPoint(context, b.origin.x, b.origin.y);
            CGContextAddLineToPoint(context, b.size.width, b.size.height);
        
            CGContextMoveToPoint(context, b.size.width, b.origin.y);
            CGContextAddLineToPoint(context, b.origin.x, b.size.height);
            
        }
        
        else if([self whoseTurn] == 1)
        {
            //DRAW "O"
            CGContextStrokeEllipseInRect(context, e);
           
        }
       //FINISH STOKING THE PATH
        CGContextStrokePath(context);
    }
    
    //CREATE MAIN BUTTON
    CGRect bFrame = CGRectMake(0.0f, 0.0f, 75.0f, 75.0f);
    UIButton *mainButton = [[UIButton alloc] initWithFrame:bFrame];
    
    [mainButton addTarget:self action:@selector(updateView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:mainButton];
}

@end
