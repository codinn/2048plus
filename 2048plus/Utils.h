//
//  Utils.h
//  game2048
//
//  Created by Brant Young on 4/5/14.
//  Copyright (c) 2014 Codinn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(CGKeyCode, Codinn2028KeyCode) {
    Codinn2028KeyCodeUpArrow    = 0x7E,
    Codinn2028KeyCodeDownArrow  = 0x7D,
    Codinn2028KeyCodeLeftArrow    = 0x7B,
    Codinn2028KeyCodeRightArrow    = 0x7C,
    
    Codinn2028KeyCodeANSI_W    = 0x0D,
    Codinn2028KeyCodeANSI_A    = 0x00,
    Codinn2028KeyCodeANSI_S    = 0x01,
    Codinn2028KeyCodeANSI_D    = 0x02,
    
    Codinn2028KeyCodeANSI_R    = 0x0F,
    Codinn2028KeyCodeANSI_M    = 0x2E,
};

void Codinn2048SimulateKey(CGKeyCode keycode);
