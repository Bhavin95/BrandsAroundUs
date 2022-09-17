//
//  BRANDSButton.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

@IBDesignable

public class BRANDSButton: UIButton {
    
    public struct Size {
        static public let small = "small"
        static public let big = "big"
        static public let fullBleed = "fullBleed"
    }
    
    public struct ButtonStyle {
        static public let primary = "primary"
        static public let secondary1 = "secondary1"
        static public let secondary2 = "secondary2"
    }
    
    @IBInspectable
    public var buttonSize: String = Size.small {
        didSet {
            if buttonSize != Size.fullBleed {
                applyCornerRadius()
            }
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable
    public var buttonStyle: String = ButtonStyle.primary {
        didSet {
            applyFont()
            applyBackgroundColor()
            // Increase Top inset By 5 to match VDs
            self.contentEdgeInsets = UIEdgeInsets(top: contentEdgeInsets.top + 5, left: contentEdgeInsets.left, bottom: contentEdgeInsets.bottom, right: contentEdgeInsets.right)
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let margin = 20.0
        let height: Double
        switch buttonSize {
        case Size.small:
            height = 40.0
        case Size.big:
            height = 56.0
        case Size.fullBleed:
            height = 72.0
        default:
            height = 0.0
        }
        return CGSize(width: margin + Double(size.width) + margin, height: height)
    }
    
    private func applyCornerRadius() {
        let height = intrinsicContentSize.height
        layer.cornerRadius = floor(height/2.0)
    }
    
    private func applyBorderWidth(_ color: UIColor) {
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }
    
    private func applyFont() {
        titleLabel?.font = APPStyle.Font.body3Bold
        switch buttonStyle {
        case BRANDSButton.ButtonStyle.primary:
            setTitleColor(APPStyle.Color.secondaryWhite, for: .normal)
        case BRANDSButton.ButtonStyle.secondary1:
            setTitleColor(APPStyle.Color.secondaryWhite, for: .normal)
        case BRANDSButton.ButtonStyle.secondary2:
            setTitleColor(APPStyle.Color.secondayDarkestGrey, for: .normal)
            
        default:
            fatalError("Please specify a style for the button")
        }
    }
    
    private func applyBackgroundColor() {
        switch buttonStyle {
        case BRANDSButton.ButtonStyle.primary:
            backgroundColor = APPStyle.Color.primaryPurple
        case BRANDSButton.ButtonStyle.secondary1:
            backgroundColor = APPStyle.Color.secondayDarkestGrey
            layer.borderWidth = 1.0
            layer.borderColor = APPStyle.Color.secondaryLightestGrey.cgColor
        case BRANDSButton.ButtonStyle.secondary2:
            backgroundColor = APPStyle.Color.secondaryWhite
        default:
            fatalError("Please specify a style for the button")
        }
    }
}
