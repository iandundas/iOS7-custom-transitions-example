//
//  MainViewController.m
//  AnimationExperiments
//
//  Created by Ian Dundas on 23/09/2013.
//  Copyright (c) 2013 Ian Dundas. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"
#import "IDTransitioningDelegate.h"

@interface MainViewController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) id<UIViewControllerTransitioningDelegate> transitioningDelegate;

- (void) didTapButton:(UIEvent *) sender;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.transitioningDelegate= [[IDTransitioningDelegate alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.button1 setFrame: CGRectMake(67, 100, 185, 250)];
    [self.button1 setTitle:@"Test Button" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button1 setBackgroundColor: [UIColor redColor]];
    [self.button1 addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.button1];
}

- (void) didTapButton:(UIEvent *) sender
{
    ModalViewController *incoming = [[ModalViewController alloc] init];

    incoming.transitioningDelegate= self.transitioningDelegate;
    incoming.modalPresentationStyle= UIModalPresentationCustom;

    [self presentViewController:incoming animated:YES completion:^{
        NSLog(@"Completed");
    }];
}


@end
