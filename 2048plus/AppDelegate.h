//
//  AppDelegate.h
//  game2048
//
//  Created by Brant Young on 3/31/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "MainWebView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet MainWebView *webView;

@end
