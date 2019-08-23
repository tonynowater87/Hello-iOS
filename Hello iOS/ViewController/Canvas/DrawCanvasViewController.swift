//
//  ViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class DrawCanvasViewController: UIViewController {

    private let centerPoint: CGPoint = CGPoint(x: 200.0, y: 200.0)
    private let centerPointTwo: CGPoint = CGPoint(x: 200.0, y: 400.0)
    private let lineLength = CGFloat(100)
    private let radius = CGFloat(50)
    private let squareLength = CGFloat(100)
    
    private let lineWidth = CGFloat(3)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.layer.backgroundColor = UIColor.white.cgColor
//        drawCircle()
//        drawSquare()
//        drawCrossLine()
//        drawUpperQuadCurve()
//        drawDownerQuadCurve()
        drawLoadingCircle()
        //playBackgroundAnimation()
    }
    
    private func drawCrossLine() {
        let path = UIBezierPath()
        var startPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: startPoint.x, y: startPoint.y + lineLength))
        
        startPoint = CGPoint(x: centerPoint.x - radius, y: centerPoint.y)
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: startPoint.x + lineLength, y: startPoint.y))
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        
        self.view.layer.addSublayer(layer)
    }
    
    private func drawCircle() {
        let path = UIBezierPath()
        path.addArc(withCenter: centerPoint, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.green.cgColor
        
        //strokeStart 是往畫筆開始的地方
        let drawClockwiseAnimation = CABasicAnimation(keyPath: "strokeStart")
        drawClockwiseAnimation.fromValue = 0.5
        drawClockwiseAnimation.toValue = 0
        drawClockwiseAnimation.duration = 3

        //strokeEnd 是往畫筆結束的地方
        let drawCounterClockwiseAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawCounterClockwiseAnimation.fromValue = 0.5
        drawCounterClockwiseAnimation.toValue = 1
        drawCounterClockwiseAnimation.duration = 3

        layer.add(drawClockwiseAnimation, forKey: "drawClockwiseAnimation")
        layer.add(drawCounterClockwiseAnimation, forKey: "drawCounterClockwiseAnimation")
        self.view.layer.addSublayer(layer)
    }
    
    private func drawSquare() {
        
        let startPoint = CGPoint(x: centerPoint.x - radius, y: centerPoint.y - radius)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: startPoint.x + squareLength, y: startPoint.y))
        path.addLine(to: CGPoint(x: startPoint.x + squareLength, y: startPoint.y + squareLength))
        path.addLine(to: CGPoint(x: startPoint.x, y: startPoint.y + squareLength))
        path.addLine(to: startPoint)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.brown.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(layer)
    }
    
    private func drawUpperQuadCurve() {
        
        let startPoint = CGPoint(x: centerPoint.x - radius, y: centerPoint.y)
        let controlPoint1 = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        let endPoint = CGPoint(x: centerPoint.x + radius, y: centerPoint.y)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint1)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.darkGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeStart")
        drawAnimation.fromValue = 1
        drawAnimation.toValue = 0
        drawAnimation.duration = 3
        
        layer.add(drawAnimation, forKey: "drawDownerQuadCurve")
        
        self.view.layer.addSublayer(layer)
    }

    private func drawDownerQuadCurve() {
        
        let startPoint = CGPoint(x: centerPoint.x - radius, y: centerPoint.y)
        let controlPoint1 = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        let endPoint = CGPoint(x: centerPoint.x + radius, y: centerPoint.y)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint1)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.darkGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        drawAnimation.duration = 3
        
        layer.add(drawAnimation, forKey: "drawDownerQuadCurve")
        
        self.view.layer.addSublayer(layer)
    }

    
    private func drawLoadingCircle() {
        let path = UIBezierPath()
        path.addArc(withCenter: centerPointTwo, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)

        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth
        
        let animationGroup = CAAnimationGroup()

        //strokeStart 是往畫筆開始的地方
        let drawClockwiseAnimation = CAKeyframeAnimation(keyPath: "strokeStart")
        drawClockwiseAnimation.values = [0.0, 0.0, 0.8, 1]
        drawClockwiseAnimation.keyTimes = [0.0, 0.1, 0.9, 1]
        
        //strokeEnd 是往畫筆結束的地方
        let drawCounterClockwiseAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        drawCounterClockwiseAnimation.values = [0.0, 0.3, 0.9, 1]
        drawCounterClockwiseAnimation.keyTimes = [0.0, 0.1, 0.9, 1]
        
        animationGroup.animations = [drawClockwiseAnimation, drawCounterClockwiseAnimation]
        animationGroup.duration = 4
        animationGroup.repeatCount = .infinity
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        
        layer.add(animationGroup, forKey: "loading animation")
        self.view.layer.addSublayer(layer)
    }
    
    private func playBackgroundAnimation() {
        let backgroundAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        backgroundAnimation.values = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.brown.cgColor]
        backgroundAnimation.keyTimes = [0, 0.25, 0.5, 1]
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [backgroundAnimation]
        animGroup.duration = 4
        animGroup.repeatCount = .infinity
        
        self.view.layer.add(animGroup, forKey: "bg animation")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
