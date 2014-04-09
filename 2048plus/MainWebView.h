//
//  MainWebView.h
//  game2048
//
//  Created by mlion on 14-3-31.
//  Copyright (c) 2014年 Codinn. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

typedef NS_ENUM(NSInteger, CodinnMoveDirection) {
    CodinnMoveDirectionUp       = 0,
    CodinnMoveDirectionRight    = 1,
    CodinnMoveDirectionDown     = 2,
    CodinnMoveDirectionLeft     = 3,
    
    
};

@interface MainWebView : WebView

- (void)moveToDirection:(CodinnMoveDirection)direction;
- (void)restartGame;
- (void)volumeSwitch;

@end
