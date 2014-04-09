//
//  AppDelegate.m
//  game2048
//
//  Created by Brant Young on 3/31/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import "AppDelegate.h"
#import "AboutWindowController.h"
#import "LocalStorage.h"
#import "Utils.h"
#import "HelpWindowController.h"

@interface AppDelegate() {
}

@property LocalStorage* localStorage;

@property (readonly) HelpWindowController *helpWindowController;
@property (readonly) AboutWindowController *aboutWindowController;

@end

@implementation AppDelegate

@synthesize helpWindowController = _helpWindowController;
@synthesize aboutWindowController = _aboutWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}

//called when the nib objects are available, so do initial setup
- (void)awakeFromNib
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"index"
                                                         ofType:@"html" inDirectory:@"2048"];
    
    NSURL* fileURL = [NSURL fileURLWithPath:filePath];
    NSURLRequest* request = [NSURLRequest requestWithURL:fileURL];
    [[self.webView mainFrame] loadRequest:request];
}


#pragma mark - WebFrameLoadDelegate

//this is called as soon as the script environment is ready in the webview
- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame
{
    //add the controller to the script environment
    //the "localStorage" object will now be available to JavaScript
    LocalStorage *localStorage = [[LocalStorage alloc] init];
    [windowScriptObject setValue:localStorage forKey:@"objcLocalStorage"];
}

#pragma mark - WebPolicyDelegate

- (void)webView:(WebView *)webView decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(WebFrame *)frame decisionListener:(id < WebPolicyDecisionListener >)listener
{
    id url = [request URL];
    id scheme = [url scheme];
    if ([scheme isEqualToString:@"help"]) {
        [self performSelector:@selector(openHelpWindow:) withObject:self afterDelay:0.0f];
    } else {
        [listener use];
    }
}

#pragma mark - Actions

- (IBAction)openAboutWindow:(id)sender
{
    [self.aboutWindowController.window makeKeyAndOrderFront:nil];
    [self.aboutWindowController.window center];
    
    [self.aboutWindowController showWindow:nil];
}

- (AboutWindowController *)aboutWindowController
{
    if (!_aboutWindowController)
    {
        _aboutWindowController = [[AboutWindowController alloc] init];
    }
    return _aboutWindowController;
}

-(IBAction)openSendFeedback:(id)sender
{
    NSString *encodedSubject = @"subject=Game 2048+ Support";
    NSString *encodedBody = @"body=Hi Yang,";
    NSString *encodedTo = @"yang@codinn.com";
    NSString *encodedURLString = [NSString stringWithFormat:@"mailto:%@?%@&%@",
                                  [encodedTo stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                                  [encodedSubject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                                  [encodedBody stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *mailtoURL = [NSURL URLWithString:encodedURLString];
    [[NSWorkspace sharedWorkspace] openURL:mailtoURL];
}

-(IBAction)openMacAppStore:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:
     [NSURL URLWithString:@"macappstore://itunes.apple.com/app/ssh-tunnel/id855231036?mt=12"]];
}

- (IBAction)openHelpWindow:(id)sender
{
    [self.helpWindowController.window makeKeyAndOrderFront:nil];
    [self.helpWindowController.window center];
    
    [self.helpWindowController showWindow:nil];
}

- (HelpWindowController *)helpWindowController
{
    if (!_helpWindowController)
    {
        _helpWindowController = [[HelpWindowController alloc] init];
    }
    return _helpWindowController;
}

#pragma mark - Actions

- (IBAction)moveUp:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView moveToDirection:CodinnMoveDirectionUp];
    }
}

- (IBAction)moveDown:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView moveToDirection:CodinnMoveDirectionDown];
    }
}

- (IBAction)moveLeft:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView moveToDirection:CodinnMoveDirectionLeft];
    }
}

- (IBAction)moveRight:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView moveToDirection:CodinnMoveDirectionRight];
    }
}

- (IBAction)newGame:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView restartGame];
    }
}

- (IBAction)muteUnmute:(id)sender
{
    // trigger only if user clicked menu item
    if ([sender isKindOfClass:[NSMenuItem class]]) {
        [self.webView volumeSwitch];
    }
}
@end
