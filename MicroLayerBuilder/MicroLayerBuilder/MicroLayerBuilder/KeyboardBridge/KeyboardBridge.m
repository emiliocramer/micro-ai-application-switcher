//
//  KeyboardBridge.m
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-16.
//

#import <Foundation/Foundation.h>
#import "KeyboardBridge.h"
#import <IOKit/IOKitLib.h>
#import <IOKit/hid/IOHIDLib.h>

@implementation KeyboardBridge

- (BOOL)saveKeymap:(NSString *)keymap forVendorID:(int)vendorID productID:(int)productID {
    
    NSString *flashCommand = [NSString stringWithFormat:@"qmk flash --keyboard %d --keymap %@", vendorID, keymap];
    system([flashCommand UTF8String]);

    return YES;

}


@end

