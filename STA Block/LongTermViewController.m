#import "LongTermViewController.h"

@interface LongTermViewController ()

@property NSNumber *aButtonTag;
@property NSNumber *bButtonTag;
@property NSNumber *cButtonTag;
@property NSNumber *dButtonTag;
@property NSNumber *eButtonTag;
@property NSNumber *fButtonTag;
@property NSNumber *gButtonTag;

@end

@implementation LongTermViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        [_scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(320, 540);
        [_scrollView setScrollEnabled:YES];
        [_scrollView setShowsVerticalScrollIndicator:YES];
    }
    
    _aButtonTag = 0;
    _bButtonTag = 0;
    _cButtonTag = 0;
    _dButtonTag = 0;
    _eButtonTag = 0;
    _fButtonTag = 0;
    _gButtonTag = 0;
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    self.calendarImageView.image = [UIImage imageNamed:_calendarImageFile];
    
    if ([self.calendarImageFile isEqualToString:@"septemberCalendar"])
    {
        
        int selectorIndex = 0;
        double buttonXLocation = 179;
        double buttonYLocation = 199;
        
        [self addLabelWithLetter:@"X" atXValue:138 andYValue:199];
        for (int buttons = 0; buttons < 16; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            
            /*if (buttons == 10)
             {
             buttonXLocation = 56;
             buttonYLocation += 77;
             }
             */
            if (buttons == 10)
            {
                [self addLabelWithLetter:@"X" atXValue:buttonXLocation andYValue:buttonYLocation];
                // buttonXLocation += 41;
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
            
            if (buttonXLocation >= 240)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
        }
    }
    if ([self.calendarImageFile isEqualToString:@"octoberCalendar"])
    {
        /* _aButtonTag = [NSNumber numberWithInt:3]; // There have already been 3 A's
         _bButtonTag = [NSNumber numberWithInt:3];
         _cButtonTag = [NSNumber numberWithInt:3];
         _dButtonTag = [NSNumber numberWithInt:3];
         _eButtonTag = [NSNumber numberWithInt:3];
         _fButtonTag = [NSNumber numberWithInt:2];
         _gButtonTag = [NSNumber numberWithInt:2];
         */
        int selectorIndex = 2;
        double buttonXLocation = 56;
        double buttonYLocation = 122;
        
        for (int buttons = 0; buttons < 19; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            /*
             if (buttons == 5)
             {
             buttonXLocation = 97;
             buttonYLocation += 77;
             }
             */
            if (buttons == 3){
                buttonXLocation = 97;
                buttonYLocation += 77;
            }
            if (buttonXLocation >= 240)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
            if (buttons == 16){
                [self addLabelWithLetter:@"X" atXValue:buttonXLocation andYValue:buttonYLocation];
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
        }
    }
    if ([self.calendarImageFile isEqualToString:@"novemberCalendar"])
    {
        _aButtonTag = [NSNumber numberWithInt:6]; // There were 3 more A's
        _bButtonTag = [NSNumber numberWithInt:6];
        _cButtonTag = [NSNumber numberWithInt:6];
        _dButtonTag = [NSNumber numberWithInt:6];
        _eButtonTag = [NSNumber numberWithInt:5];
        _fButtonTag = [NSNumber numberWithInt:5];
        _gButtonTag = [NSNumber numberWithInt:5];
        
        int selectorIndex = 0;
        double buttonXLocation = 139;
        double buttonYLocation = 122;
        
        for (int buttons = 0; buttons < 18; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            
            if (buttonXLocation >= 240 || buttons == 13 || buttons == 1)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
        }
    }
    if ([self.calendarImageFile isEqualToString:@"decemberCalendar"])
    {
        _aButtonTag = [NSNumber numberWithInt:8];
        _bButtonTag = [NSNumber numberWithInt:8];
        _cButtonTag = [NSNumber numberWithInt:8];
        _dButtonTag = [NSNumber numberWithInt:8];
        _eButtonTag = [NSNumber numberWithInt:8];
        _fButtonTag = [NSNumber numberWithInt:8];
        _gButtonTag = [NSNumber numberWithInt:8];
        
        int selectorIndex = 4;
        double buttonXLocation = 220;
        double buttonYLocation = 122;
        
        for (int buttons = 0; buttons < 13; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            
            if (buttonXLocation >= 240)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
        }
    }
    if ([self.calendarImageFile isEqualToString:@"januaryCalendar"])
    {
        _aButtonTag = [NSNumber numberWithInt:10];
        _bButtonTag = [NSNumber numberWithInt:10];
        _cButtonTag = [NSNumber numberWithInt:10];
        _dButtonTag = [NSNumber numberWithInt:10];
        _eButtonTag = [NSNumber numberWithInt:10];
        _fButtonTag = [NSNumber numberWithInt:10];
        _gButtonTag = [NSNumber numberWithInt:10];
        
        int selectorIndex = 3;
        double buttonXLocation = 138;
        double buttonYLocation = 122;
        
        for (int buttons = 0; buttons < 14; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            
            if (buttonXLocation >= 260)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
            
            if (buttons == 2)
            {
                selectorIndex = 4;
                buttonXLocation = 138;
                buttonYLocation += 77;
            }
        }
        
        int labelXLocation = 56;
        NSArray *letters = [NSArray arrayWithObjects:@"E", @"X", @"A", @"M", @"S", nil];
        
        for (int i = 0; i < 5; i++)
        {
            [self addLabelWithLetter:letters[i] atXValue:labelXLocation andYValue:198];
            
            labelXLocation += 41;
        }
    }
    if ([self.calendarImageFile isEqualToString:@"februaryCalendar"])
    {
        _aButtonTag = [NSNumber numberWithInt:12];
        _bButtonTag = [NSNumber numberWithInt:12];
        _cButtonTag = [NSNumber numberWithInt:12];
        _dButtonTag = [NSNumber numberWithInt:13];
        _eButtonTag = [NSNumber numberWithInt:12];
        _fButtonTag = [NSNumber numberWithInt:11];
        _gButtonTag = [NSNumber numberWithInt:11];
        
        int selectorIndex = 1;
        double buttonXLocation = 179;
        double buttonYLocation = 122;
        
        for (int buttons = 0; buttons < 18; buttons++)
        {
            switch (selectorIndex)
            {
                case 0:
                    [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 1:
                    [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 2:
                    [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 3:
                    [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 4:
                    [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 5:
                    [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                case 6:
                    [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
                    break;
                default:
                    break;
            }
            
            selectorIndex++;
            
            if (selectorIndex == 7) selectorIndex = 0;
            
            buttonXLocation += 41;
            
            if (buttonXLocation >= 260)
            {
                buttonXLocation = 56;
                buttonYLocation += 77;
            }
            
            if (buttons == 10)
            {
                buttonXLocation = 97;
                buttonYLocation += 77;
            }
            /* if (buttons ==14){
             buttonXLocation = 56;
             buttonYLocation += 77;
             }*/
        }
    }
    /*
     if ([self.calendarImageFile isEqualToString:@"marchCalendar"])
     {
     _aButtonTag = [NSNumber numberWithInt:14];
     _bButtonTag = [NSNumber numberWithInt:14];
     _cButtonTag = [NSNumber numberWithInt:15];
     _dButtonTag = [NSNumber numberWithInt:15];
     _eButtonTag = [NSNumber numberWithInt:14];
     _fButtonTag = [NSNumber numberWithInt:14];
     _gButtonTag = [NSNumber numberWithInt:14];
     
     int selectorIndex = 0;
     double buttonXLocation = 53;
     double buttonYLocation = 122;
     
     for (int buttons = 0; buttons < 12; buttons++)
     {
     switch (selectorIndex)
     {
     case 0:
     [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 1:
     [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 2:
     [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 3:
     [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 4:
     [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 5:
     [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 6:
     [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     default:
     break;
     }
     
     selectorIndex++;
     
     if (selectorIndex == 7) selectorIndex = 0;
     
     buttonXLocation += 44;
     
     if (buttonXLocation >= 260)
     {
     buttonXLocation = 53;
     buttonYLocation += 76;
     }
     
     if (buttons == 9)
     {
     buttonXLocation = 53;
     buttonYLocation += (154);
     }
     }
     }
     if ([self.calendarImageFile isEqualToString:@"aprilCalendar"])
     {
     _aButtonTag = [NSNumber numberWithInt:16]; // Number first one is going to use
     _bButtonTag = [NSNumber numberWithInt:16];
     _cButtonTag = [NSNumber numberWithInt:17];
     _dButtonTag = [NSNumber numberWithInt:17];
     _eButtonTag = [NSNumber numberWithInt:16];
     _fButtonTag = [NSNumber numberWithInt:15];
     _gButtonTag = [NSNumber numberWithInt:15];
     
     int selectorIndex = 5;
     double buttonXLocation = 141;
     double buttonYLocation = 122;
     
     for (int buttons = 0; buttons < 20; buttons++)
     {
     switch (selectorIndex)
     {
     case 0:
     [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 1:
     [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 2:
     [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 3:
     [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 4:
     [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 5:
     [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 6:
     [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     default:
     break;
     }
     
     selectorIndex++;
     
     if (selectorIndex == 7) selectorIndex = 0;
     
     buttonXLocation += 44;
     
     if (buttonXLocation >= 260)
     {
     buttonXLocation = 53;
     buttonYLocation += 76;
     }
     
     if (buttons == 8 || buttons == 11)
     {
     buttonXLocation += 44;
     }
     }
     }
     if ([self.calendarImageFile isEqualToString:@"mayCalendar"])
     {
     _aButtonTag = [NSNumber numberWithInt:19]; // Number first one is going to use
     _bButtonTag = [NSNumber numberWithInt:19];
     _cButtonTag = [NSNumber numberWithInt:20];
     _dButtonTag = [NSNumber numberWithInt:20];
     _eButtonTag = [NSNumber numberWithInt:18];
     _fButtonTag = [NSNumber numberWithInt:18];
     _gButtonTag = [NSNumber numberWithInt:18];
     
     int selectorIndex = 4;
     double buttonXLocation = 229;
     double buttonYLocation = 122;
     
     for (int buttons = 0; buttons < 16; buttons++)
     {
     switch (selectorIndex)
     {
     case 0:
     [self addAButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 1:
     [self addBButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 2:
     [self addCButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 3:
     [self addDButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 4:
     [self addEButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 5:
     [self addFButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     case 6:
     [self addGButtonWithXValue:buttonXLocation andYValue:buttonYLocation];
     break;
     default:
     break;
     }
     
     selectorIndex++;
     
     if (selectorIndex == 7) selectorIndex = 0;
     
     buttonXLocation += 44;
     
     if (buttonXLocation >= 260)
     {
     buttonXLocation = 53;
     buttonYLocation += 76;
     }
     
     if (buttons == 15)
     {
     buttonXLocation += 44;
     }
     
     int labelXLocation = 97;
     NSArray *letters = [NSArray arrayWithObjects:@"E", @"X", @"A", @"M", nil];
     
     for (int i = 0; i < 4; i++)
     {
     [self addLabelWithLetter:letters[i] atXValue:labelXLocation andYValue:426];
     
     labelXLocation += 44;
     }
     
     }
     }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addLabelWithLetter:(NSString *)letter
                  atXValue:(int)xLocation
                 andYValue:(int)yLocation
{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(xLocation, yLocation, 40, 50)];
    myLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
    myLabel.font = [UIFont fontWithName:@"Impact" size:22];
    myLabel.text = letter;
    myLabel.textColor = [UIColor grayColor];
    [self.view addSubview:myLabel];
}

- (void)addAButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"A" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_aButtonTag intValue];
    _aButtonTag = [NSNumber numberWithInt:([_aButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addBButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(bButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"B" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_bButtonTag intValue];
    _bButtonTag = [NSNumber numberWithInt:([_bButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addCButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(cButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"C" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_cButtonTag intValue];
    _cButtonTag = [NSNumber numberWithInt:([_cButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addDButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(dButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"D" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_dButtonTag intValue];
    _dButtonTag = [NSNumber numberWithInt:([_dButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addEButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(eButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"E" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_eButtonTag intValue];
    _eButtonTag = [NSNumber numberWithInt:([_eButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addFButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(fButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"F" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_fButtonTag intValue];
    _fButtonTag = [NSNumber numberWithInt:([_fButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (void)addGButtonWithXValue:(int)xLocation
                   andYValue:(int)yLocation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(gButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"G" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithRed:(56/255.0) green:(99/255.0) blue:(177/255.0) alpha:1] forState:UIControlStateNormal];
    button.frame = CGRectMake(xLocation, yLocation, 40, 50);
    button.tag = [_gButtonTag intValue];
    _gButtonTag = [NSNumber numberWithInt:([_gButtonTag intValue] + 1)];
    [self.view addSubview:button];
}

- (IBAction)aButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"A" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"09/7/2017",
                             @"9/18/2017",
                             @"9/28/2017",
                             @"10/11/2017",
                             @"10/20/2017",
                             @"11/1/2017",
                             @"11/13/2017",
                             @"11/27/2017",
                             @"12/6/2017",
                             @"12/15/2017",
                             @"1/9/2018",
                             @"1/22/2018",
                             @"1/31/2018",
                             @"2/9/2018",
                             @"2/22/2018"];
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    //[self initializeWithInt:((int) self.scrollView.contentOffset.y)]; //OBE
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)bButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"B" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/8/2017",
                             @"9/15/2015",
                             @"9/24/2015",
                             @"10/6/2015",
                             @"10/19/2015",
                             @"10/28/2015",
                             @"11/9/2015",
                             @"11/18/2015",
                             @"12/2/2015",
                             @"12/11/2015",
                             @"1/5/2016",
                             @"1/27/2016",
                             @"2/5/2016",
                             @"2/18/2016",
                             @"2/29/2016"];
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)cButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"C" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/8/2017",
                             @"9/19/2017",
                             @"9/29/2017",
                             @"10/12/2017",
                             @"10/23/2017",
                             @"11/02/2017",
                             @"11/14/2017",
                             @"11/28/2017",
                             @"12/07/2017",
                             @"12/18/2017",
                             @"11/0/2018",
                             @"12/3/2018",
                             @"2/12/018",
                             @"2/12/2018",
                             @"2/23/2018"];
    
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)dButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"D" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/11/2017",
                             @"9/20/2017",
                             @"10/2/2017",
                             @"10/13/2017",
                             @"10/24/2017",
                             @"11/6/2017",
                             @"11/15/2017",
                             @"11/29/2017",
                             @"12/8/2017",
                             @"12/19/2017",
                             @"1/11/2018",
                             @"1/24/2018",
                             @"2/2/2018",
                             @"2/13/2018",
                             @"2/26/2018"];
    
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)eButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"E" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/12/2017",
                             @"9/21/2017",
                             @"10/3/2017",
                             @"10/16/2017",
                             @"10/25/2017",
                             @"11/7/2017",
                             @"11/16/2017",
                             @"11/30/2017",
                             @"12/11/2017",
                             @"1/3/2018",
                             @"1/12/2018",
                             @"1/25/2018",
                             @"2/14/2018",
                             @"2/27/2018"];
    
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)fButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"F" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/14/2017",
                             @"9/26/2017",
                             @"10/5/2017",
                             @"10/18/2017",
                             @"10/30/2017",
                             @"11/9/2017",
                             @"11/20/2017",
                             @"12/4/2017",
                             @"12/13/2017",
                             @"1/5/2018",
                             @"1/18/2018",
                             @"1/29/2018",
                             @"2/7/2018",
                             @"2/20/2018"];
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (IBAction)gButtonPressed:(UIButton *)sender;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"G" forKey:@"Day"];
    
    NSArray *dateStrings = @[@"9/15/2017",
                             @"9/27/2017",
                             @"10/10/2017",
                             @"10/19/2017",
                             @"10/31/2017",
                             @"11/10/2017",
                             @"11/21/2017",
                             @"12/05/2017",
                             @"12/14/2017",
                             @"1/8/2018",
                             @"1/19/2018",
                             @"1/30/2018",
                             @"2/8/2018",
                             @"2/21/2018"];
    
    [user setValue:dateStrings[sender.tag] forKey:@"DayInCalendar"];
    
    [self performSegueWithIdentifier:@"showDay" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDay"])
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setInteger:_pageIndex forKey:@"calendarPageIndex"];
    }
}


@end
