#import <UIKit/UIKit.h>
// #import <Parse/Parse.h> // Only needed when using Parse system (OBE)

@interface LoginViewController : UIViewController

@property IBOutlet UISegmentedControl *schoolSelector;
@property IBOutlet UISegmentedControl *ensembleSelector;

@property (weak, nonatomic) IBOutlet UILabel *pageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ensembleLabel;


@property (weak, nonatomic) IBOutlet UITextField *period1Field;
@property (weak, nonatomic) IBOutlet UITextField *period2Field;
@property (weak, nonatomic) IBOutlet UITextField *period3Field;
@property (weak, nonatomic) IBOutlet UITextField *period4Field;
@property (weak, nonatomic) IBOutlet UITextField *period5Field;
@property (weak, nonatomic) IBOutlet UITextField *period6Field;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)schoolSelected;

- (IBAction)ensembleSelected;


@end
