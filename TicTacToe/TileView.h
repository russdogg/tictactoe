//
//  MyView.h
//  TicTacToe
//
//  Created by Russ D on 3/21/13.
//  Copyright (c) 2013 RussDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileView;

@protocol TileViewDelegate <NSObject>

- (void)didSelectTile:(int)tile ;

@end

@interface TileView : UIView
{
    int tag;
    int id;
    int whoseTurn;
    BOOL tileLocked;
}
@property (nonatomic, weak) id <TileViewDelegate> delegate;

@property (nonatomic, assign) int tag;
@property (nonatomic, assign) int id;
@property (nonatomic, assign) int whoseTurn;
@property (nonatomic, assign) BOOL tileLocked;
@property (strong, nonatomic) UIImageView *eImageView;
@property (strong, nonatomic) UIImageView *aImageView;


-(void)resetView;
-(void)updateView;
@end
