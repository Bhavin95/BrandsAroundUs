//
//  AppStyleColor.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/14/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit
public typealias APPFont = APPStyle.Font
public struct APPStyle {
    public struct Font {

        public static let headlineLargeH2Bold = UIFont(customFont: TTCommons.demiBold, size: 80)
        public static let headlineLargeH1Bold = UIFont(customFont: TTCommons.demiBold, size: 40)
                
        public static let headlineH1Bold = UIFont(customFont: TTCommons.demiBold, size: 36)
        public static let headlineH1Regular = UIFont(customFont: TTCommons.regular, size: 36)
        
        public static let headlineH2Bold = UIFont(customFont: TTCommons.demiBold, size: 32)
        public static let headlineH2Regular = UIFont(customFont: TTCommons.regular, size: 32)
        
        public static let headlineH3Bold = UIFont(customFont: TTCommons.demiBold, size: 28)
        public static let headlineH3Regular = UIFont(customFont: TTCommons.regular, size: 28)
       
        public static let headlineH4Bold = UIFont(customFont: TTCommons.demiBold, size: 20)
        public static let headlineH4Regular = UIFont(customFont: TTCommons.regular, size: 20)
        
        public static let headlineH5Bold = UIFont(customFont: TTCommons.demiBold, size: 21)
        
        public static let body4Bold = UIFont(customFont: TTCommons.demiBold, size: 24)
        
        public static let body3Bold = UIFont(customFont: TTCommons.demiBold, size: 18)
        public static let body3Regular = UIFont(customFont: TTCommons.regular, size: 18)
       
        public static let body2Bold = UIFont(customFont: TTCommons.demiBold, size: 16)
        public static let body2Regular = UIFont(customFont: TTCommons.regular, size: 16)
        
        public static let body1Bold = UIFont(customFont: TTCommons.demiBold, size: 14)
        public static let body1Regular = UIFont(customFont: TTCommons.regular, size: 14)
        public static let body1Medium = UIFont(customFont: TTCommons.medium, size: 14)
        
        public static let textLink1InActive = UIFont(customFont: TTCommons.demiBold, size: 14)
        public static let textLink2InActive = UIFont(customFont: TTCommons.demiBold, size: 12)
        
        public static let error1Regular = UIFont(customFont: TTCommons.regular, size: 14)
        public static let error2Regular = UIFont(customFont: TTCommons.regular, size: 12)
        
        public static let disclaimerBold = UIFont(customFont: TTCommons.demiBold, size: 12)
        public static let disclaimerRegular = UIFont(customFont: TTCommons.regular, size: 12)
        
        public static let extraLargeBold = UIFont(customFont: TTCommons.demiBold, size: 48)
        public static let extraLargeRegular = UIFont(customFont: TTCommons.regular, size: 48)

        public static let pingFangSCExtraLarge = UIFont(customFont: PingFangSC.medium, size: 48.0)
        public static let pingFangSCMedium = UIFont(customFont: PingFangSC.medium, size: 11.0)
        public static let pingFangSC = UIFont(customFont: PingFangSC.medium, size: 14.0)
        public static let pingFangSCMediumLarge = UIFont(customFont: PingFangSC.medium, size: 28.0)
        public static let pingFangSCLarge = UIFont(customFont: PingFangSC.medium, size: 20.0)
        public static let pingFangSCRegular = UIFont(customFont: PingFangSC.regular, size: 16.0)
        public static let pingFangSC1Regular = UIFont(customFont: PingFangSC.regular, size: 14.0)

    }
}

public enum TTCommons: String {
    case bold = "TTCommons-Bold"
    case demiBold = "TTCommons-DemiBold"
    case regular = "TTCommons-Regular"
    case medium = "TTCommons-Medium"
}

public enum PingFangSC: String {
    case medium = "PingFangSC-Medium"
    case regular = "PingFangSC-Regular"
}

private extension UIFont {
    convenience init?(customFont: TTCommons, size: CGFloat) {
        self.init(name: customFont.rawValue, size: size)
    }
    
    convenience init?(customFont: PingFangSC, size: CGFloat) {
        self.init(name: customFont.rawValue, size: size)
    }
}
