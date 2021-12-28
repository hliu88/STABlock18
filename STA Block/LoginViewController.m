#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) NSString *schoolOfUser;
@property (nonatomic, strong) NSString *ensembleOfUser;

@end

@implementation LoginViewController

@synthesize scrollView = _scrollView;
@synthesize schoolOfUser = _schoolOfUser;
@synthesize ensembleOfUser = _ensembleOfUser;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]];
    
    self.pageTitleLabel.font = [UIFont fontWithName:@"Impact" size:28];
    self.ensembleLabel.font = [UIFont fontWithName:@"Impact" size:17];
    
    _schoolOfUser = @"";
    _ensembleOfUser = @"";
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        [_scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(320, 540);
        [_scrollView setScrollEnabled:YES];
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *p1 = [user stringForKey:@"currentPeriod1"];
    if (p1 != nil)
    {
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cancelButton addTarget:self
                         action:@selector(cancelEdit)
               forControlEvents:UIControlEventTouchUpInside];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        cancelButton.frame = CGRectMake(20, 241, 135, 44);
        cancelButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:26];
        [self.view addSubview:cancelButton];
        
        UIButton *createButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [createButton addTarget:self
                         action:@selector(createSchedule)
               forControlEvents:UIControlEventTouchUpInside];
        [createButton setTitle:@"Create" forState:UIControlStateNormal];
        createButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:26];
        createButton.frame = CGRectMake(165, 241, 135, 44);
        [self.view addSubview:createButton];
    }
    else
    {
        UIButton *createButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [createButton addTarget:self
                         action:@selector(createSchedule)
               forControlEvents:UIControlEventTouchUpInside];
        [createButton setTitle:@"Create" forState:UIControlStateNormal];
        createButton.frame = CGRectMake(93, 241, 135, 44);
        createButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:26];
        [self.view addSubview:createButton];
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:@"First" forKey:@"scheduleName_1"];
        [user setObject:@"Second" forKey:@"scheduleName_2"];
        [user setObject:@"Third" forKey:@"scheduleName_3"];
    }
    
    NSString *whatToDo = [user stringForKey:@"whatToDo"];
    if ([whatToDo intValue] == 1)   // Editing period 1
    {
        _period1Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period1_1"];
        _period2Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period2_1"];
        _period3Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period3_1"];
        _period4Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period4_1"];
        _period5Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period5_1"];
        _period6Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period6_1"];
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"school_1"] isEqualToString:@"STA"])
        {
            _schoolSelector.selectedSegmentIndex = 0;
            _schoolOfUser = @"STA";
        }
        else
        {
            _schoolSelector.selectedSegmentIndex = 1;
            _schoolOfUser = @"NCS";
        }
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"ensemble_1"] isEqualToString:@"Ensemble"])
        {
            _ensembleSelector.selectedSegmentIndex = 0;
            _ensembleOfUser = @"Ensemble";
        }
        else
        {
            _ensembleSelector.selectedSegmentIndex = 1;
            _ensembleOfUser = @"Free";
        }
    }
    else if ([whatToDo intValue] == 2)  // Editing Period 2
    {
        _period1Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period1_2"];
        _period2Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period2_2"];
        _period3Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period3_2"];
        _period4Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period4_2"];
        _period5Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period5_2"];
        _period6Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period6_2"];
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"school_2"] isEqualToString:@"STA"])
        {
            _schoolSelector.selectedSegmentIndex = 0;
            _schoolOfUser = @"STA";
        }
        else
        {
            _schoolSelector.selectedSegmentIndex = 1;
            _schoolOfUser = @"NCS";
        }
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"ensemble_2"] isEqualToString:@"Ensemble"])
        {
            _ensembleSelector.selectedSegmentIndex = 0;
            _ensembleOfUser = @"Ensemble";
        }
        else
        {
            _ensembleSelector.selectedSegmentIndex = 1;
            _ensembleOfUser = @"Free";
        }
    }
    else if ([whatToDo intValue] == 3)  // Editing Period 3
    {
        _period1Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period1_3"];
        _period2Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period2_3"];
        _period3Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period3_3"];
        _period4Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period4_3"];
        _period5Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period5_3"];
        _period6Field.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"period6_3"];
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"school_3"] isEqualToString:@"STA"])
        {
            _schoolSelector.selectedSegmentIndex = 0;
            _schoolOfUser = @"STA";
        }
        else
        {
            _schoolSelector.selectedSegmentIndex = 1;
            _schoolOfUser = @"NCS";
        }
        if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"ensemble_3"] isEqualToString:@"Ensemble"])
        {
            _ensembleSelector.selectedSegmentIndex = 0;
            _ensembleOfUser = @"Ensemble";
        }
        else
        {
            _ensembleSelector.selectedSegmentIndex = 1;
            _ensembleOfUser = @"Free";
        }
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        [_scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(320, 540);
        [_scrollView setScrollEnabled:YES];
    }
    
    /*
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *name = [user stringForKey:@"name"];
    if (name != nil)
    {
        [self performSegueWithIdentifier:@"login"
                                  sender:self];
    }
     */
    
    // Use this segue incase setup of initial view controllers in the appdelegate fails
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cancelEdit
{
    [self performSegueWithIdentifier:@"cancelEdit" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"cancelEdit"]){
        [((UITabBarController*)segue.destinationViewController) setSelectedIndex:2];
    }
}

- (IBAction)schoolSelected
{
    if(_schoolSelector.selectedSegmentIndex == 0)
    {
        _schoolOfUser = @"STA";
    }
    if(_schoolSelector.selectedSegmentIndex == 1)
    {
        _schoolOfUser = @"NCS";
    }
}
- (IBAction)ensembleSelected
{
    if(_ensembleSelector.selectedSegmentIndex == 0)
    {
        _ensembleOfUser = @"Ensemble";
    }
    if(_ensembleSelector.selectedSegmentIndex == 1)
    {
        _ensembleOfUser = @"Free";
    }
}

- (IBAction)createSchedule
{
    [_period1Field resignFirstResponder];
    [_period2Field resignFirstResponder];
    [_period3Field resignFirstResponder];
    [_period4Field resignFirstResponder];
    [_period5Field resignFirstResponder];
    [_period6Field resignFirstResponder]; // Closes keyboard no matter what field it is open for
    
    [self checkIfFieldsAreComplete]; // All UITextFields must have content
}

- (void) checkIfFieldsAreComplete
{
    if ([self.period1Field.text isEqualToString:@""] || [self.period2Field.text isEqualToString:@""] || [self.period3Field.text isEqualToString:@""] || [self.period4Field.text isEqualToString:@""] || [self.period5Field.text isEqualToString:@""] || [self.period6Field.text isEqualToString:@""] || [_schoolOfUser isEqualToString:@""] || [_ensembleOfUser isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"You must fill in all fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
         
    }
        else
        {
            [self saveUserInfo];
        }
}

- (void) saveUserInfo
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *whatToDo = [user stringForKey:@"whatToDo"];
    if (whatToDo == nil || [whatToDo intValue] == 1)        //  Creating/Editing First Schedule
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:_schoolOfUser forKey:@"school_1"];
        [user setObject:_ensembleOfUser forKey:@"ensemble_1"];
        [user setObject:_period1Field.text forKey:@"period1_1"];
        [user setObject:_period2Field.text forKey:@"period2_1"];
        [user setObject:_period3Field.text forKey:@"period3_1"];
        [user setObject:_period4Field.text forKey:@"period4_1"];
        [user setObject:_period5Field.text forKey:@"period5_1"];
        [user setObject:_period6Field.text forKey:@"period6_1"];
        
        [user setObject:[user stringForKey:@"school_1"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_1"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_1"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_1"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_1"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_1"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_1"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_1"] forKey:@"currentPeriod6"];
        
        NSNumber *one = [NSNumber numberWithInt:1];
        if (whatToDo == nil) [user setObject:one forKey:@"numberOfSchedules"];
    }
    else if ([whatToDo intValue] == 2)      //  Editing Second Schedule
    {
        NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
        [userInfo setObject:_schoolOfUser forKey:@"school_2"];
        [userInfo setObject:_ensembleOfUser forKey:@"ensemble_2"];
        [userInfo setObject:_period1Field.text forKey:@"period1_2"];
        [userInfo setObject:_period2Field.text forKey:@"period2_2"];
        [userInfo setObject:_period3Field.text forKey:@"period3_2"];
        [userInfo setObject:_period4Field.text forKey:@"period4_2"];
        [userInfo setObject:_period5Field.text forKey:@"period5_2"];
        [userInfo setObject:_period6Field.text forKey:@"period6_2"];
        
        [user setObject:[user stringForKey:@"school_2"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_2"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_2"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_2"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_2"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_2"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_2"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_2"] forKey:@"currentPeriod6"];
    }
    else if ([whatToDo intValue] == 3)      //  Editing Third Schedule
    {
        NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
        [userInfo setObject:_schoolOfUser forKey:@"school_3"];
        [userInfo setObject:_ensembleOfUser forKey:@"ensemble_3"];
        [userInfo setObject:_period1Field.text forKey:@"period1_3"];
        [userInfo setObject:_period2Field.text forKey:@"period2_3"];
        [userInfo setObject:_period3Field.text forKey:@"period3_3"];
        [userInfo setObject:_period4Field.text forKey:@"period4_3"];
        [userInfo setObject:_period5Field.text forKey:@"period5_3"];
        [userInfo setObject:_period6Field.text forKey:@"period6_3"];
        
        [user setObject:[user stringForKey:@"school_3"] forKey:@"currentSchool"];
        [user setObject:[user stringForKey:@"ensemble_3"] forKey:@"currentEnsemble"];
        [user setObject:[user stringForKey:@"period1_3"] forKey:@"currentPeriod1"];
        [user setObject:[user stringForKey:@"period2_3"] forKey:@"currentPeriod2"];
        [user setObject:[user stringForKey:@"period3_3"] forKey:@"currentPeriod3"];
        [user setObject:[user stringForKey:@"period4_3"] forKey:@"currentPeriod4"];
        [user setObject:[user stringForKey:@"period5_3"] forKey:@"currentPeriod5"];
        [user setObject:[user stringForKey:@"period6_3"] forKey:@"currentPeriod6"];
    }
    else if ([whatToDo intValue] == 0)      //  Adding a Schedule
    {
        NSString *numberOfSchedules = [user stringForKey:@"numberOfSchedules"];
        int integerNumberOfSchedules = [numberOfSchedules intValue];
        
        if (integerNumberOfSchedules == 1)  //  This is going to be second schedule
        {
            NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
            [userInfo setObject:_schoolOfUser forKey:@"school_2"];
            [userInfo setObject:_ensembleOfUser forKey:@"ensemble_2"];
            [userInfo setObject:_period1Field.text forKey:@"period1_2"];
            [userInfo setObject:_period2Field.text forKey:@"period2_2"];
            [userInfo setObject:_period3Field.text forKey:@"period3_2"];
            [userInfo setObject:_period4Field.text forKey:@"period4_2"];
            [userInfo setObject:_period5Field.text forKey:@"period5_2"];
            [userInfo setObject:_period6Field.text forKey:@"period6_2"];
            
            [user setObject:[user stringForKey:@"school_2"] forKey:@"currentSchool"];
            [user setObject:[user stringForKey:@"ensemble_2"] forKey:@"currentEnsemble"];
            [user setObject:[user stringForKey:@"period1_2"] forKey:@"currentPeriod1"];
            [user setObject:[user stringForKey:@"period2_2"] forKey:@"currentPeriod2"];
            [user setObject:[user stringForKey:@"period3_2"] forKey:@"currentPeriod3"];
            [user setObject:[user stringForKey:@"period4_2"] forKey:@"currentPeriod4"];
            [user setObject:[user stringForKey:@"period5_2"] forKey:@"currentPeriod5"];
            [user setObject:[user stringForKey:@"period6_2"] forKey:@"currentPeriod6"];
            
            NSNumber *two = [NSNumber numberWithInt:2];
            [userInfo setObject:two forKey:@"numberOfSchedules"];
        }
        else if (integerNumberOfSchedules == 2) //  This is going to be third schedule
        {
            NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
            [userInfo setObject:_schoolOfUser forKey:@"school_3"];
            [userInfo setObject:_ensembleOfUser forKey:@"ensemble_3"];
            [userInfo setObject:_period1Field.text forKey:@"period1_3"];
            [userInfo setObject:_period2Field.text forKey:@"period2_3"];
            [userInfo setObject:_period3Field.text forKey:@"period3_3"];
            [userInfo setObject:_period4Field.text forKey:@"period4_3"];
            [userInfo setObject:_period5Field.text forKey:@"period5_3"];
            [userInfo setObject:_period6Field.text forKey:@"period6_3"];
            
            [user setObject:[user stringForKey:@"school_3"] forKey:@"currentSchool"];
            [user setObject:[user stringForKey:@"ensemble_3"] forKey:@"currentEnsemble"];
            [user setObject:[user stringForKey:@"period1_3"] forKey:@"currentPeriod1"];
            [user setObject:[user stringForKey:@"period2_3"] forKey:@"currentPeriod2"];
            [user setObject:[user stringForKey:@"period3_3"] forKey:@"currentPeriod3"];
            [user setObject:[user stringForKey:@"period4_3"] forKey:@"currentPeriod4"];
            [user setObject:[user stringForKey:@"period5_3"] forKey:@"currentPeriod5"];
            [user setObject:[user stringForKey:@"period6_3"] forKey:@"currentPeriod6"];

            NSNumber *three = [NSNumber numberWithInt:3];
            [userInfo setObject:three forKey:@"numberOfSchedules"];
        }
    }
    
    [self performSegueWithIdentifier:@"enterAnimation"
                              sender:self];
}

@end
