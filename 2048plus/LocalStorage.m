//
//  LocalStorage.m
//  game2048
//
//  Created by Brant Young on 4/4/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import "LocalStorage.h"

@implementation LocalStorage

#pragma mark - NSObject

- (NSArray *)attributeKeys
{
    return @[@"gameState", @"bestScore", @"mute"];
}

#pragma mark - NSObject(WebScripting)

+ (NSString *)webScriptNameForSelector:(SEL)sel
{
    if (sel == @selector(clearGameState)) {
        return @"clearGameState";
    }
    
    return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector
{
    return NO;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)name
{
    return NO;
}

#pragma mark - Methods and properties we're sharing with JavaScript

- (NSString *)gameState
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs stringForKey:@"gameState"];
}

- (void)setGameState:(NSString *)state
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:state forKey:@"gameState"];
}

- (BOOL)mute
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs boolForKey:@"mute"];
}

- (void)setMute:(BOOL)flag
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:flag forKey:@"mute"];
}

- (NSInteger)bestScore
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs integerForKey:@"bestScore"];
}

- (void)setBestScore:(NSInteger)score
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:score forKey:@"bestScore"];
}

- (void)clearGameState
{
    self.gameState = nil;
}

@end
