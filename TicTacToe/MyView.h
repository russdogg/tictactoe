//
//  MyView.h
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyView;

@protocol MyViewDelegate <NSObject>

- (void)didSelectTile:(int)tile;

@end

@interface MyView : UIView
{
    int tag;
    int id;
    int whoseTurn;
    BOOL picked;
}
@property (nonatomic, weak) id <MyViewDelegate> delegate;

@property (nonatomic, assign) int tag;
@property (nonatomic, assign) int id;
@property (nonatomic, assign) int whoseTurn;
@property (nonatomic, assign) BOOL picked;

-(void)resetView;
-(void)updateView;
@end
