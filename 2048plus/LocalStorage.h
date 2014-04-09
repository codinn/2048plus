//
//  LocalStorage.h
//  game2048
//
//  Created by Brant Young on 4/4/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStorage : NSObject

/* methods and properties we're sharing with JavaScript */
@property NSString *gameState;
@property NSInteger bestScore;
@property BOOL mute;
- (void)clearGameState;

@end
