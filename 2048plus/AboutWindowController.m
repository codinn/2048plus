//
//  AboutWindowController.m
//  sshproxy
//
//  Created by Brant Young on 10/26/13.
//  Copyright (c) 2013 Codinn Studio. All rights reserved.
//

#import "AboutWindowController.h"

@interface AboutWindowController ()

@end

@implementation AboutWindowController

- (id)init
{
    return [super initWithWindowNibName:@"AboutWindow"];
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
    
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    self.versionTextField.stringValue = [NSString stringWithFormat: NSLocalizedString(@"Version: %@", nil), appVersion];
}

@end
