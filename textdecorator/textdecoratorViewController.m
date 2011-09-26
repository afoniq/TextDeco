//
//  textdecoratorViewController.m
//  textdecorator
//
//  Created by Shabda Raaj on 26/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import "textdecoratorViewController.h"

@interface NSString (Extended)
-(NSString *)reverseString;
-(NSString *) toArabicString;
-(NSString *) toHackerString;

@end

@implementation NSString (Extended)
-(NSString *) reverseString
{
    NSUInteger len = [self length];
    NSMutableString *rtr=[NSMutableString stringWithCapacity:len];
    //        unichar buf[1];
    
    while (len > (NSUInteger)0) { 
        unichar uch = [self characterAtIndex:--len]; 
        [rtr appendString:[NSString stringWithCharacters:&uch length:1]];
    }
    return rtr;
}
-(NSString *) toArabicString
{
    NSDictionary *replaceDict;
    NSString *arabic=@"ค:๒:ς:๔:є:Ŧ:ﻮ:ђ:เ:ן:к:l:๓:ภ:๏:ק:ợ:г:ร:t:ย:ש:ฬ:ץ:א:z";
    NSArray *arabicArray = [arabic componentsSeparatedByString: @":"];
    
    
    NSString *keys=@"a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:y:z";
    NSArray *keyArray = [keys componentsSeparatedByString: @":"];
    
    
    
    replaceDict = [NSDictionary dictionaryWithObjects:arabicArray
                                              forKeys:keyArray 
                   ];
    NSMutableString *fliptxt = [self mutableCopy];
    for (NSString *target in replaceDict) {
        [fliptxt replaceOccurrencesOfString:target withString:[replaceDict objectForKey:target] 
                                    options:0 range:NSMakeRange(0, [fliptxt length])];
    }
    return fliptxt;
}
-(NSString *) toHackerString
{
    NSDictionary *replaceDict;
   
    NSString *hacker=@"4:8:(:d:3:f:9:h:!:j:k:1:m:n:0:p:q:r:5:7:u:v:w:x:y:2";
    NSArray *hackerArray = [hacker componentsSeparatedByString: @":"];
    
    
    NSString *keys=@"a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:y:z";
    NSArray *keyArray = [keys componentsSeparatedByString: @":"];
    
    
    
    replaceDict = [NSDictionary dictionaryWithObjects:hackerArray
                                              forKeys:keyArray 
                   ];
    NSMutableString *fliptxt = [self mutableCopy];
    for (NSString *target in replaceDict) {
        [fliptxt replaceOccurrencesOfString:target withString:[replaceDict objectForKey:target] 
                                    options:0 range:NSMakeRange(0, [fliptxt length])];
    }
    return fliptxt;
}


-(NSString *) toFunkyString
{
    NSDictionary *replaceDict;
    
    NSString *funky=@"α:в:¢:∂:є:ƒ:g:н:ι:נ:к:ℓ:м:η:σ:ρ:q:я:ѕ:т:υ:ν:ω:χ:у:z";
    NSArray *funkyArray = [funky componentsSeparatedByString: @":"];
    
    
    NSString *keys=@"a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:y:z";
    NSArray *keyArray = [keys componentsSeparatedByString: @":"];
    
    
    
    replaceDict = [NSDictionary dictionaryWithObjects:funkyArray
                                              forKeys:keyArray 
                   ];
    NSMutableString *fliptxt = [self mutableCopy];
    for (NSString *target in replaceDict) {
        [fliptxt replaceOccurrencesOfString:target withString:[replaceDict objectForKey:target] 
                                    options:0 range:NSMakeRange(0, [fliptxt length])];
    }
    return fliptxt;
}


@end

@implementation textdecoratorViewController
@synthesize original;
@synthesize decorated;








- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *quick_fox = @"the quick brown fox jumps over the lazy dog \n (type and click button)";
    original.text = quick_fox;
    decorated.text = [quick_fox toFunkyString];
}


- (void)viewDidUnload
{
    [self setOriginal:nil];
    [self setDecorated:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [original release];
    [decorated release];
    [super dealloc];
}
- (IBAction)toArabic:(id)sender {
    NSLog(@"To Arabic Pressed.");
    NSString *orig = original.text;
    decorated.text = [orig toArabicString];
    [original resignFirstResponder];
}

- (IBAction)toHacker:(id)sender {
    NSLog(@"To Hacker Pressed.");
    NSString *orig = original.text;
    decorated.text = [orig toHackerString];
    [original resignFirstResponder];
}

- (IBAction)toFunkyString:(id)sender {
    NSLog(@"To Funky Pressed.");
    NSString *orig = original.text;
    decorated.text = [orig toFunkyString];
    [original resignFirstResponder];
}
@end
