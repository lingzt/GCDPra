//
//  ViewController.m
//  GCDPra
//
//  Created by ling toby on 8/18/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"=================1");
    dispatch_async(dispatch_get_main_queue(), ^{
        //to delay the process.
        for (int i = 0; i < 5001; i++) {
        }
        NSLog(@"=================2");
    });
    NSLog(@"=================3");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"ViewWillAppear=============");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"=================4");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"=================5");
        });
        NSLog(@"=================6");
    });
    NSLog(@"==========Main Thread Blocked");
//    while (1) {
//    }
    NSLog(@"========5==Main Thread Blocked, if uncomment the while loop");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"ViewDidAppear=============");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"=================7");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"=================8");
        });
        NSLog(@"=================9");
    });
}

- (IBAction)crashTheMainThread:(id)sender {
    NSLog(@"Button pressed");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"=================10");
    });
 }
@end
