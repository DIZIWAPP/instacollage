//
//  InitialViewController.m
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)makeButtonPressed:(id)sender;

@end

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (IBAction)makeButtonPressed:(id)sender {
    if (self.textField.text.length > 0) {
        self.photoWorker = [[PhotoWorker alloc] init];
        NSString *username = self.textField.text;
        [self.photoWorker loadPhotos: username success: ^{
            [self performSegueWithIdentifier:@"showPicker" sender:sender];
        }];
    }
}
@end
