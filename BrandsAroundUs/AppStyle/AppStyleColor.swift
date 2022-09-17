
//
//  AppStyleFont.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/14/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

extension APPStyle {
    public struct Color {
        public static let disabledWhiteColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        public static let blueColor = #colorLiteral(red: 0.07450980392, green: 0.462745098, blue: 1, alpha: 1)
        public static let navBarColor = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        public static let darkPurpleColor = #colorLiteral(red: 0.3450980392, green: 0.2509803922, blue: 0.4980392157, alpha: 1)
        public static let secondayDarkestGrey = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        public static let secondaryDarkGrey = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        public static let secondaryDarkGrey1 = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1).withAlphaComponent(0.48)
        public static let secondaryDarkGrey2 = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1).withAlphaComponent(0.01)
        public static let secondaryMediumGrey = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        public static let greyStyle1 = #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        public static let greyStyle2 = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        public static let greyStyle3 = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        public static let greyStyle4 = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        public static let secondaryLightGrey = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
        public static let fadedLightGrey = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        public static let secondaryLightMediumGrey = #colorLiteral(red: 0.5607843137, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        
        public static let secondaryLightestGrey = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        public static let secondaryRed = #colorLiteral(red: 0.968627451, green: 0.3725490196, blue: 0.3725490196, alpha: 1)
        public static let secondaryGreen = #colorLiteral(red: 0.06274509804, green: 0.6470588235, blue: 0.2274509804, alpha: 1)
        public static let secondaryGreen1 = #colorLiteral(red: 0.2941176471, green: 0.6549019608, blue: 0.6588235294, alpha: 1)
        public static let secondaryGreen2 = #colorLiteral(red: 0.4156862745, green: 0.8039215686, blue: 0.5254901961, alpha: 1)
        public static let secondaryMedium = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        public static let primaryPurple = #colorLiteral(red: 0.662745098, green: 0.5647058824, blue: 0.8156862745, alpha: 1)
        public static let secondaryWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let secondaryWhite1 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.2)
        public static let secondaryWhite2 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.48)
        public static let secondaryWhite3 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.08)
        public static let darkRed = #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 1)
        public static let greyishBrown = #colorLiteral(red: 0.3996260166, green: 0.39963606, blue: 0.3996306658, alpha: 1)
        public static let darkBlue = #colorLiteral(red: 0.08235294118, green: 0.2705882353, blue: 0.4392156863, alpha: 1)
        public static let lightBlue = #colorLiteral(red: 0.4078431373, green: 0.6, blue: 0.7725490196, alpha: 1)
        
        public static let tertiaryDarkGrey = #colorLiteral(red: 0.184, green: 0.184, blue: 0.184, alpha: 1)
        public static let goldBright = #colorLiteral(red: 0.7568627451, green: 0.6705882353, blue: 0.5019607843, alpha: 1)
        public static let goldDark = #colorLiteral(red: 0.5529411765, green: 0.4470588235, blue: 0.2862745098, alpha: 1)
        public static let primaryDarkGrey = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
        public static let graylight = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        public static let yellowBright = #colorLiteral(red: 0.9882352941, green: 0.8196078431, blue: 0.4666666667, alpha: 1)
        public static let primaryYellow = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        public static let thinWhiteColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.04)
        public static let blurEffectColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3490196078, alpha: 0.8002310739)
    }
}
