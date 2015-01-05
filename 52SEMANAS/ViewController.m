//
//  ViewController.m
//  DMMemoSample
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController


#pragma mark - View Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    

    table.delegate = self;
    table.dataSource = self;
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud removeObjectForKey:@"titleArray"];
//    [ud removeObjectForKey:@"timeArray"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    titleArray = [[userDefaults arrayForKey:@"titleArray"] mutableCopy];
    timeArray = [[userDefaults arrayForKey:@"timeArray"] mutableCopy];
    if (!titleArray) {
        titleArray = [[NSMutableArray alloc] init];
    }
    
    if (!timeArray) {
        timeArray = [[NSMutableArray alloc] init];
    }
    
    [table reloadData];
    NSLog(@"titleArray is %@", titleArray);
    NSLog(@"timeArray is %@", timeArray);
}


#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = titleArray[indexPath.row];
    cell.detailTextLabel.text = timeArray[indexPath.row];
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowDetail" sender:nil];
    
}


#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"next"] ) {
        DetailViewController *detailViewController = [segue destinationViewController];
    }
}


#pragma mark - Private Method







@end
