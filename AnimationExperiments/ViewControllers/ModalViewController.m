//
//  ChildViewController.m
//  AnimationExperiments
//
//  Created by Ian Dundas on 23/09/2013.
//  Copyright (c) 2013 Ian Dundas. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (nonatomic, strong) UIButton *button1;
- (void) didTapButton:(UIEvent *) sender;
@end

@implementation ModalViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor blueColor];
    NSLog(@"Frame: %@", NSStringFromCGRect(self.view.bounds));
    
    self.button1.frame = CGRectMake(50, 50, 100, 50);
    
    [self.button1 setTitle:@"Close VC" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button1 setBackgroundColor: [UIColor yellowColor]];
    [self.button1 addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.button1];
}

- (void) didTapButton:(UIEvent *) sender
{
    [self dismissViewControllerAnimated:true completion:^{
        NSLog(@"Dismissed modal view controller");
    }];
}


@end
