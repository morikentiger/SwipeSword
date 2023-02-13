//
//  ViewController.swift
//  SwipeSword
//
//  Created by 森田健太 on 2023/02/13.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    var swordView: UIView!
//    var swordLayer: CAShapeLayer!
//    var path = UIBezierPath()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        swordView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//        swordView.backgroundColor = .white
//        view.addSubview(swordView)
//
//        swordLayer = CAShapeLayer()
//        swordLayer.strokeColor = UIColor.red.cgColor
//        swordLayer.lineWidth = 36
//        swordLayer.fillColor = nil
//
////        swordLayer.lineDashPattern = [5, 5]
//
//
//        swordView.layer.addSublayer(swordLayer)
//
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
//        swordView.addGestureRecognizer(panGesture)
//    }
//
//    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
//        let point = gesture.location(in: swordView)
//        if gesture.state == .began {
//            path.move(to: point)
//        } else if gesture.state == .changed {
//            path.addLine(to: point)
//        }
//        swordLayer.path = path.cgPath
//    }
//}
//





import UIKit

class ViewController: UIViewController {

    var swordView: UIView!
    var swordLayer: CAShapeLayer!
    var path = UIBezierPath()
    var previousPoint: CGPoint = .zero

    override func viewDidLoad() {
        super.viewDidLoad()

        swordView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        swordView.backgroundColor = .white
        view.addSubview(swordView)

        swordLayer = CAShapeLayer()
        swordLayer.strokeColor = UIColor.red.cgColor
        swordLayer.fillColor = nil

        swordView.layer.addSublayer(swordLayer)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        swordView.addGestureRecognizer(panGesture)
    }

//    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
//        let point = gesture.location(in: swordView)
//        if gesture.state == .began {
//            path.move(to: point)
//            previousPoint = point
//        } else if gesture.state == .changed {
//            let distance = sqrt(pow(point.x - previousPoint.x, 2) + pow(point.y - previousPoint.y, 2))
//            swordLayer.lineWidth = 36 * (1 + 0.1 * distance)
//            path.addLine(to: point)
//            previousPoint = point
//        }
//        swordLayer.path = path.cgPath
//    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: swordView)
        if gesture.state == .began {
            path = UIBezierPath()
            path.move(to: point)
            previousPoint = point
            
            swordLayer = CAShapeLayer()
            swordLayer.strokeColor = UIColor.red.cgColor
            swordLayer.fillColor = nil
            swordView.layer.addSublayer(swordLayer)
        } else if gesture.state == .changed {
            let distance = sqrt(pow(point.x - previousPoint.x, 2) + pow(point.y - previousPoint.y, 2))
            swordLayer.lineWidth = 3 * (1 + 0.3 * distance)
            path.addLine(to: point)
            previousPoint = point
        }
        swordLayer.path = path.cgPath
    }

    
}
