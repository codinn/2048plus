//
//  MainWebView.m
//  game2048
//
//  Created by mlion on 14-3-31.
//  Copyright (c) 2014年 Codinn. All rights reserved.
//

#import "MainWebView.h"
#import "Utils.h"

@interface MainWebView () {
	NSTimer * _timerScrollWheelFilter;
    
    CGFloat currentSum;
    CGFloat scrollDeltaX;
    CGFloat scrollDeltaY;
}
@end

@implementation MainWebView

static BOOL sTouchEventProcessed = NO;

- (void)awakeFromNib
{
    [[[self mainFrame] frameView] setAllowsScrolling:NO];
    
    NSEvent* (^handler)(NSEvent*) = ^(NSEvent *theEvent) {
        NSWindow *targetWindow = theEvent.window;
        if (targetWindow != self.window) {
            return theEvent;
        }

        // when key down, auto hide cursor
        [NSCursor setHiddenUntilMouseMoves:YES];
        
        return theEvent;
    };
    
    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask handler:handler];
}

- (void)scrollWheel:(NSEvent *)event
{
    switch (event.phase) {
    case NSEventPhaseBegan:
        sTouchEventProcessed = NO;
        scrollDeltaX = 0;
        scrollDeltaY = 0;
        break;
    case NSEventPhaseChanged:
        {
        if (sTouchEventProcessed) {
            break;
        }
        
        scrollDeltaX += event.scrollingDeltaX;
        scrollDeltaY += event.scrollingDeltaY;
        
        float absoluteSumX = fabsf(scrollDeltaX);
        float absoluteSumY = fabsf(scrollDeltaY);
    
        if (absoluteSumX > absoluteSumY) { // Horizontal
            if (scrollDeltaX > 0) {
                // move right
                [self moveToDirection:CodinnMoveDirectionRight];
            } else {
                // move left
                [self moveToDirection:CodinnMoveDirectionLeft];
            }
        } else { // Vertical
            if (scrollDeltaY < 0) {
                // move up
                [self moveToDirection:CodinnMoveDirectionUp];
            } else {
                // move down
                [self moveToDirection:CodinnMoveDirectionDown];
            }
        }
        
        sTouchEventProcessed = YES;
        }
        break;
    case NSEventPhaseEnded:
        sTouchEventProcessed = YES;
        scrollDeltaX = 0;
        scrollDeltaY = 0;
        break;
    case NSEventPhaseMayBegin:
    case NSEventPhaseCancelled:
        break;
    default:
        break;
    }
}

- (void)moveToDirection:(CodinnMoveDirection)direction
{
    id gameManager = [self.windowScriptObject valueForKey:@"gameManager"];
    [gameManager callWebScriptMethod:@"move"
                       withArguments:@[@(direction)]];
    
    [NSCursor setHiddenUntilMouseMoves:YES];
}

- (void)restartGame
{
    id gameManager = [self.windowScriptObject valueForKey:@"gameManager"];
    [gameManager callWebScriptMethod:@"restart"
                       withArguments:nil];
}

- (void)volumeSwitch
{
    id gameManager = [self.windowScriptObject valueForKey:@"gameManager"];
    [gameManager callWebScriptMethod:@"volumeSwitch"
                       withArguments:nil];
}

@end
