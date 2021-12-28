#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize schedulesArray = _schedulesArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        [_scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(320, 540);
        [_scrollView setScrollEnabled:YES];
    }
    
    _cloudScheduleButton.font = [UIFont fontWithName:@"Impact" size:20];
    [_whatIsCloudScheduleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if( [[NSUserDefaults standardUserDefaults] boolForKey:@"useCloudSchedule"] )
    {
        [_cloudScheduleSwitch setOn:YES];
    }
    else
    {
        [_cloudScheduleSwitch setOn:NO];
    }
    
    /*
    UIButton *refreshPageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [refreshPageButton addTarget:self
               action:@selector(refreshPage)
     forControlEvents:UIControlEventTouchUpInside];
    refreshPageButton.frame = CGRectMake(110, 395, 100, 60);
    [refreshPageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    refreshPageButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    refreshPageButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    refreshPageButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    [refreshPageButton setTitle: @"Refresh\nSchedule" forState: UIControlStateNormal];
    [self.view addSubview:refreshPageButton];
     */
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]]];
    
    //self.fuzzyView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:.6];
    self.fuzzyView.layer.cornerRadius = 12;
    self.fuzzyView.layer.masksToBounds = YES;
    
    self.fuzzyView.backgroundColor = [UIColor clearColor];
    UIToolbar* bgToolbar = [[UIToolbar alloc] initWithFrame:self.fuzzyView.frame];
    bgToolbar.barStyle = UIBarStyleDefault;
    bgToolbar.layer.cornerRadius = 12;
    bgToolbar.layer.masksToBounds = YES;
    [self.fuzzyView.superview insertSubview:bgToolbar belowSubview:self.fuzzyView];
    
    self.settingsLabel.font = [UIFont fontWithName:@"Impact" size:44];
    self.settingsLabel.textColor = [UIColor whiteColor];
    self.addScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    self.viewScheduleLabel.font = [UIFont fontWithName:@"Impact" size:18];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *numberOfSchedules = [user stringForKey:@"numberOfSchedules"];
    int integerNumberOfSchedules = [numberOfSchedules intValue];
    
    if(integerNumberOfSchedules == 1)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *scheduleName_1 = [user stringForKey:@"scheduleName_1"];
        
        _schedulesArray = [NSArray arrayWithObjects: scheduleName_1, nil];
        
        UIButton *editNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton addTarget:self
                           action:@selector(editName1)
                 forControlEvents:UIControlEventTouchUpInside];
        [editNameButton setTitle:@"Edit Name" forState:UIControlStateNormal];
        editNameButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton.frame = CGRectMake(95, 285, 130, 30);
        [self.view addSubview:editNameButton];
        
        UIButton *editScheduleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton addTarget:self
                               action:@selector(editSchedule1)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton setTitle:@"Edit Schedule" forState:UIControlStateNormal];
        editScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton.frame = CGRectMake(95, 315, 130, 30);
        [self.view addSubview:editScheduleButton];
    }
    else if (integerNumberOfSchedules == 2)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *scheduleName_1 = [user stringForKey:@"scheduleName_1"];
        NSString *scheduleName_2 = [user stringForKey:@"scheduleName_2"];
        
        _schedulesArray = [NSArray arrayWithObjects: scheduleName_1, scheduleName_2, nil];
        
        
        UIButton *editNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton addTarget:self
                           action:@selector(editName1)
                 forControlEvents:UIControlEventTouchUpInside];
        [editNameButton setTitle:@"Name" forState:UIControlStateNormal];
        editNameButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton.frame = CGRectMake(30, 275, 130, 30);
        [self.view addSubview:editNameButton];
        
        
        UIButton *editNameButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton2 addTarget:self
                           action:@selector(editName2)
                 forControlEvents:UIControlEventTouchUpInside];
        [editNameButton2 setTitle:@"Name" forState:UIControlStateNormal];
        editNameButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton2.frame = CGRectMake(160, 275, 130, 30);
        [self.view addSubview:editNameButton2];
        
        UIButton *editScheduleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton addTarget:self
                               action:@selector(editSchedule1)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton setTitle:@"Edit" forState:UIControlStateNormal];
        editScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton.frame = CGRectMake(30, 300, 130, 30);
        [self.view addSubview:editScheduleButton];
        
        UIButton *editScheduleButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton2 addTarget:self
                               action:@selector(editSchedule2)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton2 setTitle:@"Edit" forState:UIControlStateNormal];
        editScheduleButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton2.frame = CGRectMake(160, 300, 130, 30);
        [self.view addSubview:editScheduleButton2];
        
        UIButton *deleteScheduleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [deleteScheduleButton addTarget:self
                                 action:@selector(deleteSchedule1)
                       forControlEvents:UIControlEventTouchUpInside];
        [deleteScheduleButton setTitle:@"Delete" forState:UIControlStateNormal];
        [deleteScheduleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        deleteScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        deleteScheduleButton.frame = CGRectMake(30, 325, 130, 30);
        [self.view addSubview:deleteScheduleButton];
        
        UIButton *deleteScheduleButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [deleteScheduleButton2 addTarget:self
                                  action:@selector(deleteSchedule2)
                        forControlEvents:UIControlEventTouchUpInside];
        [deleteScheduleButton2 setTitle:@"Delete" forState:UIControlStateNormal];
        [deleteScheduleButton2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        deleteScheduleButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        deleteScheduleButton2.frame = CGRectMake(160, 325, 130, 30);
        [self.view addSubview:deleteScheduleButton2];
    }
    else if (integerNumberOfSchedules == 3)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *scheduleName_1 = [user stringForKey:@"scheduleName_1"];
        NSString *scheduleName_2 = [user stringForKey:@"scheduleName_2"];
        NSString *scheduleName_3 = [user stringForKey:@"scheduleName_3"];
        
        _schedulesArray = [NSArray arrayWithObjects: scheduleName_1, scheduleName_2, scheduleName_3, nil];
        
        UIButton *editNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton addTarget:self
                           action:@selector(editName1)
                 forControlEvents:UIControlEventTouchUpInside];
        [editNameButton setTitle:@"Name" forState:UIControlStateNormal];
        editNameButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton.frame = CGRectMake(0, 275, 130, 30);
        [self.view addSubview:editNameButton];
        
        UIButton *editNameButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton2 addTarget:self
                            action:@selector(editName2)
                  forControlEvents:UIControlEventTouchUpInside];
        [editNameButton2 setTitle:@"Name" forState:UIControlStateNormal];
        editNameButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton2.frame = CGRectMake(95, 275, 130, 30);
        [self.view addSubview:editNameButton2];
        
        UIButton *editNameButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editNameButton3 addTarget:self
                            action:@selector(editName3)
                  forControlEvents:UIControlEventTouchUpInside];
        [editNameButton3 setTitle:@"Name" forState:UIControlStateNormal];
        editNameButton3.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editNameButton3.frame = CGRectMake(190, 275, 130, 30);
        [self.view addSubview:editNameButton3];
        
        UIButton *editScheduleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton addTarget:self
                               action:@selector(editSchedule1)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton setTitle:@"Edit" forState:UIControlStateNormal];
        editScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton.frame = CGRectMake(25, 300, 80, 30);
        [self.view addSubview:editScheduleButton];
        
        UIButton *editScheduleButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton2 addTarget:self
                               action:@selector(editSchedule2)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton2 setTitle:@"Edit" forState:UIControlStateNormal];
        editScheduleButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton2.frame = CGRectMake(120, 300, 80, 30);
        [self.view addSubview:editScheduleButton2];
        
        UIButton *editScheduleButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [editScheduleButton3 addTarget:self
                               action:@selector(editSchedule3)
                     forControlEvents:UIControlEventTouchUpInside];
        [editScheduleButton3 setTitle:@"Edit" forState:UIControlStateNormal];
        editScheduleButton3.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        editScheduleButton3.frame = CGRectMake(215, 300, 80, 30);
        [self.view addSubview:editScheduleButton3];
        
        UIButton *deleteScheduleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [deleteScheduleButton addTarget:self
                               action:@selector(deleteSchedule1)
                     forControlEvents:UIControlEventTouchUpInside];
        [deleteScheduleButton setTitle:@"Delete" forState:UIControlStateNormal];
        [deleteScheduleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        deleteScheduleButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        deleteScheduleButton.frame = CGRectMake(25, 325, 80, 30);
        [self.view addSubview:deleteScheduleButton];
        
        UIButton *deleteScheduleButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [deleteScheduleButton2 addTarget:self
                                action:@selector(deleteSchedule2)
                      forControlEvents:UIControlEventTouchUpInside];
        [deleteScheduleButton2 setTitle:@"Delete" forState:UIControlStateNormal];
        [deleteScheduleButton2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        deleteScheduleButton2.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        deleteScheduleButton2.frame = CGRectMake(120, 325, 80, 30);
        [self.view addSubview:deleteScheduleButton2];
        
        UIButton *deleteScheduleButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [deleteScheduleButton3 addTarget:self
                                action:@selector(deleteSchedule3)
                      forControlEvents:UIControlEventTouchUpInside];
        [deleteScheduleButton3 setTitle:@"Delete" forState:UIControlStateNormal];
        [deleteScheduleButton3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        deleteScheduleButton3.titleLabel.font = [UIFont fontWithName:@"Impact" size:18];
        deleteScheduleButton3.frame = CGRectMake(215, 325, 80, 30);
        [self.view addSubview:deleteScheduleButton3];
    }
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:_schedulesArray];
    segmentedControl.frame = CGRectMake(20, 235, 280, 40);
    segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    [segmentedControl addTarget:self action:@selector(scheduleSelected:) forControlEvents: UIControlEventValueChanged];
    
    if ([[user stringForKey:@"currentPeriod1"] isEqualToString:[user stringForKey:@"period1_1"]]  && [[user stringForKey:@"currentPeriod2"] isEqualToString:[user stringForKey:@"period2_1"]] && [[user stringForKey:@"currentPeriod3"] isEqualToString:[user stringForKey:@"period3_1"]]  && [[user stringForKey:@"currentPeriod4"] isEqualToString:[user stringForKey:@"period4_1"]] && [[user stringForKey:@"currentPeriod5"] isEqualToString:[user stringForKey:@"period5_1"]]  && [[user stringForKey:@"currentPeriod6"] isEqualToString:[user stringForKey:@"period6_1"]])
    {
        segmentedControl.selectedSegmentIndex = 0;
    }
    else if ([[user stringForKey:@"currentPeriod1"] isEqualToString:[user stringForKey:@"period1_2"]]  && [[user stringForKey:@"currentPeriod2"] isEqualToString:[user stringForKey:@"period2_2"]] && [[user stringForKey:@"currentPeriod3"] isEqualToString:[user stringForKey:@"period3_2"]]  && [[user stringForKey:@"currentPeriod4"] isEqualToString:[user stringForKey:@"period4_2"]] && [[user stringForKey:@"currentPeriod5"] isEqualToString:[user stringForKey:@"period5_2"]]  && [[user stringForKey:@"currentPeriod6"] isEqualToString:[user stringForKey:@"period6_2"]])
    {
        segmentedControl.selectedSegmentIndex = 1;
    }
    else if ([[user stringForKey:@"currentPeriod1"] isEqualToString:[user stringForKey:@"period1_3"]]  && [[user stringForKey:@"currentPeriod2"] isEqualToString:[user stringForKey:@"period2_3"]] && [[user stringForKey:@"currentPeriod3"] isEqualToString:[user stringForKey:@"period3_3"]]  && [[user stringForKey:@"currentPeriod4"] isEqualToString:[user stringForKey:@"period4_3"]] && [[user stringForKey:@"currentPeriod5"] isEqualToString:[user stringForKey:@"period5_3"]]  && [[user stringForKey:@"currentPeriod6"] isEqualToString:[user stringForKey:@"period6_3"]])
    {
        segmentedControl.selectedSegmentIndex = 2;
    }
    
    [self.view addSubview:segmentedControl];
    // Do any additional setup after loading the view.
}

-(IBAction)switchValueChanged:(UISwitch *) sender // Cloud Schedule Toggle
{
    if(sender.on)
    {
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        [preferences setBool:YES forKey:@"useCloudSchedule"];
        [preferences synchronize];
        [self performSelector:@selector(refreshPage) withObject:nil afterDelay:0.2];
    }
    else
    {
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        [preferences setBool:NO forKey:@"useCloudSchedule"];
        [preferences synchronize];
        [self performSelector:@selector(refreshPage) withObject:nil afterDelay:0.2];
    }
}

- (void)refreshPage
{
    [self performSegueWithIdentifier:@"refreshPage" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editName1
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Schedule Name"
                                                    message:@"Please enter your schedule name"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Go", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 4;
    
    [alert show];
}

- (IBAction)editName2
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Schedule Name"
                                                    message:@"Please enter your schedule name"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Go", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 5;
    
    [alert show];
}

- (IBAction)editName3
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Schedule Name"
                                                    message:@"Please enter your schedule name"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Go", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 6;
    
    [alert show];
}

- (IBAction)editSchedule1
{
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSNumber *edit = [NSNumber numberWithInt:1];
    [userInfo setObject:edit forKey:@"whatToDo"];
    [self performSegueWithIdentifier:@"editSchedule" sender:self];
}

- (IBAction)editSchedule2
{
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSNumber *edit = [NSNumber numberWithInt:2];
    [userInfo setObject:edit forKey:@"whatToDo"];
    [self performSegueWithIdentifier:@"editSchedule" sender:self];
}

- (IBAction)editSchedule3
{
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSNumber *edit = [NSNumber numberWithInt:3];
    [userInfo setObject:edit forKey:@"whatToDo"];
    [self performSegueWithIdentifier:@"editSchedule" sender:self];
}

- (IBAction)deleteSchedule1
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait"
                                                    message:@"Are you sure you want to delete this schedule?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Delete", nil];
    alert.tag = 1;
    [alert show];
}

- (IBAction)deleteSchedule2
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait"
                                                    message:@"Are you sure you want to delete this schedule?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Delete", nil];
    alert.tag = 2;
    [alert show];
}

- (IBAction)deleteSchedule3
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait"
                                                    message:@"Are you sure you want to delete this schedule?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Delete", nil];
    alert.tag = 3;
    [alert show];
    
}

- (void) alertView: ( UIAlertView *) alertView
clickedButtonAtIndex: ( NSInteger ) buttonIndex
{
    if (alertView.tag == 1) // Deleting Schedule 1
    {
        if (buttonIndex == 1)
        {
            NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
            NSString *numberOfSchedules = [userInfo stringForKey:@"numberOfSchedules"];
            int integerNumberOfSchedules = [numberOfSchedules intValue];
            NSNumber *newNumberOfSchedules = [NSNumber numberWithInt:(integerNumberOfSchedules - 1)];
            [userInfo setObject:newNumberOfSchedules forKey:@"numberOfSchedules"];
            
            if ([[userInfo stringForKey:@"currentPeriod1"] isEqualToString:[userInfo stringForKey:@"period1_1"]] && [[userInfo stringForKey:@"currentPeriod2"] isEqualToString:[userInfo stringForKey:@"period2_1"]] && [[userInfo stringForKey:@"currentPeriod3"] isEqualToString:[userInfo stringForKey:@"period3_1"]])
            {
                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                [user setObject:[user stringForKey:@"school_2"] forKey:@"currentSchool"];
                [user setObject:[user stringForKey:@"ensemble_2"] forKey:@"currentEnsemble"];
                [user setObject:[user stringForKey:@"period1_2"] forKey:@"currentPeriod1"];
                [user setObject:[user stringForKey:@"period2_2"] forKey:@"currentPeriod2"];
                [user setObject:[user stringForKey:@"period3_2"] forKey:@"currentPeriod3"];
                [user setObject:[user stringForKey:@"period4_2"] forKey:@"currentPeriod4"];
                [user setObject:[user stringForKey:@"period5_2"] forKey:@"currentPeriod5"];
                [user setObject:[user stringForKey:@"period6_2"] forKey:@"currentPeriod6"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
                    NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
                    [user setBool:[user boolForKey:ABlockn_2] forKey:currentABlockn];
                }
            }
            
            [userInfo setObject:[userInfo stringForKey:@"school_2"] forKey:@"school_1"];
            [userInfo setObject:[userInfo stringForKey:@"ensemble_2"] forKey:@"ensemble_1"];
            [userInfo setObject:[userInfo stringForKey:@"period1_2"] forKey:@"period1_1"];
            [userInfo setObject:[userInfo stringForKey:@"period2_2"] forKey:@"period2_1"];
            [userInfo setObject:[userInfo stringForKey:@"period3_2"] forKey:@"period3_1"];
            [userInfo setObject:[userInfo stringForKey:@"period4_2"] forKey:@"period4_1"];
            [userInfo setObject:[userInfo stringForKey:@"period5_2"] forKey:@"period5_1"];
            [userInfo setObject:[userInfo stringForKey:@"period6_2"] forKey:@"period6_1"];
            [userInfo setObject:[userInfo stringForKey:@"scheduleName_2"] forKey:@"scheduleName_1"];
            
            for (int i = 0; i < 7; i++)
            {
                NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_1"];
                NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
                [userInfo setBool:[userInfo boolForKey:ABlockn_2] forKey:ABlockn_1];
            }
            
            NSString *check = [userInfo stringForKey:@"period1_3"];
            if (![check isEqualToString:@""])
            {
                [userInfo setObject:[userInfo stringForKey:@"school_3"] forKey:@"school_2"];
                [userInfo setObject:[userInfo stringForKey:@"ensemble_3"] forKey:@"ensemble_2"];
                [userInfo setObject:[userInfo stringForKey:@"period1_3"] forKey:@"period1_2"];
                [userInfo setObject:[userInfo stringForKey:@"period2_3"] forKey:@"period2_2"];
                [userInfo setObject:[userInfo stringForKey:@"period3_3"] forKey:@"period3_2"];
                [userInfo setObject:[userInfo stringForKey:@"period4_3"] forKey:@"period4_2"];
                [userInfo setObject:[userInfo stringForKey:@"period5_3"] forKey:@"period5_2"];
                [userInfo setObject:[userInfo stringForKey:@"period6_3"] forKey:@"period6_2"];
                [userInfo setObject:[userInfo stringForKey:@"scheduleName_3"] forKey:@"scheduleName_2"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
                    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
                    [userInfo setBool:[userInfo boolForKey:ABlockn_3] forKey:ABlockn_2];
                }
                
                [userInfo setObject:@"" forKey:@"school_3"];
                [userInfo setObject:@"" forKey:@"ensemble_3"];
                [userInfo setObject:@"" forKey:@"period1_3"];
                [userInfo setObject:@"" forKey:@"period2_3"];
                [userInfo setObject:@"" forKey:@"period3_3"];
                [userInfo setObject:@"" forKey:@"period4_3"];
                [userInfo setObject:@"" forKey:@"period5_3"];
                [userInfo setObject:@"" forKey:@"period6_3"];
                [userInfo setObject:@"Third" forKey:@"scheduleName_3"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
                    [userInfo setBool:NO forKey:ABlockn_3];
                }
            }

            [self performSegueWithIdentifier:@"refreshPage" sender:self];
        }
    }
    else if (alertView.tag == 2) // Deleting Schedule 2
    {
        if (buttonIndex == 1)
        {
            NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
            NSString *numberOfSchedules = [userInfo stringForKey:@"numberOfSchedules"];
            int integerNumberOfSchedules = [numberOfSchedules intValue];
            NSNumber *newNumberOfSchedules = [NSNumber numberWithInt:(integerNumberOfSchedules - 1)];
            [userInfo setObject:newNumberOfSchedules forKey:@"numberOfSchedules"];
            
            if ([[userInfo stringForKey:@"currentPeriod1"] isEqualToString:[userInfo stringForKey:@"period1_2"]] && [[userInfo stringForKey:@"currentPeriod2"] isEqualToString:[userInfo stringForKey:@"period2_2"]] && [[userInfo stringForKey:@"currentPeriod3"] isEqualToString:[userInfo stringForKey:@"period3_2"]])
            {
                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                [user setObject:[user stringForKey:@"school_1"] forKey:@"currentSchool"];
                [user setObject:[user stringForKey:@"ensemble_1"] forKey:@"currentEnsemble"];
                [user setObject:[user stringForKey:@"period1_1"] forKey:@"currentPeriod1"];
                [user setObject:[user stringForKey:@"period2_1"] forKey:@"currentPeriod2"];
                [user setObject:[user stringForKey:@"period3_1"] forKey:@"currentPeriod3"];
                [user setObject:[user stringForKey:@"period4_1"] forKey:@"currentPeriod4"];
                [user setObject:[user stringForKey:@"period5_1"] forKey:@"currentPeriod5"];
                [user setObject:[user stringForKey:@"period6_1"] forKey:@"currentPeriod6"];

                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_1"];
                    NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
                    [user setBool:[user boolForKey:ABlockn_1] forKey:currentABlockn];
                }
            }
            
            NSString *check = [userInfo stringForKey:@"period1_3"];
            if (![check isEqualToString:@""])
            {
                [userInfo setObject:[userInfo stringForKey:@"school_3"] forKey:@"school_2"];
                [userInfo setObject:[userInfo stringForKey:@"ensemble_3"] forKey:@"ensemble_2"];
                [userInfo setObject:[userInfo stringForKey:@"period1_3"] forKey:@"period1_2"];
                [userInfo setObject:[userInfo stringForKey:@"period2_3"] forKey:@"period2_2"];
                [userInfo setObject:[userInfo stringForKey:@"period3_3"] forKey:@"period3_2"];
                [userInfo setObject:[userInfo stringForKey:@"period4_3"] forKey:@"period4_2"];
                [userInfo setObject:[userInfo stringForKey:@"period5_3"] forKey:@"period5_2"];
                [userInfo setObject:[userInfo stringForKey:@"period6_3"] forKey:@"period6_2"];
                [userInfo setObject:[userInfo stringForKey:@"scheduleName_3"] forKey:@"scheduleName_2"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
                    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
                    [userInfo setBool:[userInfo boolForKey:ABlockn_3] forKey:ABlockn_2];
                }
                
                [userInfo setObject:@"" forKey:@"school_3"];
                [userInfo setObject:@"" forKey:@"ensemble_3"];
                [userInfo setObject:@"" forKey:@"period1_3"];
                [userInfo setObject:@"" forKey:@"period2_3"];
                [userInfo setObject:@"" forKey:@"period3_3"];
                [userInfo setObject:@"" forKey:@"period4_3"];
                [userInfo setObject:@"" forKey:@"period5_3"];
                [userInfo setObject:@"" forKey:@"period6_3"];
                [userInfo setObject:@"Third" forKey:@"scheduleName_3"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
                    [userInfo setBool:NO forKey:ABlockn_3];
                }
            }
            else
            {
                [userInfo setObject:@"" forKey:@"school_2"];
                [userInfo setObject:@"" forKey:@"ensemble_2"];
                [userInfo setObject:@"" forKey:@"period1_2"];
                [userInfo setObject:@"" forKey:@"period2_2"];
                [userInfo setObject:@"" forKey:@"period3_2"];
                [userInfo setObject:@"" forKey:@"period4_2"];
                [userInfo setObject:@"" forKey:@"period5_2"];
                [userInfo setObject:@"" forKey:@"period6_2"];
                [userInfo setObject:@"Second" forKey:@"scheduleName_2"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
                    [userInfo setBool:NO forKey:ABlockn_2];
                }
            }
            
            [self performSegueWithIdentifier:@"refreshPage" sender:self];
        }
    }
    else if (alertView.tag == 3) // Deleting Schedule 3
    {
        if (buttonIndex == 1)
        {
            NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
            NSString *numberOfSchedules = [userInfo stringForKey:@"numberOfSchedules"];
            int integerNumberOfSchedules = [numberOfSchedules intValue];
            NSNumber *newNumberOfSchedules = [NSNumber numberWithInt:(integerNumberOfSchedules - 1)];
            [userInfo setObject:newNumberOfSchedules forKey:@"numberOfSchedules"];
            
            [userInfo setObject:@"" forKey:@"school_3"];
            [userInfo setObject:@"" forKey:@"ensemble_3"];
            [userInfo setObject:@"" forKey:@"period1_3"];
            [userInfo setObject:@"" forKey:@"period2_3"];
            [userInfo setObject:@"" forKey:@"period3_3"];
            [userInfo setObject:@"" forKey:@"period4_3"];
            [userInfo setObject:@"" forKey:@"period5_3"];
            [userInfo setObject:@"" forKey:@"period6_3"];
            [userInfo setObject:@"Third" forKey:@"scheduleName_3"];
            
            for (int i = 0; i < 7; i++)
            {
                NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
                [userInfo setBool:NO forKey:ABlockn_3];
            }
            
            if ([[userInfo stringForKey:@"currentPeriod1"] isEqualToString:[userInfo stringForKey:@"period1_3"]] && [[userInfo stringForKey:@"currentPeriod2"] isEqualToString:[userInfo stringForKey:@"period2_3"]] && [[userInfo stringForKey:@"currentPeriod3"] isEqualToString:[userInfo stringForKey:@"period3_3"]])
            {
                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                [user setObject:[user stringForKey:@"school_1"] forKey:@"currentSchool"];
                [user setObject:[user stringForKey:@"ensemble_1"] forKey:@"currentEnsemble"];
                [user setObject:[user stringForKey:@"period1_1"] forKey:@"currentPeriod1"];
                [user setObject:[user stringForKey:@"period2_1"] forKey:@"currentPeriod2"];
                [user setObject:[user stringForKey:@"period3_1"] forKey:@"currentPeriod3"];
                [user setObject:[user stringForKey:@"period4_1"] forKey:@"currentPeriod4"];
                [user setObject:[user stringForKey:@"period5_1"] forKey:@"currentPeriod5"];
                [user setObject:[user stringForKey:@"period6_1"] forKey:@"currentPeriod6"];
                
                for (int i = 0; i < 7; i++)
                {
                    NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_1"];
                    NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
                    [user setBool:[user boolForKey:ABlockn_1] forKey:currentABlockn];
                }
            }
            
            [self performSegueWithIdentifier:@"refreshPage" sender:self];
            
        }
    }
    else if (alertView.tag == 4) // Editing Name of Schedule 1
    {
        if (buttonIndex == 1)
        {
            UITextField *textfield = [alertView textFieldAtIndex:0];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:textfield.text forKey:@"scheduleName_1"];
            [self performSegueWithIdentifier:@"refreshPage" sender:self];
        }
    }
    else if (alertView.tag == 5) // Editing Name of Schedule 2
    {
        if (buttonIndex == 1)
        {
            UITextField *textfield = [alertView textFieldAtIndex:0];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:textfield.text forKey:@"scheduleName_2"];
            [self performSegueWithIdentifier:@"refreshPage" sender:self];
        }
    }
    else if (alertView.tag == 6) // Editing Name of Schedule 3
    {
        if (buttonIndex == 1)
        {
            UITextField *textfield = [alertView textFieldAtIndex:0];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:textfield.text forKey:@"scheduleName_3"];
            [self performSegueWithIdentifier:@"refreshPage" sender:self];
        }
    }
}

- (IBAction)addSchedule
{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *numberOfSchedules = [user stringForKey:@"numberOfSchedules"];
    int integerNumberOfSchedules = [numberOfSchedules intValue];
    if (integerNumberOfSchedules > 2)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-Oh"
                                                        message:@"You already have the maximum of 3 schedules."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSNumber *add = [NSNumber numberWithInt:0];     //  0 means I am going to be adding a schedule in LoginViewController
    [userInfo setObject:add forKey:@"whatToDo"];
    [self performSegueWithIdentifier:@"editSchedule" sender:self];
    }
}

- (IBAction)whatIsCloudSchedulePressed
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What Is Cloud Schedule?" message:@"\nHaving \"Cloud Schedule\" enabled means that the app will run using internet connection.  With this option enabled, events such as snow days will be updated and shown on the app. The view, however, might take longer to load if you are having connectivity problems." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)scheduleSelected:(UISegmentedControl *)scheduleSelected // Changing "currentSchedule" Attributes
{
    if (scheduleSelected.selectedSegmentIndex == 0)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:[user stringForKey:@"school_1"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_1"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_1"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_1"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_1"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_1"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_1"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_1"] forKey:@"currentPeriod6"];
        
        for (int i = 0; i < 7; i++)
        {
            NSString *ABlockn_1 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_1"];
            NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
            [user setBool:[user boolForKey:ABlockn_1] forKey:currentABlockn];
        }
        
        // [user setBool:[user boolForKey:@"ABlock_1"] forKey:@"currentABlock"]; // OBE
        
        [self performSegueWithIdentifier:@"refreshPage" sender:self];
    }
    if (scheduleSelected.selectedSegmentIndex == 1)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:[user stringForKey:@"school_2"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_2"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_2"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_2"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_2"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_2"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_2"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_2"] forKey:@"currentPeriod6"];
        
        for (int i = 0; i < 7; i++)
        {
            NSString *ABlockn_2 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_2"];
            NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
            [user setBool:[user boolForKey:ABlockn_2] forKey:currentABlockn];
        }
        
        [self performSegueWithIdentifier:@"refreshPage" sender:self];
    }
    if (scheduleSelected.selectedSegmentIndex == 2)
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:[user stringForKey:@"school_3"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_3"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_3"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_3"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_3"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_3"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_3"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_3"] forKey:@"currentPeriod6"];
        
        for (int i = 0; i < 7; i++)
        {
            NSString *ABlockn_3 = [NSString stringWithFormat:@"%@%d%@", @"ABlock", (i + 1), @"_3"];
            NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
            [user setBool:[user boolForKey:ABlockn_3] forKey:currentABlockn];
        }
        
        [self performSegueWithIdentifier:@"refreshPage" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"refreshPage"])
    {
        [((UITabBarController*)segue.destinationViewController) setSelectedIndex:2];
    }
}


@end
