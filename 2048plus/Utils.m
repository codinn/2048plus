//
//  Utils.m
//  game2048
//
//  Created by Brant Young on 4/5/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import "Utils.h"

void Codinn2048SimulateKey(CGKeyCode keycode)
{
    CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
    CGEventRef keyDown = CGEventCreateKeyboardEvent(source, (CGKeyCode)keycode, YES);
    CGEventRef keyUp = CGEventCreateKeyboardEvent(source, (CGKeyCode)keycode, NO);
    
    CGEventPost(kCGAnnotatedSessionEventTap, keyDown);
    CGEventPost(kCGAnnotatedSessionEventTap, keyUp);
    
    CFRelease(keyDown);
    CFRelease(keyUp);
    CFRelease(source);
    
    // when move tiles, auto hide cursor
    [NSCursor setHiddenUntilMouseMoves:YES];
}
