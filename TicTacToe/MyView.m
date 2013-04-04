//
//  MyView.m
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import "MyView.h"


@implementation MyView

@synthesize tag;
@synthesize id;
@synthesize clicked;
@synthesize delegate;

-(void)updateView
{
    if(clicked == NO)
    {
        [self setNeedsDisplay];
        int idToPassBack = id;
        [self.delegate didSelectTile:idToPassBack];
    }
}

-(void)resetView
{
    NSLog(@"resetView");
    tag = -1;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        clicked = NO;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
   // NSLog(@"trace clicked: %d", clicked);
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
    
    
    if([self tag] == 1)
    {
        //DRAW X
        CGContextMoveToPoint(context, b.origin.x, b.origin.y);
        CGContextAddLineToPoint(context, b.size.width, b.size.height);
        
        CGContextMoveToPoint(context, b.size.width, b.origin.y);
        CGContextAddLineToPoint(context, b.origin.x, b.size.height);
        tag = 2;
        //clicked = YES;
    }
    else if([self tag] == 2)
    {
        //DRAW O
        CGContextStrokeEllipseInRect(context, e);
        tag = -1;
       // clicked = YES;
    }
    else
    {
        //DRAW NOTHING
        tag = 1;
        //clicked = NO;
    }
    
    CGContextStrokePath(context);
    CGRect bFrame = CGRectMake(0.0f, 0.0f, 75.0f, 75.0f);
    UIButton *myButton = [[UIButton alloc] initWithFrame:bFrame];
    //[myButton setBackgroundColor:[UIColor blackColor]];
    //[myButton setTitle:@"Click me" forState:UIControlStateNormal];
    
    [myButton addTarget:self action:@selector(updateView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:myButton];
}





@end
