//
//  textdecoratorViewController.h
//  textdecorator
//
//  Created by Shabda Raaj on 26/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textdecoratorViewController : UIViewController {
    UITextView *original;
    UITextView *decorated;
}

@property (nonatomic, retain) IBOutlet UITextView *original;
@property (nonatomic, retain) IBOutlet UITextView *decorated;

- (IBAction)toArabic:(id)sender;
- (IBAction)toHacker:(id)sender;
- (IBAction)toFunkyString:(id)sender;
- (IBAction)flipText:(id)sender;

@end
