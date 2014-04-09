//
//  HelpWindowController.h
//  game2048
//
//  Created by Brant Young on 4/6/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface HelpWindowController : NSWindowController

@property (weak) IBOutlet WebView *webView;

@end
