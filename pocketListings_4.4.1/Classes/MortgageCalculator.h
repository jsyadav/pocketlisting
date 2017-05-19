//
//  MortgageCalculator.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 10/26/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MortgageCalculator : UIViewController {

	IBOutlet UITextField *txtHomePrice;
	IBOutlet UITextField *txtDownPayment;
	IBOutlet UITextField *txtLoanTerm;
	IBOutlet UITextField *txtInterestRate;
	
	IBOutlet UILabel *lblCalculatedValue;
}

- (void) calculateAmount;
@end
