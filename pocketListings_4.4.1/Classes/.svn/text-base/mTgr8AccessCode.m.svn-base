//
//  mTgr8AccessCode.m
//  idx
//
//  Created by Kaustubh Chavan on 9/8/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "mTgr8AccessCode.h"
#import "pocketListingsAppDelegate.h"
#import "AppUtils.h"
#import "XMLUtil.h"
#import "mTgr8HomeView.h"
#import "T_brandingData.h"
#import <QuartzCore/QuartzCore.h>
#import "AgentCityPickerViewController.h"
#import "CityStateData.h"

@implementation mTgr8AccessCode
CATransition *animation;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

    appDelegate = (pocketListingsAppDelegate *) [[UIApplication sharedApplication] delegate];

    self.navigationItem.hidesBackButton = YES;

    defaults = [NSUserDefaults standardUserDefaults];

    [super viewDidLoad];
//    [self viewWillAppear:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    if ([defaults objectForKey:@"UserID"] != nil) {
//		actionSheet = [[UIActionSheet alloc]initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
//		
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.center = loadingView.center;
        [activityView startAnimating];

        self.navigationController.navigationBarHidden = TRUE;

        [loadingView addSubview:activityView];
        [activityView startAnimating];
        [activityView release];
        loadingView.hidden = FALSE;

        txtUserID.text = [defaults objectForKey:@"UserID"];

        if ([appDelegate connectedToNetwork]) {
//			NSDate *today = [NSDate date];
            //NSLog(@"Today: %@",today);
//			NSDate *brandingDate = [defaults objectForKey:@"brandingDate"];
            //NSLog(@"Branding: %@",brandingDate);

//			NSTimeInterval lastDiff = [brandingDate timeIntervalSinceNow];
//			NSTimeInterval todaysDiff = [today timeIntervalSinceNow];
//			NSTimeInterval dateDiff = todaysDiff - lastDiff;

//			int day = dateDiff/86400;
            //NSLog(@"DateDiff: %i",day);

//			if(day >= 1)
            {
                [self userDataFromServer];
            }
//			else {
//				[self userDataFromLocal];
//			}


        }
        else {
            [self userDataFromLocal];

            UIAlertView *progressAlert;
            progressAlert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection!"
                                                       message:@"Internet access is required to use 'pocketListings'. Please check your network connection and try again."
                                                      delegate:self
                                             cancelButtonTitle:@"Quit"
                                             otherButtonTitles:nil, nil];
            [progressAlert show];
            [progressAlert release];
        }

    } else {
        // open safari and open the branding URL if TryOnce is not set
        if ([defaults objectForKey:@"TryOnce"] == nil) {
            NSURL *url = [NSURL URLWithString:@"http://spreadyourbrand.com/BrandApp.php"];
            [[UIApplication sharedApplication] openURL:url];
            [defaults setObject:@"YES" forKey:@"TryOnce"];
            [defaults synchronize];
        }
    }

}

- (void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = FALSE;
    self.navigationController.navigationBar.hidden = NO;
}

- (IBAction)whyIdSelected:(id)sender{
    NSString *urltext = @"http://mtgr8.com/mobile/pocketlistings/whyagent.html";
    
    NSString *strUrl = [urltext stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSURL *url = [NSURL URLWithString:strUrl];
    //NSLog(@"Direction URL -%@",urltext);
    
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[webView layer] addAnimation:animation forKey:@"animate"];
    
    webView.scalesPageToFit = YES;
    webView.hidden = FALSE;
    btnWhyDone.hidden=FALSE;
    
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancel)];
    
    //[[UIApplication sharedApplication]openURL:url];
    [urltext release];
}

- (IBAction)whyIdCancelled:(id)sender{
    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromBottom];
    [[webView layer] addAnimation:animation forKey:@"animate"];
    
    [webView setHidden:YES];
    [btnWhyDone setHidden:YES];
    self.navigationItem.leftBarButtonItem = nil;
}

- (IBAction)TnC:(id)sender {
    NSString *urltext = @"http://mtgr8.com/mobile/pocketlistings/pocketListings_tc.html";

    NSString *strUrl = [urltext stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSURL *url = [NSURL URLWithString:strUrl];
    //NSLog(@"Direction URL -%@",urltext);


    [webView loadRequest:[NSURLRequest requestWithURL:url]];

    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[webView layer] addAnimation:animation forKey:@"animate"];
    webView.scalesPageToFit = NO;

    webView.hidden = FALSE;
    btnGo.hidden=FALSE;

//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancel)];

    //[[UIApplication sharedApplication]openURL:url];
    [urltext release];
}

- (IBAction)cancel:(id)sender {
    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromBottom];
    [[webView layer] addAnimation:animation forKey:@"animate"];

    [webView setHidden:YES];
    [btnGo setHidden:YES];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {

    [self dismissModalViewControllerAnimated:YES];

}

- (void)userCityDataFromServer {
    if (arrayCities != nil) {
        [arrayCities release];
    }
    arrayCities = [[NSMutableArray alloc] init];
    NSString *urlStr = @"http://spreadyourbrand.com/webservice/webservice.php?city=all";

    NSURL *serviceURL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];

    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    [urlRequest addValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [urlRequest addValue:@"GET" forHTTPHeaderField:@"Method"];
    [urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
    [urlRequest addValue:@"*/*" forHTTPHeaderField:@"Accept"];

    [AppUtils requestBinaryDataFromServer:urlRequest resultTarget:self targetFunction:@selector(userCityDataCallback:delegate:)];
}

- (void)userCityDataCallback:(id)data delegate:(id)delegate {

    NSMutableArray *cities = [[NSMutableArray alloc] init];
    AgentCityPickerViewController *abViewController = [[AgentCityPickerViewController alloc] initWithNibName:nil bundle:nil];
    if (delegate != nil) {
        NSString *resStr = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding] autorelease];
        resStr = [[resStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
        CXMLDocument *document = [[[CXMLDocument alloc] initWithXMLString:resStr options:0 error:nil] autorelease];
        NSNumber *ltotalcount = [XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:@"totalcount" inNode:[document rootElement]]];
        if (ltotalcount != nil) {
//            totalCount = [ltotalcount intValue];
        }
        NSNumber *lCount = [XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:@"count" inNode:[document rootElement]]];
        if (lCount != nil) {
//            count = count+[lCount intValue];
        }

        [document retain];
        [delegate retain];



        //if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
        NSArray *cityDatas = [XMLUtil getXMLValue:@"/Cities/City" inNode:[document rootElement]];

        if (cityDatas != nil) {
            for (int i = 0; i < cityDatas.count; i++) {
                NSString *city = [XMLUtil getXMLStringValue:@"City" inNode:[cityDatas objectAtIndex:i]];
                NSString *state = [XMLUtil getXMLStringValue:@"State" inNode:[cityDatas objectAtIndex:i]];
                CityStateData *lData = [[CityStateData alloc] init];
                lData.city = city;
                lData.state = state;

                [abViewController.arrCityStateData addObject:lData];

//                [arrayCities addObject:city];
            }
        }
    }

    /*
    actionSheet = [[UIActionSheet alloc]initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];

    [actionSheet addSubview:pickerView];
    
    [actionSheet showInView:[self view]];
     */


    [self.navigationController pushViewController:abViewController animated:YES];
    [abViewController release];
    [appDelegate performDismiss2:0];

}


- (IBAction)requestCode:(id)sender {
//    NSString *to = @"support@spreadyourbrand.com";
//	NSString *subject = @"Request for Access ID";
//	NSString *body = [NSString stringWithFormat:@"I am interested in getting an access id for the app.<br/><br/>%@",[appDelegate getStandardEmailFooter]];
//	
//    [appDelegate sendMail:subject to:to body:body];
    [appDelegate showActivityViewer2];
    [self userCityDataFromServer];
//    AgentCityPickerViewController* pvController = [[AgentCityPickerViewController alloc] initWithNibName:@"AgentCityPickerViewController" bundle:nil];
//	
//	pickerView= [NSPipe

//    AgentBrowserViewController *abViewController = [[AgentBrowserViewController alloc] initWithNibName:nil bundle:nil];
//    UIImage * img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://mail.google.com/mail/images/2/5/logo4.png"]]];
//    UIImage * img1 = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://mail.google.com/mail/images/2/5/logo4.png"]]];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];
//    [abViewController.imagesArray addObject:img];
//    [abViewController.imagesArray addObject:img1];

//	[self.navigationController pushViewController:abViewController animated:YES];
//	[abViewController release];

}

- (IBAction)Go:(id)sender {
//	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"I have read the Terms & Conditions. I accept the agreement." message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Agree",nil];
//	[alert show];
//	[alert release];

    [txtUserID resignFirstResponder];
    if (txtUserID.text.length > 0 && txtUserID.text != nil) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        btnGo.enabled = FALSE;
        txtUserID.userInteractionEnabled = FALSE;
        btnTnC.enabled = FALSE;
        [self performSelector:@selector(fetchData) withObject:nil afterDelay:0.1];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please enter UserID" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"No Internet Connection!"]) {
        exit(0);
    }
    else if ([alertView.title isEqualToString:@"Cannot login!\nInvalid Access ID"]) {
        self.navigationController.navigationBarHidden = FALSE;
        //[activityView stopAnimating];
        loadingView.hidden = TRUE;

        [defaults setObject:nil forKey:@"UserID"];
        [defaults synchronize];
    }
    else if ([alertView.title isEqualToString:@"I have read the Terms & Conditions. I accept the agreement."]) {
        if (buttonIndex == 1) {
            [txtUserID resignFirstResponder];
            if (txtUserID.text.length > 0 && txtUserID.text != nil) {
                [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
                btnGo.enabled = FALSE;
                txtUserID.userInteractionEnabled = FALSE;
                btnTnC.enabled = FALSE;
                [self performSelector:@selector(fetchData) withObject:nil afterDelay:0.1];
            }
            else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please enter UserID" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                [alert release];
            }

        }
    }

}

- (void)fetchData {
    if ([appDelegate connectedToNetwork]) {
        //[appDelegate showActivityViewer];
        [self userDataFromServer];
    }
    else {
        [appDelegate performDismiss:0];
        UIAlertView *progressAlert;
        progressAlert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection!"
                                                   message:@"Internet access is required to use 'pocketListings'. Please check your network connection and try again."
                                                  delegate:self
                                         cancelButtonTitle:@"Quit"
                                         otherButtonTitles:nil, nil];
        [progressAlert show];
        [progressAlert release];

    }

}

- (void)userDataFromServer {

    //NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/users/%@.xml?apikey=%@",txtUserID.text,appDelegate.API_KEY];

    NSString *urlStr = [NSString stringWithFormat:@"http://www.spreadyourbrand.com/webservice/webservice.php?mtag=%@", txtUserID.text];

    NSURL *serviceURL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];

    NSData *XmlData = [NSData dataWithContentsOfURL:serviceURL];
    NSString *strXmlContent = [[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"BrandingData.xml"];

    [strXmlContent writeToFile:dataFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    [strXmlContent release];

    [appDelegate startTimeOut];

    NSDate *today = [NSDate date];
    [defaults setObject:today forKey:@"brandingDate"];
    [defaults synchronize];

    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    [urlRequest addValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [urlRequest addValue:@"GET" forHTTPHeaderField:@"Method"];
    [urlRequest addValue:@"*/*" forHTTPHeaderField:@"Accept"];

    [AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(userDataCallback:delegate:)];
}

- (void)userDataFromLocal {
    [appDelegate startTimeOut];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"BrandingData.xml"];

    NSData *XmlData = [NSData dataWithContentsOfFile:dataFilePath];
    if (XmlData > 0) {
        NSString *strXmlContent = [[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding];

        CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:strXmlContent options:0 error:nil] autorelease];

        [self userDataCallback:resDoc delegate:self];
        [strXmlContent release];
    }


}

- (void)userDataCallback:(id)document delegate:(id)delegate {
    if (!appDelegate.isTimeOut) {
        [appDelegate invalidTimer];
        if (delegate != nil) {
            [document retain];
            [delegate retain];

            //if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
            if ([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"Yes"]) {
                [defaults setObject:txtUserID.text forKey:@"UserID"];
                [defaults synchronize];

                T_brandingData *objTBranding = [[[T_brandingData alloc] initWithXML:[document rootElement]] retain];

                //T_Users* objTUsers = [[[T_Users alloc] initWithXML:[document rootElement]] retain];
                id data = objTBranding;
                appDelegate.API_KEY = objTBranding.apiKey_var;
                mTgr8HomeView *objHome = [[mTgr8HomeView alloc] initWithNibName:@"mTgr8HomeView" bundle:nil];
                objHome.userData = data;
                [self.navigationController pushViewController:objHome animated:NO];
                [objHome release];

                if (![defaults boolForKey:@"isUserActive"]) {
                    [defaults setBool:YES forKey:@"isUserActive"];

//				if(appDelegate.currentDevOS >= 4)
//				{
//					NSDictionary *dictionary = 
//					[NSDictionary dictionaryWithObjectsAndKeys:
//					 txtUserID.text, 
//					 @"MTAG", 
//					 nil];
//					[FlurryAPI logEvent:@"USER_ACTIVATION_EVENT" withParameters:dictionary];
//					
//				}

                }




                //[document release];
                //[delegate release];
            }
            else {
                btnGo.enabled = TRUE;
                txtUserID.userInteractionEnabled = TRUE;
                btnTnC.enabled = TRUE;

                if ([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"No"]) {
                    //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No records found! \nPossible causes: \nSearch Range too narrow.. \nServer does not support location.. \nServer session timed out..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot login!\nAgent is Inactive" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    [alert release];
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot login!\nInvalid Access ID" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    [alert release];
                }

            }
        } else {
            //[Utils showErrorAlert:@"Error, server call failed!"];
        }

        //[self performSelector:@selector(dismissActionsheet) withObject:nil afterDelay:5.0];

    }
    //[appDelegate performDismiss:0];
}

- (void)dismissActionsheet {
    [actionSheet dismissWithClickedButtonIndex:0 animated:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animateTextField:textField up:YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animateTextField:textField up:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//	[theTextField resignFirstResponder];
    [self Go:nil];
    return YES;
}


- (void)animateTextField:(UITextField *)textField up:(BOOL)up {
    const int movementDistance = 200; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed

    int movement = (up ? -movementDistance : movementDistance);

    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [actionSheet release];
    [arrayCities release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker View Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {

    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {

    return [arrayCities count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@", [arrayCities objectAtIndex:row]];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [actionSheet dismissWithClickedButtonIndex:0 animated:NO];
    [actionSheet release];
//    AgentBrowserViewController *abViewController = [[AgentBrowserViewController alloc] initWithNibName:nil bundle:nil];
//    abViewController.city=[arrayCities objectAtIndex:row];
//    [self.navigationController pushViewController:abViewController animated:YES];
//	[abViewController release];

    //NSLog(@"Selected City: %@. Index of selected City: %i", [arrayCities objectAtIndex:row], row);
}

@end
