#import "LoadingAnimationViewController.h"

@interface LoadingAnimationViewController ()

@end

@implementation LoadingAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([[user stringForKey:@"currentSchool"] isEqualToString:@"STA"])
    {
        self.loadingAnimationView.image = [UIImage imageNamed: [NSString stringWithFormat:@"staLoadingAnimation_35"]];
        
        [self performSelector:@selector(playSTAAnimation) withObject:nil afterDelay:.4];
    }
    else if ([[user stringForKey:@"currentSchool"] isEqualToString:@"NCS"])
    {
        if ([[UIScreen mainScreen] bounds].size.height != 568)
        {
            [_scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            _scrollView.contentSize = CGSizeMake(320, 540);
            [_scrollView setScrollEnabled:YES];
        }
        
        self.ncsView.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 120)];
        titleLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.numberOfLines = 3;
        titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
        titleLabel.text = @"Please enter all of your corresponding lunch blocks";
        [self.ncsView addSubview:titleLabel];
        
        NSArray *dayText = @[@"A Day:", @"B Day:", @"C Day:", @"D Day:", @"E Day:", @"F Day:", @"G Day:"];
        
        for (int i = 0; i < 7; i++) // Makes 7 Labels = "Day A:", "Day B:", etc...
        {
            UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 130 + (40 * i), 50, 20)];
            dayLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
            dayLabel.font = [UIFont fontWithName:@"Impact" size:20];
            dayLabel.text = dayText[i];
            [self.ncsView addSubview:dayLabel];
        }
        
        NSArray *blockOptions = @[@"A", @"B"];
        
        UISegmentedControl *segmentedControlA = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlA.frame = CGRectMake(110, 124, 80, 35);
        segmentedControlA.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlA.selectedSegmentIndex = [self whichSegmentSelectedOn:1];
        [segmentedControlA addTarget:self action:@selector(blockSelectedA:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlA];
        
        UISegmentedControl *segmentedControlB = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlB.frame = CGRectMake(110, 164, 80, 35);
        segmentedControlB.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlB.selectedSegmentIndex = [self whichSegmentSelectedOn:2];
        [segmentedControlB addTarget:self action:@selector(blockSelectedB:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlB];

        UISegmentedControl *segmentedControlC = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlC.frame = CGRectMake(110, 204, 80, 35);
        segmentedControlC.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlC.selectedSegmentIndex = [self whichSegmentSelectedOn:3];
        [segmentedControlC addTarget:self action:@selector(blockSelectedC:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlC];
        
        UISegmentedControl *segmentedControlD = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlD.frame = CGRectMake(110, 244, 80, 35);
        segmentedControlD.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlD.selectedSegmentIndex = [self whichSegmentSelectedOn:4];
        [segmentedControlD addTarget:self action:@selector(blockSelectedD:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlD];
        
        UISegmentedControl *segmentedControlE = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlE.frame = CGRectMake(110, 284, 80, 35);
        segmentedControlE.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlE.selectedSegmentIndex = [self whichSegmentSelectedOn:5];
        [segmentedControlE addTarget:self action:@selector(blockSelectedE:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlE];
        
        UISegmentedControl *segmentedControlF = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlF.frame = CGRectMake(110, 324, 80, 35);
        segmentedControlF.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlF.selectedSegmentIndex = [self whichSegmentSelectedOn:6];
        [segmentedControlF addTarget:self action:@selector(blockSelectedF:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlF];
        
        UISegmentedControl *segmentedControlG = [[UISegmentedControl alloc] initWithItems:blockOptions];
        segmentedControlG.frame = CGRectMake(110, 364, 80, 35);
        segmentedControlG.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControlG.selectedSegmentIndex = [self whichSegmentSelectedOn:7];
        [segmentedControlG addTarget:self action:@selector(blockSelectedG:) forControlEvents: UIControlEventValueChanged];
        [self.ncsView addSubview:segmentedControlG];
        
        UIButton *continueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [continueButton addTarget:self
                           action:@selector(setUpNCSAnimation)
                 forControlEvents:UIControlEventTouchUpInside];
        [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
        continueButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:24];
        continueButton.frame = CGRectMake(50, 420, 120, 40);
        [self.ncsView addSubview:continueButton];

        //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Lunch Block"message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"A Lunch", @"B Lunch", nil];
        
        //[alert show];
    }
}

- (int) whichSegmentSelectedOn: (int) numController
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *whatToDo = [user stringForKey:@"whatToDo"];
    
    NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", numController, @"_1"];
    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", numController, @"_2"];
    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", numController, @"_3"];
    
    if ([whatToDo intValue] == 1)   // Editing period 1
    {
        if ([user boolForKey:ABlockn_1]) return 0;
        else return 1;
    }
    else if ([whatToDo intValue] == 2)  // Editing Period 2
    {
        if ([user boolForKey:ABlockn_2]) return 0;
        else return 1;
    }
    else if ([whatToDo intValue] == 3)  // Editing Period 3
    {
        if ([user boolForKey:ABlockn_3]) return 0;
        else return 1;
    }
    return 0;
}

- (void) blockSelectedA:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:1 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedB:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:2 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedC:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:3 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedD:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:4 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedE:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:5 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedF:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:6 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) blockSelectedG:(UISegmentedControl *) blockSelected
{
    [self setUserLunchBlockOnDay:7 withInput:(int)blockSelected.selectedSegmentIndex];
}

- (void) setUserLunchBlockOnDay:(int) dayNum withInput:(int) blockSelected
{
    NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", dayNum, @"_1"];
    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", dayNum, @"_2"];
    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", dayNum, @"_3"];
    NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", dayNum];
    
    if (blockSelected == 0)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        
        int tester = [[user valueForKey:@"WhatToDo"] intValue];
        int numberOfSchedules = [[user stringForKey:@"numberOfSchedules"] intValue];
        if (tester == 0) // I was just adding a schedule
        {
            if (numberOfSchedules == 2) // This is the second schedule
            {
                [user setBool:YES forKey:ABlockn_2];
                [user setBool:[[user valueForKey:ABlockn_2] boolValue] forKey:currentABlockn];
            }
            else if (numberOfSchedules == 3) // This is the third schedule
            {
                [user setBool:YES forKey:ABlockn_3];
                [user setBool:[[user valueForKey:ABlockn_3] boolValue] forKey:currentABlockn];
            }
        }
        else if (tester == 1 || [user valueForKey:@"WhatToDo"] == nil) // Editing/Creating first schedule
        {
            [user setBool:YES forKey:ABlockn_1];
            [user setBool:[[user valueForKey:ABlockn_1] boolValue] forKey:currentABlockn];
        }
        else if (tester == 2) // Editing second schedule
        {
            [user setBool:YES forKey:ABlockn_2];
            [user setBool:[[user valueForKey:ABlockn_2] boolValue] forKey:currentABlockn];
        }
        else if (tester == 3) // Editing third schedule
        {
            [user setBool:YES forKey:ABlockn_3];
            [user setBool:[[user valueForKey:ABlockn_3] boolValue] forKey:currentABlockn];
        }
    }
    else if (blockSelected == 1)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        
        int tester = [[user valueForKey:@"WhatToDo"] intValue];
        int numberOfSchedules = [[user stringForKey:@"numberOfSchedules"] intValue];
        if (tester == 0) // I was just adding a schedule
        {
            if (numberOfSchedules == 2) // This is the second schedule
            {
                [user setBool:NO forKey:ABlockn_2];
                [user setBool:[[user valueForKey:ABlockn_2] boolValue] forKey:currentABlockn];
            }
            else if (numberOfSchedules == 3) // This is the third schedule
            {
                [user setBool:NO forKey:ABlockn_3];
                [user setBool:[[user valueForKey:ABlockn_3] boolValue] forKey:currentABlockn];
            }
        }
        else if (tester == 1 || [user valueForKey:@"WhatToDo"] == nil) // Editing/Creating first schedule
        {
            [user setBool:NO forKey:ABlockn_1];
            [user setBool:[[user valueForKey:ABlockn_1] boolValue] forKey:currentABlockn];
        }
        else if (tester == 2)  // Editing second schedule
        {
            [user setBool:NO forKey:ABlockn_2];
            [user setBool:[[user valueForKey:ABlockn_2] boolValue] forKey:currentABlockn];
        }
        else if (tester == 3)  // Editing third schedule
        {
            [user setBool:NO forKey:ABlockn_3];
            [user setBool:[[user valueForKey:ABlockn_3] boolValue] forKey:currentABlockn];
        }
    }
}

- (void) setUpNCSAnimation
{
    self.loadingAnimationView.image = [UIImage imageNamed: [NSString stringWithFormat:@"ncsLoadingAnimation_1"]];
    
    [self performSelector:@selector(playNCSAnimation) withObject:nil afterDelay:.4];
}


- (void) playSTAAnimation
{
    NSMutableArray *loadingAnimationArray = [@[] mutableCopy];
    for (int i = 1; i < 36; i++)
    {
        UIImage *loadingImage = [UIImage imageNamed:[NSString stringWithFormat:@"staLoadingAnimation_%d", i]];
        [loadingAnimationArray addObject:loadingImage];
    }
    
    self.loadingAnimationView.animationImages = loadingAnimationArray;
    self.loadingAnimationView.animationRepeatCount = 1;
    self.loadingAnimationView.animationDuration = 1.4;
    
    self.loadingAnimationView.image = loadingAnimationArray[34]; // Pauses at end with last frame
    
    [self.loadingAnimationView startAnimating];
    [self performSelector:@selector(loadingAnimationDidFinish) withObject:nil afterDelay:(1.2 + self.loadingAnimationView.animationDuration)];
}

- (void) playNCSAnimation
{
    NSMutableArray *loadingAnimationArray = [@[] mutableCopy];
    for (int i = 1; i < 45; i++)
    {
        UIImage *loadingImage = [UIImage imageNamed:[NSString stringWithFormat:@"ncsLoadingAnimation_%d", i]];
        [loadingAnimationArray addObject:loadingImage];
    }
    
    self.loadingAnimationView.animationImages = loadingAnimationArray;
    self.loadingAnimationView.animationRepeatCount = 1;
    self.loadingAnimationView.animationDuration = 1.4;
    
    self.loadingAnimationView.image = loadingAnimationArray[43]; // Pauses at end with last frame
    
    [self.loadingAnimationView startAnimating];
    [self performSelector:@selector(loadingAnimationDidFinish) withObject:nil afterDelay:(1.2 + self.loadingAnimationView.animationDuration)];
}

- (void) loadingAnimationDidFinish
{
    [self performSegueWithIdentifier:@"exitAnimation" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
