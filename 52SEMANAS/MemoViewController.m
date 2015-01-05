//
//  MemoViewController.m


#import "MemoViewController.h"

@interface MemoViewController ()

@end

@implementation MemoViewController

#pragma mark - init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    titleTextField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [datePicker setDate:[NSDate date] animated:YES];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyyM HH:mm";
    NSString *formatedDate = [dateFormatter stringFromDate:[datePicker date]];
    timeLabel.text = formatedDate;
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [titleTextField resignFirstResponder];
    return YES;
}


#pragma mark - Private

- (IBAction)saveMemo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *titleArray = [[userDefaults arrayForKey:@"titleArray"] mutableCopy];
    if (!titleArray) {
        titleArray = [[NSMutableArray alloc] init];
    }
    
    NSMutableArray *timeArray = [[userDefaults arrayForKey:@"timeArray"] mutableCopy];
    if (!timeArray) {
        timeArray = [[NSMutableArray alloc] init];
    }
    
    [titleArray insertObject:titleTextField.text atIndex:0];
    [timeArray insertObject:timeLabel.text atIndex:0];
    
    [userDefaults setObject:titleArray forKey:@"titleArray"];
    [userDefaults setObject:timeArray forKey:@"timeArray"];
    [userDefaults synchronize];
}



@end
