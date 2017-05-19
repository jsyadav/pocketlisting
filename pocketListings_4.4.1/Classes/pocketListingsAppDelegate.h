#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import <MapKit/MapKit.h>


@class mTgr8SearchSettingObject,T_brandingData,SearchResultController,MapViewController;
@interface pocketListingsAppDelegate : NSObject <UIApplicationDelegate,UITabBarControllerDelegate,UIActionSheetDelegate,MFMailComposeViewControllerDelegate,CLLocationManagerDelegate> {
	
	UITabBarController *tabController;
	UINavigationController *navigationController;
	UINavigationController *newSearchNavController;
	UINavigationController *favoritesNavController;
	UINavigationController *myCriteriaNavController;
	UINavigationController *moreNavController;
    
    CLLocationCoordinate2D mLastCoordinate;
	CLLocationManager *locationManager;
	CLLocation* currentLocation;
	
    UIWindow *window;
	NSString* API_KEY;
	
    NSMutableArray *arrPropertyImg;
	
	mTgr8SearchSettingObject* settingsObj;
	
	UIAlertView *baseAlert;
	UIActionSheet *actionSheet;
	UIActionSheet *actionSheet2;
	
	NSMutableArray *arrFavStore;
	NSMutableArray *arrFavorite;
	NSMutableArray *arrHistory;
	BOOL isHistory;
	
	
	BOOL isSearchTab;
	
	NSString *agentContact;
	NSString *agentEmail;
	NSString *agentFirstName;
	NSString *agentLastName;
	NSString *agentOff;
	NSString *agentOffImage;
	NSString *agentFeedName;
	NSString *agentZip;
	
	NSString *listingID;
	NSString *listingAdd;
	
	NSString *totalProperties;
	NSString *searchURL;
	
	UIActivityIndicatorView *activityView;
	UIActivityIndicatorView *activityView2;
	BOOL isSecond;
	BOOL isDetail;
	BOOL isMSLSearch;
	BOOL isCurrentLocation;
	
	T_brandingData *agentData;
	
	NSData *imgData;
	NSData *offLogoData;
	
	BOOL isRangeSelector;
	BOOL isApply;
	BOOL isTimeOut;
	BOOL isSearchMap;
	BOOL isFavoriteMap;
    BOOL isAgtListing;
	BOOL isCityDone;
	
	NSMutableArray *arrListingData;
	
	NSUserDefaults *defaults;
	
	NSMutableArray *arrListingId;
	SearchResultController *cvCtrl;
	
	NSInteger callBack;
	NSInteger totalID;
	
	NSMutableArray *cityIDArray;
	NSMutableArray *cityNameArray;
	NSMutableArray *countyCodeArray;
	NSMutableArray *countyNameArray;
	NSMutableArray *stateCodeArray;
	NSMutableArray *stateNameArray;
	
	NSMutableString *invalidCity;
	
	NSTimer *callTimer;
	
	NSMutableString *strPartialMatch;
	
	BOOL isOnSearch;
	
	NSString *strWebViewURL;
	NSInteger currentDevOS;
	NSString *agentFacebookUrl;
	NSMutableString *listingStr;
	
	NSMutableArray *arrSearchResult;
	NSInteger offset;

	
	NSMutableDictionary* gotGeoCodings;
	
	NSMutableArray *arrCityStateData;
	
	NSMutableString *selectedCities;
//	NSMutableString *selectedStates;
	NSMutableString *selectedPropType;
	
	NSMutableArray *arrSelectedCtSt;
	NSMutableArray *arrPropertyType;
	NSMutableArray *arrSelectedPropType;
	NSMutableArray *arrMyPhoto;
    
    NSMutableArray *arrUpdateInOptions;
    NSString       *currentUpdateInOption; 
	
	NSString *userPhoneNo;
	
	BOOL isSkip;
	
	NSString *photoIndex;
    
    BOOL isRegionSearch;
    MKCoordinateRegion region;
    id  regCallbackTarget;
    SEL regCallback;
    
}

@property (nonatomic, retain) NSString *userPhoneNo;
@property (nonatomic, retain) mTgr8SearchSettingObject *settingsObj;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation* currentLocation;

@property (nonatomic,retain) NSMutableDictionary* gotGeoCodings;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain ) UINavigationController *navigationController;
@property (nonatomic, retain)UINavigationController *newSearchNavController;
@property (nonatomic, retain)UINavigationController *favoritesNavController;
@property (nonatomic, retain)UINavigationController *myCriteriaNavController;
@property (nonatomic, retain)UINavigationController *moreNavController;
@property (nonatomic, retain) UITabBarController *tabController;
@property (nonatomic,retain) NSString* API_KEY;

@property (nonatomic, retain) NSMutableArray *arrMyPhoto;
@property (nonatomic, retain) NSMutableArray *arrPropertyImg;
@property (nonatomic, retain) NSMutableArray *arrHistory;
@property (nonatomic, retain) NSMutableArray *arrFavorite;
@property (nonatomic, retain) NSMutableArray *arrFavStore;
@property (nonatomic, retain) NSMutableArray *arrListingData;

@property (nonatomic, retain) NSMutableArray *cityIDArray;
@property (nonatomic, retain) NSMutableArray *cityNameArray;
@property (nonatomic, retain) NSMutableArray *countyCodeArray;
@property (nonatomic, retain) NSMutableArray *countyNameArray;
@property (nonatomic, retain) NSMutableArray *stateCodeArray;
@property (nonatomic, retain) NSMutableArray *stateNameArray;
@property (nonatomic, retain) NSMutableArray *arrSearchResult;
@property (nonatomic, retain) NSMutableArray *arrCityStateData;
@property (nonatomic, retain) NSMutableArray *arrSelectedCtSt;
@property (nonatomic, retain) NSMutableArray *arrPropertyType;
@property (nonatomic, retain) NSMutableArray *arrSelectedPropType;

@property (nonatomic, retain) NSMutableArray *arrUpdateInOptions;
@property (nonatomic, retain) NSString       *currentUpdateInOption; 


@property (nonatomic, readwrite) BOOL isHistory;
@property (nonatomic, readwrite) BOOL isSearchTab;
@property (nonatomic, readwrite) BOOL isSkip;

@property (nonatomic,readwrite ) BOOL isRegionSearch;
@property (nonatomic,readwrite ) MKCoordinateRegion region;

@property (nonatomic, retain) NSString *agentContact;
@property (nonatomic, retain) NSString *agentEmail;
@property (nonatomic, retain) NSString *totalProperties;
@property (nonatomic, retain) NSString *agentFirstName;
@property (nonatomic, retain) NSString *listingID;
@property (nonatomic, retain) NSString *listingAdd;
@property (nonatomic, retain) NSString *agentOff;
@property (nonatomic, retain) NSString *agentLastName;
@property (nonatomic, retain) NSString *searchURL;
@property (nonatomic, retain) NSString *agentOffImage;
@property (nonatomic, retain) NSString *agentFeedName;
@property (nonatomic, retain) NSString *agentZip;
@property (nonatomic,retain) NSString* photoIndex;

@property (nonatomic, readwrite) BOOL isSecond;
@property (nonatomic, readwrite) BOOL isDetail;
@property (nonatomic, readwrite) BOOL isRangeSelector;
@property (nonatomic, readwrite) BOOL isMSLSearch;
@property (nonatomic, readwrite) BOOL isCurrentLocation;
@property (nonatomic, readwrite) BOOL isApply;
@property (nonatomic, readwrite) BOOL isAgtListing;
@property (nonatomic, readwrite) BOOL isTimeOut;
@property (nonatomic, readwrite) BOOL isSearchMap;
@property (nonatomic, readwrite) BOOL isFavoriteMap;
@property (nonatomic, readwrite) BOOL isCityDone;

@property (nonatomic, retain) T_brandingData *agentData;
@property (nonatomic, retain) NSData *imgData;
@property (nonatomic, retain) NSData *offLogoData;

@property (nonatomic, readwrite) NSInteger callBack;
@property (nonatomic, readwrite) NSInteger totalID;

@property (nonatomic, retain) NSMutableString *invalidCity;
@property (nonatomic, retain) NSMutableString *selectedCities;
//@property (nonatomic, retain) NSMutableString *selectedStates;
@property (nonatomic, retain) NSMutableString *selectedPropType;

@property(nonatomic, retain) NSTimer *callTimer;
@property(nonatomic, retain) UIActionSheet *actionSheet;

@property (nonatomic, retain) NSString *strWebViewURL;
@property (nonatomic, retain) NSString *agentFacebookUrl;
@property (nonatomic, readwrite) NSInteger currentDevOS;
@property(nonatomic, readwrite) NSInteger offset;

@property(nonatomic, retain) id regCallbackTarget;
@property(nonatomic) SEL regCallback;


//- (void) addTabbar;
-(void)propertiesFromServer;
- (NSString *)getCompleteSearchURLString;
- (NSString *)getFormattedPrice;
- (NSString *)getFormattedBed;
- (NSString *)getFormattedBath;
- (NSString *)getFormattedSqFt;
//- (NSString *)getFormattedState;

-(void)showActivityViewer;
-(void)showActivityViewer2;
- (void)performDismiss: (NSTimer *)timer;
- (void)performDismiss2: (NSTimer *)timer;
- (void)actionSheetDismiss;
- (void)actionSheetShow;
- (void)SendEmail;
- (void)SendText;
- (void)Call;
- (void)CancelAction;
- (void) storeHistory:(NSString*)url;
-(NSString*)getOpenhouseParam;
- (BOOL) connectedToNetwork;
-(void)userDataFromServer;
//- (void) setTabBar;
//- (void)initialActivityViewer;
- (void) detailActionsheetShow;
- (NSString *)favoriteDataPath;
//- (NSString *) cityName:(NSString *)cityID;
- (NSString *) countyName:(NSString *)countyCode;
//- (NSString *) cityID:(NSString *)cityName;
- (void)MLSFromServer:(NSString *)ListingId;
- (void)MLSCall:(NSString *)MLS;
- (void) startTimeOut;
- (void) callTimeOut;
- (void) invalidTimer;
- (NSString *) getSortingDirection;
- (NSString *) getSortingBy;
- (NSString *) stateName:(NSString *)stateCode;
-(void)favPropertiesFromServer:(NSString *)ListingId;
-(void) favPropertiesCallback:(id)document delegate:(id)delegate;
- (void) fetchFavPro;
-(void) MortUserDataFromServer;
-(void) MortUserDataCallback:(id)document delegate:(id)delegate;
- (void) MortUserDataFromLocal;
- (NSString *)getFormattedCity:(NSString *)CityName;
//- (NSString *)getHistorySearchURLString;
- (NSString *) formattedCity:(NSString *)city;
- (NSString *) getListingStatus;
- (NSString *) getSortingDirectionShow;
- (NSString *) getSortingByShow;
- (void) fetchCityState;
- (void) fetchPropertyType;
- (NSString *) getPropertyType;
-(NSString*) getUpdatedIn;
-(void) propertiesFromServer:(NSString*)searchParamsAsQuery ;


-(NSString *)getOnlyOpenhouseParam;
-(NSString*)getStreetString;
-(void)sendMail:(NSString*)subject to:(NSString*)to body:(NSString*)body;
-(NSString *)getStandardEmailFooter; 

-(void) schoolsFromServer:(NSString*)latitudeStr longitudeStr:(NSString*)longitudeStr target:(id)target targetFunction:(SEL)targetFunction;
-(void) agentPropsFromServer:(NSString*)searchQuery resultTarget:(id)target targetFunction:(SEL)function;

-(void) getCurrentLocationAndCallback:(id)dest callback:(SEL)callback;


@end

