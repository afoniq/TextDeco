//
//  textdecoratorAppDelegate.h
//  textdecorator
//
//  Created by Shabda Raaj on 26/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class textdecoratorViewController;

@interface textdecoratorAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet textdecoratorViewController *viewController;

@end
