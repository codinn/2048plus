//
//  HelpWindowController.m
//  game2048
//
//  Created by Brant Young on 4/6/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import "HelpWindowController.h"

@interface HelpWindowController ()

@end

@implementation HelpWindowController

- (id)init
{
    return [super initWithWindowNibName:@"HelpWindow"];
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"index"
                                                         ofType:@"html" inDirectory:@"helpview"];
    
    NSURL* fileURL = [NSURL fileURLWithPath:filePath];
    NSURLRequest* request = [NSURLRequest requestWithURL:fileURL];
    [[self.webView mainFrame] loadRequest:request];
}

#pragma mark - WebPolicyDelegate

- (void)webView:(WebView *)webView decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(WebFrame *)frame decisionListener:(id < WebPolicyDecisionListener >)listener
{
    id url = [request URL];
    id scheme = [url scheme];
    if ([scheme isEqualToString:@"play"]) {
        [self close];
        [[[NSApplication sharedApplication] mainWindow] makeKeyAndOrderFront:nil];
    } else {
        [listener use];
    }
}

@end
