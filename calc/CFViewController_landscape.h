//
//  CFViewController.h
//  calc
//
//  Created by Christina Francis on 10/10/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface CFViewController_landscape : UIViewController <AVAudioPlayerDelegate>{
    CFViewController_landscape *_calcEngine;
}
@property (weak, nonatomic) IBOutlet UITextView *tv_disp;
@property(strong, nonatomic, readonly) CFViewController_landscape *calcEngine;
@property(strong, nonatomic) CFViewController_landscape *selfRef;
@property(strong, nonatomic) AVAudioPlayer *audioPlayer;

@property BOOL prev_eq;
@property BOOL isShowingLandscapeView ;

- (CFViewController_landscape *)calcEngine;
- (NSString *) append_waitingOperand:( NSString *) opd toString:( NSString *) txt;
- (NSString *) append_waitingOperator:( NSString *) opd toString:( NSString *) txt;
- (NSString *) infixToPostfixAndEval:( NSString *) txt;// Do the calculation on equal-to operation
- (NSUInteger)supportedInterfaceOrientations;
@end
