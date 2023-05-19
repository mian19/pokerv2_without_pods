

import UIKit

class ProgressCircle: UIView {
    
    var foregroundCircleColor: UIColor = UIColor.red
    
    private lazy var fillColor: UIColor = UIColor.clear
    
    private var backgroundL: CAShapeLayer!
    private var progressL: CAShapeLayer!
    private var textLayer: CATextLayer!
    
    public var progress: CGFloat = 1 {
      didSet {
        didProgressUp()
      }
    }
    override func draw(_ rect: CGRect) {
      
      guard layer.sublayers == nil else {
        return
      }
      
        let lineWidth = 20.0
      
        backgroundL = createCircularLayer(strokeColor: UIColor(red: 0.3686, green: 0.4118, blue: 0.7451, alpha: 0.5).cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth)
      
      progressL = createCircularLayer(strokeColor: foregroundCircleColor.cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth)
      progressL.strokeEnd = progress
      
      let gradientL = CAGradientLayer()
      gradientL.startPoint = CGPoint(x: 1.0, y: 0.5)
      gradientL.endPoint = CGPoint(x: 0.0, y: 0.5)
      
      gradientL.colors = [UIColor(red: 0.5647, green: 0.5333, blue: 0.9725, alpha: 1.0).cgColor, UIColor(red: 0.3608, green: 0.2824, blue: 0.9922, alpha: 1.0).cgColor]
      gradientL.frame = self.bounds
      gradientL.mask = progressL
        
      layer.addSublayer(backgroundL)
      layer.addSublayer(gradientL)
        
    }
    
    private func createCircularLayer(strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
      
      let startAngle = -CGFloat.pi / 2
      let endAngle = 2 * CGFloat.pi + startAngle
      
      let width = frame.size.width
      let height = frame.size.height
      
      let center = CGPoint(x: width / 2, y: height / 2)
      let radius = (min(width, height) - lineWidth) / 2
      
      let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
      
      let shapeL = CAShapeLayer()
      
      shapeL.path = circularPath.cgPath
      
      shapeL.strokeColor = strokeColor
      shapeL.lineWidth = lineWidth
      shapeL.fillColor = fillColor
      shapeL.lineCap = .round
      
      return shapeL
    }
    
    private func didProgressUp() {
            self.progressL?.strokeEnd = self.progress

    }
  }
