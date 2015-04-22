//
//  ViewController.h
//  Tap Master
//
//  Created by Marek on 21.04.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

//Not such like object type
int count;
int sec;
NSTimer *timer;

//Little clear naming
IBOutlet UILabel *justImportantTimer;
IBOutlet UILabel *myCoolAndPreciousScore;
}

//Genius! This is click on the button
-(IBAction)tapAttack:(id)sender;

@end

