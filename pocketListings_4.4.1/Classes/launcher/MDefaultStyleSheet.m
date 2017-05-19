//
//  MDefaultStyleSheet.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MDefaultStyleSheet.h"
#import "MStyle.h"
#import "MShape.h"
#import "MTextStyle.h"
#import "MInsetStyle.h"
#import "MShapeStyle.h"
#import "MRoundedRectangleShape.h"
#import "MSolidFillStyle.h"
#import "MImageStyle.h"
#import "MSolidBorderStyle.h"
#import "MStyleSheet.h"
#import "MRectangleShape.h"
#import "MPartStyle.h"
#import "MBoxStyle.h"
#import "MBlendStyle.h"
#import "MShadowStyle.h"
#import "UIColorAdditions.h"
#import "MFourBorderStyle.h"
#import "MCorePreprocessorMacros.h"
#import "MGlobalNavigatorMetrics.h"
#import "MGlobalCore.h"



@implementation MDefaultStyleSheet


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)linkText:(UIControlState)state {
    if (state == UIControlStateHighlighted) {
        return
        [MInsetStyle styleWithInset:UIEdgeInsetsMake(-3, -4, -3, -4) next:
         [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:4.5] next:
          [MSolidFillStyle styleWithColor:[UIColor colorWithWhite:0.75 alpha:1] next:
           [MInsetStyle styleWithInset:UIEdgeInsetsMake(3, 4, 3, 4) next:
            [MTextStyle styleWithColor:self.linkTextColor next:nil]]]]];
        
    } else {
        return
        [MTextStyle styleWithColor:self.linkTextColor next:nil];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)linkHighlighted {
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:4.5] next:
     [MSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.25] next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)thumbView:(UIControlState)state {
    if (state & UIControlStateHighlighted) {
        return
        [MImageStyle styleWithImageURL:nil defaultImage:nil
                            contentMode:UIViewContentModeScaleAspectFill size:CGSizeZero next:
         [MSolidBorderStyle styleWithColor:RGBACOLOR(0,0,0,0.2) width:1 next:
          [MSolidFillStyle styleWithColor:RGBACOLOR(0,0,0,0.5) next:nil]]];
        
    } else {
        return
        [MImageStyle styleWithImageURL:nil defaultImage:nil
                            contentMode:UIViewContentModeScaleAspectFill size:CGSizeZero next:
         [MSolidBorderStyle styleWithColor:RGBACOLOR(0,0,0,0.2) width:1 next:nil]];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)toolbarButton:(UIControlState)state {
    return [self toolbarButtonForState:state
                                 shape:[MRoundedRectangleShape shapeWithRadius:4.5]
                             tintColor:[[MStyleSheet globalStyleSheet] toolbarTintColor]
                                  font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)toolbarBackButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:4.5]
                      tintColor:[[MStyleSheet globalStyleSheet] toolbarTintColor]
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)toolbarForwardButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:4.5]
                      tintColor:[[MStyleSheet globalStyleSheet] toolbarTintColor]
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)toolbarRoundButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:mRounded]
                      tintColor:[[MStyleSheet globalStyleSheet] toolbarTintColor]
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)blackToolbarButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:4.5]
                      tintColor:RGBCOLOR(10, 10, 10)
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)grayToolbarButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:4.5]
                      tintColor:RGBCOLOR(40, 40, 40)
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)blackToolbarForwardButton:(UIControlState)state {
//    return
//    [self toolbarButtonForState:state
//                          shape:[TTRoundedRightArrowShape shapeWithRadius:4.5]
//                      tintColor:RGBCOLOR(10, 10, 10)
//                           font:nil];
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)blackToolbarRoundButton:(UIControlState)state {
    return
    [self toolbarButtonForState:state
                          shape:[MRoundedRectangleShape shapeWithRadius:mRounded]
                      tintColor:RGBCOLOR(10, 10, 10)
                           font:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)searchTextField {
//    return
//    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
//     [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 0, 1, 0) next:
//      [MShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.4) blur:0 offset:CGSizeMake(0, 1) next:
//       [MSolidFillStyle styleWithColor:MStyleVAR(backgroundColor) next:
//        [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.4) blur:3 offset:CGSizeMake(0, 2) next:
//         [TTBevelBorderStyle styleWithHighlight:RGBACOLOR(0,0,0,0.25) shadow:RGBACOLOR(0,0,0,0.4)
//                                          width:1 lightSource:270 next:nil]]]]]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)searchBar {
//    UIColor* color = MStyleVAR(searchBarTintColor);
//    UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.2];
//    UIColor* shadowColor = [color multiplyHue:0 saturation:0 value:0.82];
//    return
//    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
//     [MFourBorderStyle styleWithTop:nil right:nil bottom:shadowColor left:nil width:1 next:nil]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)searchBarBottom {
//    UIColor* color = MStyleVAR(searchBarTintColor);
//    UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.2];
//    UIColor* shadowColor = [color multiplyHue:0 saturation:0 value:0.82];
//    return
//    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
//     [MFourBorderStyle styleWithTop:shadowColor right:nil bottom:nil left:nil width:1 next:nil]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)blackSearchBar {
//    UIColor* highlight = [UIColor colorWithWhite:1 alpha:0.05];
//    UIColor* mid = [UIColor colorWithWhite:0.4 alpha:0.6];
//    UIColor* shadowColor = [UIColor colorWithWhite:0 alpha:0.8];
//    return
//    [TTLinearGradientFillStyle styleWithColor1:mid color2:shadowColor next:
//     [MFourBorderStyle styleWithTop:nil right:nil bottom:shadowColor left:nil width:1 next:
//      [MFourBorderStyle styleWithTop:nil right:nil bottom:highlight left:nil width:1 next:nil]]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tableHeader {
//    UIColor* color = MStyleVAR(tableHeaderTintColor);
//    UIColor* highlight = [color multiplyHue:0 saturation:0 value:1.1];
//    return
//    [TTLinearGradientFillStyle styleWithColor1:highlight color2:color next:
//     [MInsetStyle styleWithInset:UIEdgeInsetsMake(-1, 0, 0, 0) next:
//      [MFourBorderStyle styleWithTop:nil right:nil bottom:RGBACOLOR(0,0,0,0.15)
//                                 left:nil width:1 next:nil]]];
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)pickerCell:(UIControlState)state {
//    if (state & UIControlStateSelected) {
//        return
//        [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
//          [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(79, 144, 255)
//                                              color2:RGBCOLOR(49, 90, 255) next:
//           [MFourBorderStyle styleWithTop:RGBCOLOR(53, 94, 255)
//                                     right:RGBCOLOR(53, 94, 255) bottom:RGBCOLOR(53, 94, 255)
//                                      left:RGBCOLOR(53, 94, 255) width:1 next:nil]]]];
//        
//    } else {
//        return
//        [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
//          [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(221, 231, 248)
//                                              color2:RGBACOLOR(188, 206, 241, 1) next:
//           [TTLinearGradientBorderStyle styleWithColor1:RGBCOLOR(161, 187, 283)
//                                                 color2:RGBCOLOR(118, 130, 214) width:1 next:nil]]]];
//    }
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)searchTableShadow {
//    return
//    [TTLinearGradientFillStyle styleWithColor1:RGBACOLOR(0, 0, 0, 0.18)
//                                        color2:[UIColor clearColor] next:
//     [MFourBorderStyle styleWithTop:RGBCOLOR(130, 130, 130) right:nil bottom:nil left:nil
//                               width: 1 next:nil]];
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)blackBezel {
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:10] next:
     [MSolidFillStyle styleWithColor:RGBACOLOR(0, 0, 0, 0.7) next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)whiteBezel {
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:10] next:
     [MSolidFillStyle styleWithColor:RGBCOLOR(255, 255, 255) next:
      [MSolidBorderStyle styleWithColor:RGBCOLOR(178, 178, 178) width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)blackBanner {
//    return
//    [MSolidFillStyle styleWithColor:RGBACOLOR(0, 0, 0, 0.5) next:
//     [MFourBorderStyle styleWithTop:RGBCOLOR(0, 0, 0) right:nil bottom:nil left: nil width:1 next:
//      [MFourBorderStyle styleWithTop:[UIColor colorWithWhite:1 alpha:0.2] right:nil bottom:nil
//                                 left: nil width:1 next:nil]]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)badgeWithFontSize:(CGFloat)fontSize {
//    return
//    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
//     [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
//      [MShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.8) blur:3 offset:CGSizeMake(0, 4) next:
//       [TTReflectiveFillStyle styleWithColor:RGBCOLOR(221, 17, 27) next:
//        [MInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
//         [MSolidBorderStyle styleWithColor:[UIColor whiteColor] width:2 next:
//          [MBoxStyle styleWithPadding:UIEdgeInsetsMake(1, 7, 2, 7) next:
//           [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:fontSize]
//                                color:[UIColor whiteColor] next:nil]]]]]]]];
//}
//

///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)miniBadge {
    return [self badgeWithFontSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)badge {
    return [self badgeWithFontSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)largeBadge {
    return [self badgeWithFontSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tabBar {
//    UIColor* border = [MStyleVAR(tabBarTintColor) multiplyHue:0 saturation:0 value:0.7];
//    return
//    [MSolidFillStyle styleWithColor:MStyleVAR(tabBarTintColor) next:
//     [MFourBorderStyle styleWithTop:nil right:nil bottom:border left:nil width:1 next:nil]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tabStrip {
//    UIColor* border = [MStyleVAR(tabTintColor) multiplyHue:0 saturation:0 value:0.4];
//    return
//    [TTReflectiveFillStyle styleWithColor:MStyleVAR(tabTintColor) next:
//     [MFourBorderStyle styleWithTop:nil right:nil bottom:border left:nil width:1 next:nil]];
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGrid {
    UIColor* color = [[MStyleSheet globalStyleSheet] tabTintColor];
    UIColor* lighter = [color multiplyHue:1 saturation:0.9 value:1.1];
    
    UIColor* highlight = RGBACOLOR(255, 255, 255, 0.7);
    UIColor* shadowColor = [color multiplyHue:1 saturation:1.1 value:0.86];
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:8] next:
     [MInsetStyle styleWithInset:UIEdgeInsetsMake(0,-1,-1,-2) next:
//      [MShadowStyle styleWithColor:highlight blur:1 offset:CGSizeMake(0, 1) next:
//       [TTLinearGradientFillStyle styleWithColor1:lighter color2:color next:
        [MSolidBorderStyle styleWithColor:shadowColor width:1 next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabImage:(UIControlState)state {
    return
    [MImageStyle styleWithImageURL:nil defaultImage:nil contentMode:UIViewContentModeLeft
                               size:CGSizeZero next:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTab:(UIControlState)state corner:(short)corner {
    MShape* shape = nil;
    if (corner == 1) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:8 topRight:0 bottomRight:0 bottomLeft:0];
        
    } else if (corner == 2) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:0 topRight:8 bottomRight:0 bottomLeft:0];
        
    } else if (corner == 3) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:0 topRight:0 bottomRight:8 bottomLeft:0];
        
    } else if (corner == 4) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:0 topRight:0 bottomRight:0 bottomLeft:8];
        
    } else if (corner == 5) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:8 topRight:0 bottomRight:0 bottomLeft:8];
        
    } else if (corner == 6) {
        shape = [MRoundedRectangleShape shapeWithTopLeft:0 topRight:8 bottomRight:8 bottomLeft:0];
        
    } else {
        shape = [MRectangleShape shape];
    }
    
    UIColor* highlight = RGBACOLOR(255, 255, 255, 0.7);
    UIColor* shadowColor =[[[MStyleSheet globalStyleSheet] tabTintColor] multiplyHue:1 saturation:1.1 value:0.88];
    
    if (state == UIControlStateSelected) {
        return
        [MShapeStyle styleWithShape:shape next:
         [MSolidFillStyle styleWithColor:RGBCOLOR(150, 168, 191) next:
//          [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.6) blur:3 offset:CGSizeMake(0, 0) next:
//           [MBoxStyle styleWithPadding:UIEdgeInsetsMake(11, 10, 9, 10) next:
//            [MPartStyle styleWithName:@"image" style:[self tabGridTabImage:state] next:
             [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:11]  color:RGBCOLOR(255, 255, 255)
                        minimumFontSize:8 shadowColor:RGBACOLOR(0,0,0,0.1) shadowOffset:CGSizeMake(-1,-1)
                                   next:nil]]];
        
    } else {
        return
        [MShapeStyle styleWithShape:shape next:
//         [TTBevelBorderStyle styleWithHighlight:highlight
//                                         shadow:shadowColor
//                                          width:1
//                                    lightSource:125 next:
//          [MBoxStyle styleWithPadding:UIEdgeInsetsMake(11, 10, 9, 10) next:
//           [MPartStyle styleWithName:@"image" style:[self tabGridTabImage:state] next:
            [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:11]  color:self.linkTextColor
                       minimumFontSize:8 shadowColor:[UIColor colorWithWhite:255 alpha:0.9]
                          shadowOffset:CGSizeMake(0, -1) next:nil]];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabTopLeft:(UIControlState)state {
    return [self tabGridTab:state corner:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabTopRight:(UIControlState)state {
    return [self tabGridTab:state corner:2];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabBottomRight:(UIControlState)state {
    return [self tabGridTab:state corner:3];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabBottomLeft:(UIControlState)state {
    return [self tabGridTab:state corner:4];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabLeft:(UIControlState)state {
    return [self tabGridTab:state corner:5];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabRight:(UIControlState)state {
    return [self tabGridTab:state corner:6];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabGridTabCenter:(UIControlState)state {
    return [self tabGridTab:state corner:0];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tab:(UIControlState)state {
//    if (state == UIControlStateSelected) {
//        UIColor* border = [MStyleVAR(tabBarTintColor) multiplyHue:0 saturation:0 value:0.7];
//        
//        return
//        [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithTopLeft:4.5 topRight:4.5
//                                                                   bottomRight:0 bottomLeft:0] next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(5, 1, 0, 1) next:
//          [TTReflectiveFillStyle styleWithColor:MStyleVAR(tabTintColor) next:
//           [MInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, 0, -1) next:
//            [MFourBorderStyle styleWithTop:border right:border bottom:nil left:border width:1 next:
//             [MBoxStyle styleWithPadding:UIEdgeInsetsMake(6, 12, 2, 12) next:
//              [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:14]  color:MStyleVAR(textColor)
//                         minimumFontSize:8 shadowColor:[UIColor colorWithWhite:1 alpha:0.8]
//                            shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]];
//        
//    } else {
//        return
//        [MInsetStyle styleWithInset:UIEdgeInsetsMake(5, 1, 1, 1) next:
//         [MBoxStyle styleWithPadding:UIEdgeInsetsMake(6, 12, 2, 12) next:
//          [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:14]  color:[UIColor whiteColor]
//                     minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.6]
//                        shadowOffset:CGSizeMake(0, -1) next:nil]]];
//    }
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tabRound:(UIControlState)state {
//    if (state == UIControlStateSelected) {
//        return
//        [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(9, 1, 8, 1) next:
//          [MShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.8) blur:0 offset:CGSizeMake(0, 1) next:
//           [TTReflectiveFillStyle styleWithColor:MStyleVAR(tabBarTintColor) next:
//            [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.3) blur:1 offset:CGSizeMake(1, 1) next:
//             [MInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
//              [MBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
//               [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:[UIColor whiteColor]
//                          minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.5]
//                             shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];
//        
//    } else {
//        return
//        [MBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
//         [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:self.linkTextColor
//                    minimumFontSize:8 shadowColor:[UIColor colorWithWhite:1 alpha:0.9]
//                       shadowOffset:CGSizeMake(0, -1) next:nil]];
//    }
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)tabOverflowLeft {
    UIImage* image = TTIMAGE(@"bundle://Three20.bundle/images/overflowLeft.png");
    MImageStyle *style = [MImageStyle styleWithImage:image next:nil];
    style.contentMode = UIViewContentModeCenter;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)tabOverflowRight {
//    UIImage* image = TTIMAGE(@"bundle://Three20.bundle/images/overflowRight.png");
//    MImageStyle *style = [MImageStyle styleWithImage:image next:nil];
//    style.contentMode = UIViewContentModeCenter;
//    return style;
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)rounded {
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:8] next:nil
//     [TTContentStyle styleWithNext:nil]
     ];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)postTextEditor {
    return
    [MInsetStyle styleWithInset:UIEdgeInsetsMake(6, 5, 6, 5) next:
     [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:15] next:
      [MSolidFillStyle styleWithColor:[UIColor whiteColor] next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)photoCaption {
    return
    [MSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.5] next:
     [MFourBorderStyle styleWithTop:RGBACOLOR(0, 0, 0, 0.5) width:1 next:
      [MBoxStyle styleWithPadding:UIEdgeInsetsMake(8, 8, 8, 8) next:
       [MTextStyle styleWithFont: [((id)[MStyleSheet globalStyleSheet]) photoCaptionFont]
                            color: [((id)[MStyleSheet globalStyleSheet]) photoCaptionTextColor]
                  minimumFontSize: 0
                      shadowColor: [((id)[MStyleSheet globalStyleSheet]) photoCaptionTextShadowColor]
                     shadowOffset: [((id)[MStyleSheet globalStyleSheet]) photoCaptionTextShadowOffset]
                    textAlignment: UITextAlignmentCenter
                verticalAlignment: UIControlContentVerticalAlignmentCenter
                    lineBreakMode: UILineBreakModeTailTruncation
                    numberOfLines: 6
                             next: nil]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)photoStatusLabel {
    return
    [MSolidFillStyle styleWithColor:[UIColor colorWithWhite:0 alpha:0.5] next:
     [MBoxStyle styleWithPadding:UIEdgeInsetsMake(20, 8, 20, 8) next:
      [MTextStyle styleWithFont:[[MStyleSheet globalStyleSheet] tableFont] color:RGBCOLOR(200, 200, 200)
                 minimumFontSize:0 shadowColor:[UIColor colorWithWhite:0 alpha:0.9]
                    shadowOffset:CGSizeMake(0, -1) next:nil]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)pageDot:(UIControlState)state {
    if (state == UIControlStateSelected) {
        return [self pageDotWithColor:[UIColor whiteColor]];
        
    } else {
        return [self pageDotWithColor:RGBCOLOR(77, 77, 77)];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)launcherButton:(UIControlState)state {
    return
    [MPartStyle styleWithName:@"image" style:[[MStyleSheet globalStyleSheet] styleWithSelector:@"launcherButtonImage:" forState:state] next:
     [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:11] color:RGBCOLOR(180, 180, 180)
                minimumFontSize:11 shadowColor:nil
                   shadowOffset:CGSizeZero next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)launcherButtonImage:(UIControlState)state {
    MStyle* style =
    [MBoxStyle styleWithMargin:UIEdgeInsetsMake(-7, 0, 11, 0) next:
     [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:8] next:
      [MImageStyle styleWithImageURL:nil defaultImage:nil contentMode:UIViewContentModeCenter
                                 size:CGSizeZero next:nil]]];
    
    if (state == UIControlStateHighlighted || state == UIControlStateSelected) {
        [style addStyle:
         [MBlendStyle styleWithBlend:kCGBlendModeSourceAtop next:
          [MSolidFillStyle styleWithColor:RGBACOLOR(0,0,0,0.5) next:nil]]];
    }
    
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)launcherCloseButtonImage:(UIControlState)state {
    return
    [MBoxStyle styleWithMargin:UIEdgeInsetsMake(-2, 0, 0, 0) next:
     [MImageStyle styleWithImageURL:nil defaultImage:nil contentMode:UIViewContentModeCenter
                                size:CGSizeMake(10,10) next:nil]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)launcherCloseButton:(UIControlState)state {
    return
    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:mRounded] next:
     [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 1, 1, 1) next:
      [MShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.5) blur:2 offset:CGSizeMake(0, 3) next:
       [MSolidFillStyle styleWithColor:[UIColor blackColor] next:
        [MInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
         [MSolidBorderStyle styleWithColor:[UIColor whiteColor] width:2 next:
          [MPartStyle styleWithName:@"image" style:[[MStyleSheet globalStyleSheet] styleWithSelector:@"launcherCloseButtonImage:"] next:
           nil]]]]]]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)launcherPageDot:(UIControlState)state {
    return [self pageDot:state];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)textBar {
//    return
//    [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(237, 239, 241)
//                                        color2:RGBCOLOR(206, 208, 212) next:
//     [MFourBorderStyle styleWithTop:RGBCOLOR(187, 189, 190)
//                               right:nil bottom:nil left:nil width:1 next:
//      [MFourBorderStyle styleWithTop:RGBCOLOR(255, 255, 255)
//                                right:nil bottom:nil left:nil width:1
//                                 next:nil]]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)textBarFooter {
//    return
//    [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(206, 208, 212)
//                                        color2:RGBCOLOR(184, 186, 190) next:
//     [MFourBorderStyle styleWithTop:RGBCOLOR(161, 161, 161)
//                               right:nil bottom:nil left:nil width:1 next:
//      [MFourBorderStyle styleWithTop:RGBCOLOR(230, 232, 235)
//                                right:nil bottom:nil left:nil width:1
//                                 next:nil]]];
//}
//

/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)textBarTextField {
//    return
//    [MInsetStyle styleWithInset:UIEdgeInsetsMake(6, 0, 3, 6) next:
//     [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:12.5] next:
//      [MInsetStyle styleWithInset:UIEdgeInsetsMake(1, 0, 1, 0) next:
//       [MShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.4) blur:0 offset:CGSizeMake(0, 1) next:
//        [MSolidFillStyle styleWithColor:MStyleVAR(backgroundColor) next:
//         [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.4) blur:3 offset:CGSizeMake(0, 2) next:
//          [TTBevelBorderStyle styleWithHighlight:RGBACOLOR(0,0,0,0.25) shadow:RGBACOLOR(0,0,0,0.4)
//                                           width:1 lightSource:270 next:nil]]]]]]];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)textBarPostButton:(UIControlState)state {
//    UIColor* fillColor = state == UIControlStateHighlighted
//    ? RGBCOLOR(19, 61, 126)
//    : RGBCOLOR(31, 100, 206);
//    UIColor* textColor = state == UIControlStateDisabled
//    ? RGBACOLOR(255, 255, 255, 0.5)
//    : RGBCOLOR(255, 255, 255);
//    return
//    [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:13] next:
//     [MInsetStyle styleWithInset:UIEdgeInsetsMake(2, 0, 1, 0) next:
//      [MShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.5) blur:0 offset:CGSizeMake(0, 1) next:
//       [TTReflectiveFillStyle styleWithColor:fillColor next:
//        [TTLinearGradientBorderStyle styleWithColor1:fillColor
//                                              color2:RGBCOLOR(14, 83, 187) width:1 next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
//          [MBoxStyle styleWithPadding:UIEdgeInsetsMake(8, 9, 8, 9) next:
//           [MTextStyle styleWithFont:[UIFont boldSystemFontOfSize:15]
//                                color:textColor shadowColor:[UIColor colorWithWhite:0 alpha:0.3]
//                         shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];
//}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public colors


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Common styles


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)textColor {
    return [UIColor blackColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)highlightedTextColor {
    return [UIColor whiteColor];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundTextColor {
	return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)font {
    return [UIFont systemFontOfSize:14];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundColor {
    return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)navigationBarTintColor {
    return RGBCOLOR(119, 140, 168);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarTintColor {
    return RGBCOLOR(109, 132, 162);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchBarTintColor {
    return RGBCOLOR(200, 200, 200);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Tables


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tablePlainBackgroundColor {
    return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tablePlainCellSeparatorColor {
	return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSeparatorStyle)tablePlainCellSeparatorStyle {
	return UITableViewCellSeparatorStyleSingleLine;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableGroupedBackgroundColor {
    return [UIColor groupTableViewBackgroundColor];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableGroupedCellSeparatorColor {
	return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSeparatorStyle)tableGroupedCellSeparatorStyle {
	return [self tablePlainCellSeparatorStyle];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableBackgroundColor {
    return RGBCOLOR(235, 235, 235);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableSeparatorColor {
    return [UIColor colorWithWhite:0.85 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Items


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)linkTextColor {
    return RGBCOLOR(87, 107, 149);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)timestampTextColor {
    return RGBCOLOR(36, 112, 216);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)moreLinkTextColor {
    return RGBCOLOR(36, 112, 216);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Headers


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTextColor {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderShadowColor {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)tableHeaderShadowOffset {
    return CGSizeMake(0, 1);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTintColor {
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Photo Captions


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextColor {
    return [UIColor whiteColor];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextShadowColor {
    return [UIColor colorWithWhite:0 alpha:0.9];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)photoCaptionTextShadowOffset {
    return CGSizeMake(0, 1);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Unsorted


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)screenBackgroundColor {
    return [UIColor colorWithWhite:0 alpha:0.8];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableActivityTextColor {
    return RGBCOLOR(99, 109, 125);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableErrorTextColor {
    return RGBCOLOR(96, 103, 111);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableSubTextColor {
    return RGBCOLOR(79, 89, 105);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableTitleTextColor {
    return RGBCOLOR(99, 109, 125);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tabBarTintColor {
    return RGBCOLOR(119, 140, 168);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tabTintColor {
    return RGBCOLOR(228, 230, 235);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)messageFieldTextColor {
    return [UIColor colorWithWhite:0.5 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)messageFieldSeparatorColor {
    return [UIColor colorWithWhite:0.7 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)thumbnailBackgroundColor {
    return [UIColor colorWithWhite:0.95 alpha:1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)postButtonColor {
    return RGBCOLOR(117, 144, 181);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public fonts


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)buttonFont {
    return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableFont {
    return [UIFont boldSystemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableSmallFont {
    return [UIFont boldSystemFontOfSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableTitleFont {
    return [UIFont boldSystemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableTimestampFont {
    return [UIFont systemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableButtonFont {
    return [UIFont boldSystemFontOfSize:13];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableSummaryFont {
    return [UIFont systemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableHeaderPlainFont {
    return [UIFont boldSystemFontOfSize:16];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableHeaderGroupedFont {
    return [UIFont boldSystemFontOfSize:18];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat) tableBannerViewHeight {
    return 22;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)photoCaptionFont {
    return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)messageFont {
    return [UIFont systemFontOfSize:15];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)errorTitleFont {
    return [UIFont boldSystemFontOfSize:18];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)errorSubtitleFont {
    return [UIFont boldSystemFontOfSize:12];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)activityLabelFont {
    return [UIFont systemFontOfSize:17];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)activityBannerFont {
    return [UIFont boldSystemFontOfSize:11];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCellSelectionStyle)tableSelectionStyle {
    return UITableViewCellSelectionStyleBlue;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// private


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarButtonColorWithTintColor:(UIColor*)color forState:(UIControlState)state {
    if (state & UIControlStateHighlighted || state & UIControlStateSelected) {
        if (color.value < 0.2) {
            return [color addHue:0 saturation:0 value:0.2];
            
        } else if (color.saturation > 0.3) {
            return [color multiplyHue:1 saturation:1 value:0.4];
            
        } else {
            return [color multiplyHue:1 saturation:2.3 value:0.64];
        }
        
    } else {
        if (color.saturation < 0.5) {
            return [color multiplyHue:1 saturation:1.6 value:0.97];
            
        } else {
            return [color multiplyHue:1 saturation:1.25 value:0.75];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarButtonTextColorForState:(UIControlState)state {
    if (state & UIControlStateDisabled) {
        return [UIColor colorWithWhite:1 alpha:0.4];
        
    } else {
        return [UIColor whiteColor];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)selectionFillStyle:(MStyle*)next {
//    return [TTLinearGradientFillStyle styleWithColor1:RGBCOLOR(5,140,245)
//                                               color2:RGBCOLOR(1,93,230) next:next];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MStyle*)toolbarButtonForState:(UIControlState)state shape:(TTShape*)shape
//                        tintColor:(UIColor*)tintColor font:(UIFont*)font {
//    UIColor* stateTintColor = [self toolbarButtonColorWithTintColor:tintColor forState:state];
//    UIColor* stateTextColor = [self toolbarButtonTextColorForState:state];
//    
//    return
//    [MShapeStyle styleWithShape:shape next:
//     [MInsetStyle styleWithInset:UIEdgeInsetsMake(2, 0, 1, 0) next:
//      [MShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.18) blur:0 offset:CGSizeMake(0, 1) next:
//       [TTReflectiveFillStyle styleWithColor:stateTintColor next:
//        [TTBevelBorderStyle styleWithHighlight:[stateTintColor multiplyHue:1 saturation:0.9 value:0.7]
//                                        shadow:[stateTintColor multiplyHue:1 saturation:0.5 value:0.6]
//                                         width:1 lightSource:270 next:
//         [MInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
//          [TTBevelBorderStyle styleWithHighlight:nil shadow:RGBACOLOR(0,0,0,0.15)
//                                           width:1 lightSource:270 next:
//           [MBoxStyle styleWithPadding:UIEdgeInsetsMake(8, 8, 8, 8) next:
//            [MImageStyle styleWithImageURL:nil defaultImage:nil
//                                contentMode:UIViewContentModeScaleToFill size:CGSizeZero next:
//             [MTextStyle styleWithFont:font
//                                  color:stateTextColor shadowColor:[UIColor colorWithWhite:0 alpha:0.4]
//                           shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]]]];
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)pageDotWithColor:(UIColor*)color {
    return
    [MBoxStyle styleWithMargin:UIEdgeInsetsMake(0,0,0,10) padding:UIEdgeInsetsMake(6,6,0,0) next:
     [MShapeStyle styleWithShape:[MRoundedRectangleShape shapeWithRadius:2.5] next:
      [MSolidFillStyle styleWithColor:color next:nil]]];
}


@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
//@implementation MDefaultStyleSheet 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIFont*)tableRefreshHeaderLastUpdatedFont {
//    return [UIFont systemFontOfSize:12.0f];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIFont*)tableRefreshHeaderStatusFont {
//    return [UIFont boldSystemFontOfSize:14.0f];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIColor*)tableRefreshHeaderBackgroundColor {
//    return RGBCOLOR(226, 231, 237);
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIColor*)tableRefreshHeaderTextColor {
//    return RGBCOLOR(109, 128, 153);
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIColor*)tableRefreshHeaderTextShadowColor {
//    return [[UIColor whiteColor] colorWithAlphaComponent:0.9];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (CGSize)tableRefreshHeaderTextShadowOffset {
//    return CGSizeMake(0.0f, 1.0f);
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIImage*)tableRefreshHeaderArrowImage {
//    return TTIMAGE(@"bundle://Three20.bundle/images/blueArrow.png");
//}
//
//
//@end
