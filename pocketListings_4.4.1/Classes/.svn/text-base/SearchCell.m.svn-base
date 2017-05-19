//
//  SearchCell.m
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/15/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import "SearchCell.h"
#import "AppUtils.h"
#import "Photo.h"
#import "AsyncImageView.h"
#import "OpenHouse.h"
#import "mTgr8-PropertyDetailViewController.h"

@implementation SearchCell

@synthesize cellObject;
@synthesize imageView;
@synthesize labelView;
@synthesize descView,statusView;
@synthesize busyIndicator;

- (id)initFromResource {
    if ((self = [super init])) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[SearchCell class]]){
				self =  (SearchCell *) currentObject;
				break;
			}
		}
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])) {
		cellObject = nil;
		imageView = nil;
		labelView = nil;
		descView = nil;
        statusView = nil;
		
		// create the elementTileView and the labelView
		// both of these will be laid out again by the layoutSubviews method
		UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadingimage.png"]];
		//imgView.amzItem = self.amzItem;
		self.imageView = imgView;
		[self.contentView addSubview:imgView];
		[imgView release];
        
        [self.busyIndicator startAnimating];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		// set the label view to have a clear background and a 20 point font
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:12];
		self.labelView = label;
		[self.contentView addSubview:label];
		[label release];
		
		UITextView *desc = [[UITextView alloc] initWithFrame:CGRectZero];
		desc.backgroundColor = [UIColor clearColor];
		desc.font = [UIFont systemFontOfSize:9];
		desc.editable=FALSE;
		self.descView.text = desc.text;
		[self.contentView addSubview:desc];
		[desc release];
		
		//[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


-(void)setCellObject:(id)aPropData{	
	Property* aPropertyData = (Property*)aPropData;
	
//	NSString* showAddressFlag = aPropertyData.streetNumber_var;
//	showAddressFlag = showAddressFlag!=nil?showAddressFlag:@"";
	
//	NSString* streetNumber = aPropertyData.streetNumber_var;
//	streetNumber = streetNumber!=nil?streetNumber:@"";
//	NSString* streetName = aPropertyData.streetName_var;
//	streetName = streetName!=nil?streetName:@"";
//	NSString* streetSuffix =  aPropertyData.streetSuffix_var;
//	streetSuffix = streetSuffix!=nil?streetSuffix:@"";
	
//	NSString* city  = aPropertyData.city_var;
//	city = city!=nil?city:@"";
//	NSString *stateOrProvince=aPropertyData.state_var;
//	stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
//	NSString *postalCode=aPropertyData.zip_var;
//	postalCode = postalCode!=nil?postalCode:@"";
	
	//NSString *addressStr = [NSString stringWithFormat:@"%@ %@ %@",streetNumber,streetName,streetSuffix];
	NSString *addressStr = aPropertyData.fullAddress_var;
	addressStr = addressStr!=nil?addressStr:@"";
	//NSString *addressStr2 = [NSString stringWithFormat:@"%@ %@ %@",city, stateOrProvince,postalCode];
	
    NSString* livingArea = (NSString*)aPropertyData.sqFt_var;
    livingArea = livingArea!=nil?livingArea:@"--";
	
	NSString* listPrice= aPropertyData.listPrice_var;
	listPrice = listPrice!=nil?listPrice:@"--";
	
	NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
	[numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	//[numberFormatter setAllowsFloats:NO];
	[numberFormatter setMaximumFractionDigits:0];
	NSNumber *price = [NSNumber numberWithInteger:[listPrice intValue]];
	
	//If you print next thing
	listPrice = [NSString stringWithFormat: @"%@",[numberFormatter stringForObjectValue:price]];
	
	
	
	
	
	NSString* bedrooms = aPropertyData.bedrooms_var;
	bedrooms = bedrooms!=nil?bedrooms:@"--";
	
	NSString* fullBathrooms = aPropertyData.fullBathrooms_var;
	fullBathrooms = fullBathrooms!=nil?fullBathrooms:@"--";
	
	NSString* halfBathrooms = aPropertyData.halfBathrooms_var;
	halfBathrooms = halfBathrooms!=nil?halfBathrooms:@"--";
	
	NSString* propertySubtype  = aPropertyData.exteriorFeatures_var;
	propertySubtype = propertySubtype!=nil?propertySubtype:@"--";
	
	NSMutableArray *arrImage = aPropertyData.photos_var.photo_var;//[[[NSMutableArray alloc]init]autorelease]; //leak 11/12
	//arrImage = aPropertyData.photos_var.photo_var; //leak
	
	Photo *objPhoto = [arrImage objectAtIndex:0]; //leak//[[Photo alloc]autorelease]; //leak 11/12
	//objPhoto = [arrImage objectAtIndex:0]; //leak
	NSString *strURL = objPhoto.url_var;
	//NSLog(@"%@",strURL);
	[self getImage:strURL];
	//[arrImage release]; //10/05
	//[objPhoto release]; //10/05

    NSString* description;//=[NSString stringWithFormat:@"$%@ %@\n%@ bd/ %@ ba/ %@ sq. ft.\n%@ Miles away",[AppUtils formatPrice:listPrice],propertySubtype,[AppUtils formatFloatStr:bedrooms],[AppUtils formatFloatStr:bathrooms],livingArea,[self calculateDistance:aPropertyData]];
		labelView.text = addressStr;
		description = [NSString stringWithFormat:@"%@\n%@ Bed/(%@F,%@H) Bath\n%@ sq.ft. %@",listPrice,[AppUtils formatFloatStr:bedrooms],fullBathrooms,halfBathrooms,livingArea,propertySubtype];
	
	descView.text = description;
    NSString *trimmedString = [aPropertyData.status_var stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([trimmedString rangeOfString:@"Active"].location == NSNotFound){
       [statusView setTextColor:[UIColor orangeColor]]; 
    }else{
       [statusView setTextColor:[UIColor greenColor]];  
    }
    statusView.text = aPropertyData.status_var;
    
    if(aPropertyData != nil && aPropertyData.openHouses_var != nil && [aPropertyData.openHouses_var.openHouse_var count] > 0){
        NSString* resStr = @"";
        
            OpenHouse* openHouse = [aPropertyData.openHouses_var.openHouse_var objectAtIndex:0];
            if( openHouse  != nil ){                
                resStr = [resStr stringByAppendingFormat:@"Open:%@",[mTgr8_PropertyDetailViewController formatOpenHouseShowTime:openHouse.startDateTime_var   endTime:openHouse.endDateTime_var]];                             
            }
        
        [openHouseLabel setText:resStr];
    }
    
    //[imageView setAlpha:0.0];
	//[self actualImageURLForListing:aPropertyData.listing.listingId];
}

-(void)getImage:(NSString *)imgURL
{
	[self.busyIndicator startAnimating];
	AsyncImageView* oldImage = (AsyncImageView*)
	[self.contentView viewWithTag:999];
	[oldImage removeFromSuperview];
	
	
	if(imgURL != nil)
	{
		//[imageView setImage:nil];
		CGRect frame;
		frame.size.width=85; frame.size.height=85;
		frame.origin.x=5; frame.origin.y=0;
		AsyncImageView* asyncImage = [[[AsyncImageView alloc]
									   initWithFrame:frame] autorelease];
		asyncImage.tag = 999;
		NSURL* url = [NSURL URLWithString:imgURL];//[imageDownload
		//				  thumbnailURLAtIndex:indexPath.row];
		[asyncImage loadImageFromURL:url];
		[self.contentView addSubview:asyncImage];
		
		//[self.busyIndicator stopAnimating];
	
		[imageView setImage:nil];
		
	}
	else {
		
		[imageView setImage:[UIImage imageNamed:@"imagenotavail.png"]];
		[self.contentView addSubview:imageView];
	}
	//[imageView setAlpha:1.0];
    //[self.busyIndicator stopAnimating];
	
}

-(void)actualImageForListing:(NSString*)listingID{
    [self.busyIndicator startAnimating];
	//[[AppUtils getAppDelegate] getImageData:listingID target:self callback:@selector(imageCallback:delegate:)];
}

-(void)actualImageURLForListing:(NSString*)listingID{
    [self.busyIndicator startAnimating];
	//[[AppUtils getAppDelegate] getThumbnailImageURL:listingID target:self callback:@selector(imageURLCallback:delegate:)];
}

-(void)imageCallback:(NSData*)imageData delegate:(id)delegate{
	if( imageData != nil && imageData.length>100){
		[imageView setImage:[UIImage imageWithData:imageData]]; 
	}else{
		[imageView setImage:[UIImage imageNamed:@"imagenotavail.png"]]; 
	}
	[imageView setAlpha:1.0];
    [self.busyIndicator stopAnimating];
}

-(void)imageURLCallback:(id)document delegate:(id)delegate{
	[document retain];
	
	[imageView setAlpha:1.0];
    [self.busyIndicator stopAnimating];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[cellObject release];
	[imageView release];
	[labelView release];
	[descView release];
    [busyIndicator release];
    [super dealloc];
}


@end
