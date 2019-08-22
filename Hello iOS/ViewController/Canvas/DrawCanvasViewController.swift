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
    private let lineLength = CGFloat(100)
    private let radius = CGFloat(50)
    private let squareLength = CGFloat(100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.layer.backgroundColor = UIColor.white.cgColor
        drawCircle()
        drawSquare()
        drawCrossLine()
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
        self.view.layer.addSublayer(layer)
    }
    
    private func drawSquare() {
        let path = UIBezierPath()
        let startPoint = CGPoint(x: centerPoint.x - radius, y: centerPoint.y - radius)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
