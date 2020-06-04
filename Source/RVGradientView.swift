//
//  RVGradientView.swift
//  FontDemo
//
//  Created by MOJAVE on 03/06/20.
//  Copyright © 2020 MOJAVE. All rights reserved.
//

import UIKit

public class RVGradientView: UIView {
    
    private var gradientLayer = CAGradientLayer()
    
    private var startPoint: CGPoint = CGPoint(x: 0, y: 0.5)
    private var endPoint: CGPoint = CGPoint(x: 1, y: 0.5)
    
    public var colors: [CGColor] = [] {
        didSet {
            self.gradientLayer.colors = colors
        }
    }
    public var angle: CGFloat = 0 {
        didSet {
            let (startPoint, endPoint) = calculatePoints(for: angle)
            self.startPoint = startPoint
            self.endPoint = endPoint
            if self.type == .axial {
                self.gradientLayer.startPoint = self.startPoint
                self.gradientLayer.endPoint = self.endPoint
            }
        }
    }
    public var type: CAGradientLayerType = .axial {
        didSet {
            switch type {
            case .axial:
                self.gradientLayer.type = .axial
                break
            case .radial:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.5, y: 1.5)
                self.gradientLayer.type = .radial
                break
            default:
                break
            }
        }
    }
        
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if self.gradientLayer.superlayer != nil {
            self.gradientLayer.removeFromSuperlayer()
        }
        self.gradientLayer = getGradientLayer()
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    func setup(colors: [CGColor], angle: CGFloat, type: CAGradientLayerType) {
        self.colors = colors
        self.angle = angle
        self.type = type
    }
    
    func getGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = self.colors
        switch self.type {
        case .axial:
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.type = .axial
            break
        case .radial:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.5, y: 1.5)
            gradientLayer.type = .radial
            break
        default:
            break
        }
        gradientLayer.frame = bounds
        return gradientLayer
    }

    
    private func calculatePoints(for angle: CGFloat) -> (CGPoint, CGPoint) {
        
        var startPoint: CGPoint = .zero
        var endPoint: CGPoint = .zero
        
        var ang = (-angle).truncatingRemainder(dividingBy: 360)
        
        if ang < 0 { ang = 360 + ang }
        
        let n: CGFloat = 0.5
        
        switch ang {
            
        case 0...45, 315...360:
            let a = CGPoint(x: 0, y: n * tanx(ang) + n)
            let b = CGPoint(x: 1, y: n * tanx(-ang) + n)
            startPoint = a
            endPoint = b
            
        case 45...135:
            let a = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            let b = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            startPoint = a
            endPoint = b
            
        case 135...225:
            let a = CGPoint(x: 1, y: n * tanx(-ang) + n)
            let b = CGPoint(x: 0, y: n * tanx(ang) + n)
            startPoint = a
            endPoint = b
            
        case 225...315:
            let a = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            let b = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            startPoint = a
            endPoint = b
            
        default:
            let a = CGPoint(x: 0, y: n)
            let b = CGPoint(x: 1, y: n)
            startPoint = a
            endPoint = b
            
        }
        return (startPoint, endPoint)
    }
    
    private func tanx(_ 𝜽: CGFloat) -> CGFloat {
        return tan(𝜽 * CGFloat.pi / 180)
    }
}

