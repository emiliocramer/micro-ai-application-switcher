//
//  KeyboardBridge.h
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-16.
//

#ifndef KeyboardBridge_h
#define KeyboardBridge_h
#import <Foundation/Foundation.h>

@interface KeyboardBridge : NSObject

- (BOOL) saveKeymap:(NSString *)keymap forVendorID: (int)vendorID productID:(int)productID;

@end


#endif /* KeyboardBridge_h */
