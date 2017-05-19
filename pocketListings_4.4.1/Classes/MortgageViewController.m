//
//  MortgageViewController.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 10/25/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "MortgageViewController.h"
#import "pocketListingsAppDelegate.h"
#import "MortgageCalculator.h"
#import "AppUtils.h"

@implementation MortgageViewController
@synthesize agentData;

CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


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
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	//self.navigationItem.hidesBackButton = YES;
	
	arrMortgage = [[NSMutableArray alloc]initWithObjects:@"Mortgage Calculator",@"Request Pre-Approval",@"Request Rates",nil];
	
	if([defaults boolForKey:@"isCalculate"])
	{
		[defaults setBool:NO forKey:@"isCalculate"];
		txtHomePrice.text = [defaults objectForKey:@"ListPrice"];
	}
	
	[self calculateAmount];
	
	[self SetData];
	
	appDelegate.isSkip = YES;
	
    [super viewDidLoad];
}

- (void)SetData
{
	NSString *strFirstName = agentData.agentFName_var;
	strFirstName = strFirstName!=nil?strFirstName:@"";
	
	NSString *strLastName = agentData.agentLName_var;
	strLastName = strLastName!=nil?strLastName:@"";
	
	lblUserName.text = [[NSString stringWithFormat:@"%@ %@", strFirstName,strLastName]retain];
	
	NSString *strUsrLic = agentData.agentLic_var;
	strUsrLic = strUsrLic!=nil?strUsrLic:@"";
	lblUserLic.text = [[NSString stringWithFormat:@"Lic: %@", strUsrLic]retain];
	
	lblOffName.text = agentData.officeName_var;
	lblOffName.text = lblOffName.text!=nil?lblOffName.text:@"";
	
	NSString *strOffLic = agentData.officeLic_var;
	strOffLic = strOffLic!=nil?strOffLic:@"";
	lblOffLic.text = [[NSString stringWithFormat:@"Lic: %@", strOffLic]retain];
	
	NSString *strVanityText = agentData.vanityText_var;
	strVanityText = strVanityText!=nil?strVanityText:@"";
	lblVanityText.text = strVanityText;
	
	if(agentData.agentImage_var.length > 0)
	{
		NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:agentData.agentImage_var]];
		if(imgData > 0)
		{
			imgAgent.image = [UIImage imageWithData:imgData];
		}
		else 
		{
			imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
		}
		
	}
	else
	{
		imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}
	
	
	
	[btnContact setTitle:[NSString stringWithFormat:@"Contact %@",strFirstName] forState:UIControlStateNormal];
	
	NSData *imgLogoData = [NSData dataWithContentsOfURL:[NSURL URLWithString:agentData.officeLogoURL_var]];
	
	if(imgLogoData > 0)
	{
		CGRect appRect = [[UIScreen mainScreen] applicationFrame];
		appRect.origin = CGPointMake(0.0f,0.0f);
		UIView *MainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300.0f , 50.0f)];
		UIImageView *imageContents =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
		[imageContents setBackgroundColor:[[[UIColor alloc]initWithRed:0.28 green:0.43 blue:0.17 alpha:0]autorelease]];
		[imageContents setImage:[UIImage imageWithData:imgLogoData]]; // :@"pocketListings.png"]];
		[imageContents setContentMode:UIViewContentModeScaleAspectFit];
		CGRect imgFrame = imageContents.frame;
		imgFrame.origin = CGPointMake(0,5);
		imageContents.frame = imgFrame;
		[MainView addSubview:imageContents];
		[imageContents release];
		
		self.navigationItem.titleView = MainView;
	}
	
	[appDelegate performDismiss:0];
}

-(void)viewWillAppear:(BOOL)animated{
	
//	if(![defaults boolForKey:@"isAgreeTC"])
//	{
//		//[self showMortgage];
//		[webViewTC setDelegate:self];
//		[webViewTC loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mtgr8.com/mobile/pocketlistings/finance_tc.html"]]];
//		viewTC.hidden = FALSE;
//	}
//	else {
//		[appDelegate showActivityViewer];
//		[self userDataFromServer];
		
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareOptions)];
//	}

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
	[appDelegate showActivityViewer];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
	[appDelegate performDismiss:0];
}


- (IBAction) AgreeTC:(id)sender
{
	[defaults setBool:YES forKey:@"isAgreeTC"];
	[defaults synchronize];
	viewTC.hidden = TRUE;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareOptions)];
	//[self showMortgage];
}

- (IBAction) QuitTC:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
	viewTC.hidden = TRUE;
}

- (void) shareOptions
{
	UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Request Pre-Approval",@"Request Rates",nil];
	[action showFromTabBar:appDelegate.tabController.tabBar];
	[action release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	if(buttonIndex == 0)
	{
		NSString *to;
		
		if(agentData.agentEmail_var.length > 0)
		{
			to = agentData.agentEmail_var;
		}
		else 
		{
			to = @"nshukla@mtgr8.com";
		}
		
		NSString *subject;
		NSString *body;
		
		subject = @"Pre-Approval Request";
		body = [NSString stringWithFormat:@"I would like to get a pre-approval for following property:<br/><br/>Purchase Price: $ %@<br/>Down payment: %@ %%<br/><br/>For further information please reply to this email.<br/>Thanks<br/><br/>%@",txtHomePrice.text,txtDownPayment.text,[appDelegate getStandardEmailFooter]];
		
		//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
		if ([MFMailComposeViewController canSendMail])
		{
			MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
			composeVC.mailComposeDelegate = self;
			[composeVC setSubject:subject];
			NSArray *arrTo = [NSArray arrayWithObject:to];
			[composeVC setToRecipients:arrTo];
			[composeVC setMessageBody:body isHTML:YES];
			[self presentModalViewController:composeVC animated:YES];
			[composeVC release];
			[self dismissModalViewControllerAnimated:YES];
		}
		else{
			UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																	message: @"Could not find an application to e-mail. Please configure."
																   delegate: self
														  cancelButtonTitle: nil
														  otherButtonTitles: @"Ok",nil];
			[progressAlert show];
			[progressAlert release];
		}
		
	}
	else if(buttonIndex == 1)
	{
		NSString *to;
		
		if(agentData.agentEmail_var.length > 0)
		{
			to = agentData.agentEmail_var;
		}
		else 
		{
			to = @"nshukla@mtgr8.com";
		}
		
		NSString *subject;
		NSString *body;
		
		subject = @"Rate Request";
		body = [NSString stringWithFormat:@"Please send me rates for following scenario:<br/><br/>Purchase Price: $ %@\nDown Payment: %@ %%<br/><br/>For further information please reply to this email.<br/>Thanks <br/><br/>%@",txtHomePrice.text,txtDownPayment.text,[appDelegate getStandardEmailFooter]];
		
		//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
		
		if ([MFMailComposeViewController canSendMail])
		{
			MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
			composeVC.mailComposeDelegate = self;
			[composeVC setSubject:subject];
			NSArray *arrTo = [NSArray arrayWithObject:to];
			[composeVC setToRecipients:arrTo];
			[composeVC setMessageBody:body isHTML:YES];
			[self presentModalViewController:composeVC animated:YES];
			[composeVC release];
			[self dismissModalViewControllerAnimated:YES];
		}
		else{
			UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																	message: @"Could not find an application to e-mail. Please configure."
																   delegate: self
														  cancelButtonTitle: nil
														  otherButtonTitles: @"Ok",nil];
			[progressAlert show];
			[progressAlert release];
		}
		
	}
}

- (void) calculateAmount
{
	double P = [txtHomePrice.text doubleValue] - ([txtHomePrice.text doubleValue]*[txtDownPayment.text doubleValue]/100);
	double J = [txtInterestRate.text doubleValue]/(12 * 100);
	double N = 12 * [txtLoanTerm.text doubleValue];
	
	double y = 1 + J;
	
	double x = pow(y,-N);
	
	double z = 1 - x;
	
	double M = P * ( J / z);
	NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
	[numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	//[numberFormatter setAllowsFloats:NO];
	[numberFormatter setMaximumFractionDigits:0];
	NSNumber *price = [NSNumber numberWithDouble:M];
	
	//If you print next thing
	
	
	lblCalculatedValue.text = [NSString stringWithFormat:@"Estimated monthly payment: %@",[NSString stringWithFormat: @"%@",[numberFormatter stringForObjectValue:price]]];
	
}


-(IBAction)Contact:(id)sender
{
	[self actionSheetShow];	
}

-(IBAction)PreApproval:(id)sender
{

}

-(IBAction)Rates:(id)sender
{

}

- (void)actionSheetShow
{
	CGRect frame = CGRectMake(0, 0, 320, 230);
	UIImageView *imgBng = [[UIImageView alloc] initWithFrame:frame];
	[imgBng setImage:[UIImage imageNamed:@"background.png"]];
	[imgBng setAlpha:0.8];
	
	actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	UIButton *btnEmail = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 82, 75)];
	[btnEmail setImage:[UIImage imageNamed:@"icon_email.png"] forState:UIControlStateNormal];
	[btnEmail addTarget:self action:@selector(SendEmail) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentEmail.length > 0)
	{
		[btnEmail setEnabled:YES];
	}
	else
	{
		[btnEmail setEnabled:NO];
	}
	
	UIButton *btnText = [[UIButton alloc] initWithFrame:CGRectMake(120, 20, 82, 75)];
	[btnText setImage:[UIImage imageNamed:@"icon_text.png"] forState:UIControlStateNormal];
	[btnText addTarget:self action:@selector(SendText) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentContact.length > 0)
	{
		[btnText setEnabled:YES];
	}
	else
	{
		[btnText setEnabled:NO];
	}
	
	UIButton *btnCall = [[UIButton alloc] initWithFrame:CGRectMake(220, 20, 82, 75)];
	[btnCall setImage:[UIImage imageNamed:@"icon_call.png"] forState:UIControlStateNormal];
	[btnCall addTarget:self action:@selector(Call) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentContact.length > 0)
	{
		[btnCall setEnabled:YES];
	}
	else
	{
		[btnCall setEnabled:NO];
	}
	
	UIButton *btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(15, 140, 291, 43)];
	[btnCancel setImage:[UIImage imageNamed:@"btn_Cancel.png"] forState:UIControlStateNormal];
	[btnCancel addTarget:self action:@selector(CancelAction) forControlEvents:UIControlEventTouchUpInside];
	
	
	[actionSheet addSubview:imgBng];
	[actionSheet addSubview:btnEmail];
	[actionSheet addSubview:btnText];
	[actionSheet addSubview:btnCall];
	[actionSheet addSubview:btnCancel];
	[actionSheet showFromTabBar:appDelegate.tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 420)];
	
	[imgBng release];
	[btnEmail release];
	[btnText release];
	[btnCall release];
	[btnCancel release];
	
}

- (void)SendEmail
{
	[self CancelAction];
	NSString *to;
	
	if(agentData.agentEmail_var.length > 0)
	{
		to = agentData.agentEmail_var;
	}
	else 
	{
		to = @"nshukla@mtgr8.com";
	}


		

	NSString *subject;
	NSString *body;
	
	subject = @"pocketListings";
	body = [NSString stringWithFormat:@"<br/><br/>%@",[appDelegate getStandardEmailFooter]];
	
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:subject];
		NSArray *arrTo = [NSArray arrayWithObject:to];
		[composeVC setToRecipients:arrTo];
		[composeVC setMessageBody:body isHTML:YES];
		[self presentModalViewController:composeVC animated:YES];
		[composeVC release];
		[self dismissModalViewControllerAnimated:YES];
	}
	else{
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to e-mail. Please configure."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		[progressAlert show];
		[progressAlert release];
	}
}
- (void)SendText
{
	[self CancelAction];
	NSString *telString;
	
	if(agentData.agentPhone_var.length > 0)
	{
		telString = [NSString stringWithFormat:@"sms:%@",agentData.agentPhone_var];
	}
	else 
	{
		telString = [NSString stringWithFormat:@"sms:408-832-8904"];
	}
		

	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to SMS, Sim may not be inserted."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
	}
}
- (void)Call
{
	[self CancelAction];
	NSString *telString;

	if(agentData.agentPhone_var.length > 0)
	{
		telString = [NSString stringWithFormat:@"tel:%@",agentData.agentPhone_var];
	}
	else 
	{
		telString = [NSString stringWithFormat:@"tel:408-832-8904"];
	}
	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to Call, Sim may not be inserted."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
	}
	
}

- (void)CancelAction
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];	
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
//	NSString *message;
//	switch (result)
//	{
//		case MFMailComposeResultCancelled:
//			message = @"Result: canceled";
//			break;
//		case MFMailComposeResultSaved:
//			message = @"Result: saved";
//			break;
//		case MFMailComposeResultSent:
//			message = @"The email was queued in your outbox.";
//			break;
//		case MFMailComposeResultFailed:
//			message = @"Result: failed";
//			break;
//		default:
//			message = @"Result: not sent";
//			break;
//	}
	
	//	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"E-Mail" message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
	//	[alert show];
	//	[alert release];
	
	[self dismissModalViewControllerAnimated:YES];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 40;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrMortgage.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Configure the cell...
	//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(260, 5, 38, 32)];
	imgView.image = [UIImage imageNamed:@"Picture1_right.png"];
	[cell addSubview:imgView];
	[imgView release];
 	cell.textLabel.text = [arrMortgage objectAtIndex:indexPath.row];
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	
	
	return cell;
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *str = [arrMortgage objectAtIndex:indexPath.row];

	if([str isEqualToString:@"Mortgage Calculator"])
	{
		MortgageCalculator *objMortgageCalculator = [[MortgageCalculator alloc] initWithNibName:@"MortgageCalculator" bundle:nil];
		[self.navigationController pushViewController:objMortgageCalculator animated:YES];
		[objMortgageCalculator release];
	}
	else if([str isEqualToString:@"Request Pre-Approval"])
	{
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The mortgage broker may require more information such as SSN and Income/debt details to process the preapproval." message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
		[alertView show];
		[alertView release];
		
	}
	else if([str isEqualToString:@"Request Rates"])
	{
		NSString *to;
		
		if(agentData.agentEmail_var.length > 0)
		{
			to = agentData.agentEmail_var;
		}
		else 
		{
			to = @"nshukla@mtgr8.com";
		}
		
		NSString *subject;
		NSString *body;
		
		subject = @"Rate Request";
        body = [NSString stringWithFormat:@"%@<br/><br/>%@",@"Please send me rates for following scenario:<br/>Purchase Price:<br/>Down Payment: 20% (Default)<br/>Program:  30 Yr fixed, 5/1 ARM<br/>For further information please contact me @ [Contact Number] or reply to this email.<br/>Thanks ",[appDelegate getStandardEmailFooter]];
		
		//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
		
		if ([MFMailComposeViewController canSendMail])
		{
			MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
			composeVC.mailComposeDelegate = self;
			[composeVC setSubject:subject];
			NSArray *arrTo = [NSArray arrayWithObjects:to,appDelegate.agentEmail,nil];
			[composeVC setToRecipients:arrTo];
			[composeVC setMessageBody:body isHTML:YES];
			[self presentModalViewController:composeVC animated:YES];
			[composeVC release];
			[self dismissModalViewControllerAnimated:YES];
		}
		else{
			UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																	message: @"Could not find an application to e-mail. Please configure."
																   delegate: self
														  cancelButtonTitle: nil
														  otherButtonTitles: @"Ok",nil];
			[progressAlert show];
			[progressAlert release];
		}
		
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
	
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

	if(buttonIndex == 1)
	{
		NSString *to;
		
		if(agentData.agentEmail_var.length > 0)
		{
			to = agentData.agentEmail_var;
		}
		else 
		{
			to = @"nshukla@mtgr8.com";
		}
		
		NSString *subject;
		NSString *body;
		
		subject = @"Pre-Approval Request";
        body = [NSString stringWithFormat:@"%@<br/><br/>%@",@"I would like to get a pre-approval for following property:<br/>Property Address:<br/>Purchase Price:<br/>Down payment: 20% (Default)<br/>For further information please contact me @ [Contact Number] or reply to this email.<br/>Thanks",[appDelegate getStandardEmailFooter]];
		
		//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
		if ([MFMailComposeViewController canSendMail])
		{
			MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
			composeVC.mailComposeDelegate = self;
			[composeVC setSubject:subject];
			NSArray *arrTo = [NSArray arrayWithObjects:to,appDelegate.agentEmail,nil];
			[composeVC setToRecipients:arrTo];
			[composeVC setMessageBody:body isHTML:YES];
			[self presentModalViewController:composeVC animated:YES];
			[composeVC release];
			[self dismissModalViewControllerAnimated:YES];
		}
		else{
			UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																	message: @"Could not find an application to e-mail. Please configure."
																   delegate: self
														  cancelButtonTitle: nil
														  otherButtonTitles: @"Ok",nil];
			[progressAlert show];
			[progressAlert release];
		}
		
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	[self calculateAmount];
	return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect =
	[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
	[self.view.window convertRect:self.view.bounds fromView:self.view];
	CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
	midline - viewRect.origin.y
	- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
	(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
	* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
	
	if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
	
	UIInterfaceOrientation orientation =
	[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
	
	CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
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
    [super dealloc];
}


@end
