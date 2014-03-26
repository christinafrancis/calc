//
//  CFViewController.m
//  calc
//
//  Created by Christina Francis on 10/10/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "CFViewController_landscape.h"
#import "myStack.h"

@interface CFViewController_landscape ()
- (IBAction)handle_ce:(id)sender;
- (IBAction)handle_c:(id)sender;

- (IBAction)handle_sqroot:(id)sender;

- (IBAction)handle_rightp:(id)sender;
- (IBAction)handle_leftp:(id)sender;

- (IBAction)handle_1:(id)sender;
- (IBAction)handle_2:(id)sender;
- (IBAction)handle_3:(id)sender;
- (IBAction)handle_4:(id)sender;
- (IBAction)handle_5:(id)sender;
- (IBAction)handle_6:(id)sender;
- (IBAction)handle_7:(id)sender;
- (IBAction)handle_8:(id)sender;
- (IBAction)handle_9:(id)sender;
- (IBAction)handle_0:(id)sender;
- (IBAction)handle_dot:(id)sender;
- (IBAction)handle_neg:(id)sender;

- (IBAction)handle_add:(id)sender;
- (IBAction)handle_sub:(id)sender;
- (IBAction)handle_mul:(id)sender;
- (IBAction)handle_div:(id)sender;

- (IBAction)handle_eq:(id)sender;

- (IBAction)handle_copy:(id)sender;
- (IBAction)handle_paste:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *b_eq;

- (int) precedence_val:(NSString *)op;

@end

@implementation CFViewController_landscape



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.hidesBackButton = YES;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CFViewController_landscape *)calcEngine{
    if( _calcEngine == nil ){
        _calcEngine = [[CFViewController_landscape alloc] init];
    }
    NSLog(@"Called calcEng");
    return _calcEngine;
}

- (IBAction)handle_ce:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text = @"";
    [self playSound:@"cell-phone-1-nr0" ];
}

-(void) check_eq{
    
    
    if (self.prev_eq) {
        self.tv_disp.text = @"";
        self.prev_eq = NO;
    }
}

- (IBAction)handle_c:(id)sender {
    
    [self playSound:@"cell-phone-1-nr0" ];
    
    @try {
        self.prev_eq = NO;
        if([self.tv_disp.text length] > 0){
            
            
            
            // deleting operator - also delete associated space
            if ([self.tv_disp.text characterAtIndex:[ self.tv_disp.text length ] - 1] == ' ') {
                
                self.tv_disp.text = [self.tv_disp.text substringToIndex:[self.tv_disp.text length] - 1];
                
                while( [self.tv_disp.text characterAtIndex:[ self.tv_disp.text length ] - 1] != ' '){
                    self.tv_disp.text = [self.tv_disp.text substringToIndex:[self.tv_disp.text length] - 1];
                }
            }
            self.tv_disp.text = [self.tv_disp.text substringToIndex:[self.tv_disp.text length] - 1];
        }
        
        
        
        
    }
    
    @catch ( NSException *e ) {
        NSLog(@"No more charectors to delete");
    }
    
}

- (IBAction)handle_sqroot:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"\xE2\x88\x9A" toString:self.tv_disp.text];
    
}

- (IBAction)handle_rightp:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@")" toString:self.tv_disp.text];
}

- (IBAction)handle_leftp:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"(" toString:self.tv_disp.text];
}

- (IBAction)handle_1:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"1" toString:self.tv_disp.text];
    
}

- (IBAction)handle_2:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"2" toString:self.tv_disp.text];
}

- (IBAction)handle_3:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"3" toString:self.tv_disp.text];
    
}

- (IBAction)handle_4:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"4" toString:self.tv_disp.text];
    
}

- (IBAction)handle_5:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"5" toString:self.tv_disp.text];
    
}

- (IBAction)handle_6:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"6" toString:self.tv_disp.text];
    
}

- (IBAction)handle_7:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"7" toString:self.tv_disp.text];
    
}

- (IBAction)handle_8:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"8" toString:self.tv_disp.text];
    
}

- (IBAction)handle_9:(id)sender{
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"9" toString:self.tv_disp.text];
    
}

- (IBAction)handle_0:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"0" toString:self.tv_disp.text];
    
}

- (IBAction)handle_dot:(id)sender {
    [self check_eq];
    self.tv_disp.text =  [self.calcEngine append_waitingOperand:@"." toString:self.tv_disp.text];
    
}

- (IBAction)handle_neg:(id)sender {
    [self playSound:@"cell-phone-1-nr0" ];
    [self check_eq];
    self.tv_disp.text = [NSString stringWithFormat:@"%1$@%2$@",self.tv_disp.text,@"-"];
}

- (IBAction)handle_add:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"+" toString:self.tv_disp.text];
    
}

- (IBAction)handle_sub:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"-" toString:self.tv_disp.text];
    
}

- (IBAction)handle_mul:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"*" toString:self.tv_disp.text];
    
}

- (IBAction)handle_div:(id)sender {
    self.prev_eq = NO;
    self.tv_disp.text =  [self.calcEngine append_waitingOperator:@"/" toString:self.tv_disp.text];
    
}


// Lazy instantiation
- (IBAction)handle_eq:(id)sender {
    @try {
        self.tv_disp.text = [self.calcEngine infixToPostfixAndEval:self.tv_disp.text];
        self.prev_eq = YES;
      
        
    }
    
    @catch ( NSException *e ) {
        self.tv_disp.text = @"ERROR";
    }
    
}

- (IBAction)handle_copy:(id)sender {
    
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    
    NSString *copyText =[[NSString alloc] init];
    if ( self.tv_disp.selectedRange.length > 0){
        copyText= [NSString stringWithString:[self.tv_disp.text substringWithRange:self.tv_disp.selectedRange]];
    }
    else
        copyText = [NSString stringWithString:self.tv_disp.text];
    
    [pb setString:copyText];
    NSLog(@"%@ is pb.string", pb.string);
    
    [self playSound:@"cell-phone-1-nr0" ];
}

- (IBAction)handle_paste:(id)sender {
    [self check_eq];
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    NSLog(@"%@ is pb.string", pb.string);
    self.tv_disp.text  = [self.tv_disp.text stringByAppendingString:pb.string];
    
    [self playSound:@"cell-phone-1-nr0" ];
}




- (NSString *) append_waitingOperand:( NSString *) opd toString:( NSString *) txt{
    [self playSound:@"cell-phone-1-nr0" ];
    return [ NSString stringWithFormat:@"%1$@%2$@",txt,opd];
}

- (NSString *) append_waitingOperator:( NSString *) opt toString:( NSString *) txt{
    [self playSound:@"cell-phone-1-nr0" ];
    return [ NSString stringWithFormat:@"%1$@ %2$@ ",txt,opt];
}


- (NSString *) infixToPostfixAndEval:( NSString *) txt{
    
    
    [self playSound:@"cell-phone-1-nr0" ];
    myStack *stack =[[myStack alloc] init];
    
    
    
    NSArray* infix_arr = [txt componentsSeparatedByString:@" "] ;
    NSMutableArray* infix_ar = [NSMutableArray arrayWithArray:infix_arr];
    [infix_ar removeObject:@""];
    
    
    
    NSMutableArray* postfix_ar = [[NSMutableArray alloc] init];
    
    for( NSString* i in infix_ar){
        
        NSLog(@"%@",stack.stck);
        
        if ([self is_operator:i]) {
            
            if ([i isEqualToString:@"("]) {
                [stack push:@"("];
            }
            else if([i isEqualToString:@")"]) {
                while( ![[stack peep] isEqualToString:@"("] ){
                    [postfix_ar addObject:[stack pop]];
                    
                }
                [stack pop];
            }
            else{
                if([self precedence_val:[stack peep]] < [self precedence_val:i]){
                    [stack push:i];
                    
                    
                }
                else{
                    while ([self precedence_val:[stack peep]] >= [self precedence_val:i]) {
                        [postfix_ar addObject:[stack pop]];
                    }
                    [stack push:i];
                    
                }
                
            }
            
        }
        else{
            [postfix_ar addObject:i];
        }
    }// end for
    
    while(![[stack peep] isEqualToString:@"$"]){
        [postfix_ar addObject:[stack pop]];
    }
    NSLog(@"%@ is postfix",postfix_ar);
    
    
    // done with conversion
    
    //evaluating postfix expression
    
    
    for (NSString *i in postfix_ar ) {
        float ans = 0;
        if ([self is_operator:i]) {
            if( [ i isEqualToString:@"+"] ){
                ans = [[stack pop] floatValue] + [[stack pop] floatValue];
            }
            if( [ i isEqualToString:@"-"] ){
                float a = [[stack pop] floatValue];
                float b = [[stack pop] floatValue];
                ans = b - a;
            }
            if( [ i isEqualToString:@"*"] ){
                ans = [[stack pop] floatValue] * [[stack pop] floatValue];
            }
            if( [ i isEqualToString:@"/"] ){
                float a = [[stack pop] floatValue];
                float b = [[stack pop] floatValue];
                ans = b / a;
            }
            if( [ i isEqualToString:@"\xE2\x88\x9A"] ){
                ans = pow([[stack pop] floatValue],0.5) ;
            }
            [stack push:[NSString stringWithFormat:@"%f",ans]];
        }
        else
            [stack push:i];
    }
    
    txt = [NSString stringWithString:[stack pop]];
    if( ![[stack peep] isEqualToString:@"$" ]){
        txt = @"ERROR";
    }
    
    return txt;
}

-( BOOL) is_operator:(NSString *)op{
    if ([op isEqualToString:@"+"] || [op isEqualToString:@"-"] || [op isEqualToString:@"*"] || [op isEqualToString:@"/"] || [op isEqualToString:@"\xE2\x88\x9A"] || [op isEqualToString:@"("] || [op isEqualToString:@")"] ) {
        return YES;
    }
    else
        return NO;
}

- (int) precedence_val:(NSString *)op{
    
    int val = 0;
    
    if([op isEqualToString:@"+"])
        val = 1;
    
    if([op isEqualToString:@"-"])
        val = 1;
    
    if([op isEqualToString:@"*"])
        val = 2;
    
    if([op isEqualToString:@"/"])
        val = 2;
    
    if([op isEqualToString:@"\xE2\x88\x9A"])
        val = 3;
    
    
    
    return val;
    
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.selfRef = nil; // remove self reference
}
- (void)playSound:(NSString *)filename {
    self.selfRef = self; // self reference to avoid deallocation
    //otherwise, when button is selected, there is no sound due to deallocation by ARC
    NSError* err;
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"mp3"];
    AVAudioPlayer* theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&err];
    self.audioPlayer = theAudio;
    [self.audioPlayer setNumberOfLoops:0];
    [self.audioPlayer setVolume:1];
    self.audioPlayer.delegate = self;
    [self.audioPlayer prepareToPlay];
    if([self.audioPlayer play])
        NSLog(@"Called sound - play returned YES");
    
    
    // self reference to avoid deallocation
    
}
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

@end
