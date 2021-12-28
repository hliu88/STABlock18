#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *fuzzyView;
@property (nonatomic, weak) NSArray *schedulesArray;
@property (weak, nonatomic) IBOutlet UILabel *settingsLabel;
@property (weak, nonatomic) IBOutlet UIButton *addScheduleButton;
@property (weak, nonatomic) IBOutlet UILabel *viewScheduleLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *cloudScheduleButton;
@property (weak, nonatomic) IBOutlet UIButton *whatIsCloudScheduleButton;
@property (weak, nonatomic) IBOutlet UISwitch *cloudScheduleSwitch;

- (IBAction)addSchedule;
- (IBAction)whatIsCloudSchedulePressed;
- (IBAction)switchValueChanged:(id)sender;


@end
