#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

@synthesize scrollView = _scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        self.scrollView.frame = CGRectMake(0, 0, 320, 480);
        self.scrollView.contentSize = CGSizeMake(320, 568);
        [_scrollView setScrollEnabled:YES];
        [_scrollView setShowsVerticalScrollIndicator:YES];
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]];
    
    self.dayLabel.font = [UIFont fontWithName:@"Impact" size:28];
    self.dayLabel.text = self.dayLabelText;
    self.dayLabel.textColor = [UIColor whiteColor]; //
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *period1Class = [user stringForKey:@"currentPeriod1"];
    NSString *period2Class = [user stringForKey:@"currentPeriod2"];
    NSString *period3Class = [user stringForKey:@"currentPeriod3"];
    NSString *period4Class = [user stringForKey:@"currentPeriod4"];
    NSString *period5Class = [user stringForKey:@"currentPeriod5"];
    NSString *period6Class = [user stringForKey:@"currentPeriod6"];
    NSString *ensemble = [user stringForKey:@"currentEnsemble"];
    
    // A bunch of pre initiated bools to make the if statements cleaner
    bool attendSTA = [[user valueForKey:@"currentSchool"] isEqualToString:@"STA"];
    bool currentABlock1 = [user boolForKey:@"currentABlock1"];
    bool currentABlock2 = [user boolForKey:@"currentABlock2"];
    bool currentABlock3 = [user boolForKey:@"currentABlock3"];
    bool currentABlock4 = [user boolForKey:@"currentABlock4"];
    bool currentABlock5 = [user boolForKey:@"currentABlock5"];
    bool currentABlock6 = [user boolForKey:@"currentABlock6"];
    bool currentABlock7 = [user boolForKey:@"currentABlock7"];
    bool dayA = [self.dayLabelText isEqualToString:@"Day A"];
    bool dayB = [self.dayLabelText isEqualToString:@"Day B"];
    bool dayC = [self.dayLabelText isEqualToString:@"Day C"];
    bool dayD = [self.dayLabelText isEqualToString:@"Day D"];
    bool dayE = [self.dayLabelText isEqualToString:@"Day E"];
    bool dayF = [self.dayLabelText isEqualToString:@"Day F"];
    bool dayG = [self.dayLabelText isEqualToString:@"Day G"];
    
    if (dayA)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock1) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayASchedule = [self drawText1:period1Class
                                      drawText2:period2Class
                                      drawText3:period3Class
                                      drawText4:period4Class
                                      drawText5:period5Class
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:183
                                       atPoint4:changingPosition
                                       atPoint5:355
                                       atPoint6:0
                                       atPoint7:CGPointMake(0, 0)];
        [self drawImage:dayASchedule];
    }
    else if (dayB)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock2) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayBSchedule = [self drawText1:period6Class
                                      drawText2:period1Class
                                      drawText3:period2Class
                                      drawText4:period3Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(-45, 155)];
        [self drawImage:dayBSchedule];

    }
    else if (dayC)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock3) changingPosition = 218;
        else changingPosition = 253;
        
        UIImage *dayCSchedule = [self drawText1:period4Class
                                      drawText2:period5Class
                                      drawText3:period6Class
                                      drawText4:period1Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:150
                                       atPoint3:changingPosition
                                       atPoint4:321
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(0,0)];
        [self drawImage:dayCSchedule];
    }
    else if (dayD)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock4) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayDSchedule = [self drawText1:period2Class
                                      drawText2:period3Class
                                      drawText3:period4Class
                                      drawText4:period5Class
                                      drawText5:period6Class
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:183
                                       atPoint4:changingPosition
                                       atPoint5:355
                                       atPoint6:0
                                       atPoint7:CGPointMake(0, 0)];
        [self drawImage:dayDSchedule];
    }
    else if (dayE)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock5)
        {
            changingPosition = 252;
            changingXValue = -45;
        }
        else
        {
            changingPosition = 286;
            changingXValue = 0;
        }
        
        UIImage *dayESchedule = [self drawText1:period1Class
                                      drawText2:period2Class
                                      drawText3:period3Class
                                      drawText4:period4Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 189)];
        [self drawImage:dayESchedule];
    }
    else if (dayF)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock6) changingPosition = 252;
        else changingPosition = 286;
        
        if ([ensemble isEqualToString:@"Ensemble"]) changingXValue = 45;
        else changingXValue = 30;
        
        UIImage *dayFSchedule = [self drawText1:period5Class
                                      drawText2:period6Class
                                      drawText3:period1Class
                                      drawText4:period2Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:80
                                       atPoint2:149
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 18)];
        [self drawImage:dayFSchedule];
    }
    else if (dayG)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock7)
        {
            changingPosition = 252;
            changingXValue = -45;
        }
        else
        {
            changingPosition = 286;
            changingXValue = 0;
        }
        
        UIImage *dayGSchedule = [self drawText1:period3Class
                                      drawText2:period4Class
                                      drawText3:period5Class
                                      drawText4:period6Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.scheduleImageFile]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 189)];
        [self drawImage:dayGSchedule];
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = (int)[comps weekday] + (int)_pageIndex;
    self.dowLabel.textColor = [UIColor whiteColor];
    self.dowLabel.font = [UIFont fontWithName:@"Impact" size:20];
    if (_pageIndex == 0) self.dowLabel.text = @"Today";
    else if (_pageIndex == 1) self.dowLabel.text = @"Tomorrow";
    else if (weekday == 1 || weekday == 8) self.dowLabel.text = @"Sunday";
    else if (weekday == 2 || weekday == 9) self.dowLabel.text = @"Monday";
    else if (weekday == 3 || weekday == 10) self.dowLabel.text = @"Tuesday";
    else if (weekday == 4 || weekday == 11) self.dowLabel.text = @"Wednesday";
    else if (weekday == 5 || weekday == 12) self.dowLabel.text = @"Thursday";
    else if (weekday == 6 || weekday == 13) self.dowLabel.text = @"Friday";
    else if (weekday == 7 || weekday == 14) self.dowLabel.text = @"Saturday";
    else self.dowLabel.text = nil;
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    NSDateComponents *todayComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:[NSDate date]];
    NSInteger theDay = [todayComponents day];
    NSInteger theMonth = [todayComponents month];
    NSInteger theYear = [todayComponents year];
    
    // Build an NSDate object for your date using these components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    
    NSDate *date1 = [gregorian dateFromComponents:components];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:1];
    
    NSDate *date2 = [gregorian dateByAddingComponents:offsetComponents toDate:date1 options:0];
    NSDate *date3 = [gregorian dateByAddingComponents:offsetComponents toDate:date2 options:0];
    NSDate *date4 = [gregorian dateByAddingComponents:offsetComponents toDate:date3 options:0];
    NSDate *date5 = [gregorian dateByAddingComponents:offsetComponents toDate:date4 options:0];
    NSDate *date6 = [gregorian dateByAddingComponents:offsetComponents toDate:date5 options:0];
    NSDate *date7 = [gregorian dateByAddingComponents:offsetComponents toDate:date6 options:0];
    
    self.dateLabel.textColor = [UIColor whiteColor];
    self.dateLabel.font = [UIFont fontWithName:@"Impact" size:20];
    if (_pageIndex == 0) self.dateLabel.text = [DateFormatter stringFromDate:date1];
    else if (_pageIndex == 1) self.dateLabel.text = [DateFormatter stringFromDate:date2];
    else if (_pageIndex == 2) self.dateLabel.text = [DateFormatter stringFromDate:date3];
    else if (_pageIndex == 3) self.dateLabel.text = [DateFormatter stringFromDate:date4];
    else if (_pageIndex == 4) self.dateLabel.text = [DateFormatter stringFromDate:date5];
    else if (_pageIndex == 5) self.dateLabel.text = [DateFormatter stringFromDate:date6];
    else if (_pageIndex == 6) self.dateLabel.text = [DateFormatter stringFromDate:date7];
    else self.dateLabel.text = nil;
    
    if ([self.dayLabelText isEqualToString:@"No School"])
    {
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 200, 44)];
        dayLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dayLabel.font = [UIFont fontWithName:@"Impact" size:44];
        dayLabel.text = self.dayLabelText;
        dayLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dayLabel];
        
        UILabel *dowLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 225, 230, 25)];
        dowLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dowLabel.font = [UIFont fontWithName:@"Impact" size:26];
        dowLabel.text = self.dowLabel.text;
        dowLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dowLabel];
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(98, 290, 124, 25)];
        dateLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dateLabel.font = [UIFont fontWithName:@"Impact" size:26];
        dateLabel.text = self.dateLabel.text;
        dateLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dateLabel];
        
        self.lineSpacerView.image = [UIImage imageNamed:@"noSchoolSpacer"];
        
        self.dayLabel.text = @"";
        self.dowLabel.text = @"";
        self.dateLabel.text = @"";
        
        int pageBehind = [self.scheduleNumbers[self.pageIndex] intValue];
        int pageAhead = [self.scheduleNumbers[self.pageIndex + 2] intValue];
        
        if (pageBehind !=0 && pageAhead != 0)
        {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeBoth"]]];
        }
        else if (pageBehind != 0)
        {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeLeft"]]];
        }
        else if (pageAhead != 0)
        {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeRight"]]];
        }
        else
        {
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchool"]]];
        }
        
        if (_pageIndex == 0)
        {
            if (pageAhead != 0)
            {
                [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeBoth"]]];
            }
            else
            {
                [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeLeft"]]];
            }
        }
        if (_pageIndex == 6)
        {
            if (pageBehind != 0)
            {
                [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeBoth"]]];
            }
            else
            {
                [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"noSchoolFadeRight"]]];
            }
        }
        
        
    }
    else
    {
        self.lineSpacerView.image = [UIImage imageNamed:@"schoolSpacer"];
        //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"smearedBackground"]]];
    }
    
    if ([self.dayLabelText isEqualToString:@"Irregular"])
    {
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 200, 44)];
        dayLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dayLabel.font = [UIFont fontWithName:@"Impact" size:26];
        dayLabel.text = @"Irregular Day";
        dayLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dayLabel];
        
        UILabel *dowLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 225, 200, 25)];
        dowLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dowLabel.font = [UIFont fontWithName:@"Impact" size:26];
        dowLabel.text = self.dowLabel.text;
        dowLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dowLabel];
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(98, 290, 124, 25)];
        dateLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        dateLabel.font = [UIFont fontWithName:@"Impact" size:26];
        dateLabel.text = self.dateLabel.text;
        dateLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:dateLabel];
        
        UILabel *instructionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 355, 200, 25)];
        instructionsLabel.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        instructionsLabel.font = [UIFont fontWithName:@"Impact" size:18];
        instructionsLabel.text = @"Check halls for";
        instructionsLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:instructionsLabel];
        
        UILabel *instructionsLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 375, 200, 25)];
        instructionsLabel2.textAlignment = NSTextAlignmentCenter;  //for iOS 6.0 and above
        instructionsLabel2.font = [UIFont fontWithName:@"Impact" size:18];
        instructionsLabel2.text = @"posted schedules.";
        instructionsLabel2.textColor = [UIColor whiteColor];
        [self.view addSubview:instructionsLabel2];
        
        self.lineSpacerView.image = [UIImage imageNamed:@"noSchoolSpacer"];
        
        self.dayLabel.text = @"";
        self.dowLabel.text = @"";
        self.dateLabel.text = @"";
    }
    
    // Do any additional setup after loading the view.
}

- (UIImage *) drawText1:(NSString*) period1
              drawText2:(NSString*) period2
              drawText3:(NSString*) period3
              drawText4:(NSString*) period4
              drawText5:(NSString*) period5
              drawText6:(NSString*) period6
              drawText7:(NSString*) ensemble
                inImage:(UIImage*) image
               atPoint1:(int) point1
               atPoint2:(int) point2
               atPoint3:(int) point3
               atPoint4:(int) point4
               atPoint5:(int) point5
               atPoint6:(int) point6
               atPoint7:(CGPoint) point

{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    
    CGRect rect1 = CGRectMake(0, point1, image.size.width, image.size.height);
    CGRect rect2 = CGRectMake(0, point2, image.size.width, image.size.height);
    CGRect rect3 = CGRectMake(0, point3, image.size.width, image.size.height);
    CGRect rect4 = CGRectMake(0, point4, image.size.width, image.size.height);
    CGRect rect5 = CGRectMake(0, point5, image.size.width, image.size.height);
    CGRect rect6 = CGRectMake(0, point6, image.size.width, image.size.height);
    CGRect rect7 = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    
    UIFont *font = [UIFont fontWithName:@"Impact" size:15];
    
    // Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    // Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    // Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    [period1 drawInRect:CGRectIntegral(rect1) withAttributes:attributes];
    [period2 drawInRect:CGRectIntegral(rect2) withAttributes:attributes];
    [period3 drawInRect:CGRectIntegral(rect3) withAttributes:attributes];
    [period4 drawInRect:CGRectIntegral(rect4) withAttributes:attributes];
    [period5 drawInRect:CGRectIntegral(rect5) withAttributes:attributes];
    [period6 drawInRect:CGRectIntegral(rect6) withAttributes:attributes];
    [ensemble drawInRect:CGRectIntegral(rect7) withAttributes:attributes];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void) drawImage:(UIImage *) scheduleImage
{
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(self.scheduleImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.scheduleImageView.bounds
                                cornerRadius:10.0] addClip];
    // Draw your image
    [scheduleImage drawInRect:self.scheduleImageView.bounds];
    
    // Get the image, here setting the UIImageView image
    self.scheduleImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
