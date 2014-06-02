//
//  STCViewController.m
//  Parse Test

#import "STCViewController.h"

@interface STCViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation STCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUserButtonPressed:(UIButton *)sender
{
    PFObject *loginCredentials = [PFObject objectWithClassName:@"LoginCredentials"];
    loginCredentials[@"name"] = self.usernameTextField.text;
    loginCredentials[@"password"] = self.passwordTextField.text;
    
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save" message:@"Your object saved" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            NSLog(@"Save successful");
        }
        else if (error){
            NSLog(@"%@", error);
        }
    }];
}

@end
