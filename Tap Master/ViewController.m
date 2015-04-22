//
//  ViewController.m
//  Tap Master
//
//  Created by Marek on 21.04.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//Private methods
-(void)restartGame;
-(void)timeEvent;
-(void)setGameOver;

@end

//Implementation
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self restartGame];
}

//Acutalize score by +1 point
- (IBAction)tapAttack:(id)sender {

    myCoolAndPreciousScore.text = [NSString stringWithFormat:@"Score:\n%i", count++];
    
}

//Restarts game
- (void)restartGame {
    
    sec = 30;
    count = 0;
    
    justImportantTimer.text = [NSString stringWithFormat:@"%i", sec];
    myCoolAndPreciousScore.text = [NSString stringWithFormat:@"Score:\n%i", count];
    
    //Set Timer
    timer =
    [NSTimer scheduledTimerWithTimeInterval:1.0f
        target:self
        selector:@selector(timeEvent)
        userInfo:nil
        repeats:YES];
}

//Event performing every second
- (void)timeEvent{
    
    sec--;
    justImportantTimer.text = [NSString stringWithFormat:@"%i", sec];
    
    if(sec == 0){
        [timer invalidate];
        [self setGameOver];
    }
}

//Run Alert Dialog
- (void)setGameOver{
  
    //Set Alert Controller
    UIAlertController *alertController =
        [UIAlertController
        alertControllerWithTitle:@"Game Over"
        message:[NSString stringWithFormat:@"You got %i points", count]
        preferredStyle:UIAlertControllerStyleAlert];
    
    //Set Button
    UIAlertAction *okActionButton = [UIAlertAction
        actionWithTitle:NSLocalizedString(@"OK", @"OK action")
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action)
        {
            [self restartGame];
        }];
    
    //Merge Button with Alert Dialog
    [alertController addAction:okActionButton];
    [self presentViewController:alertController animated:true completion:nil];
    
}

@end
