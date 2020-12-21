

import UIKit
import Vision

class FaceView: UIView {
  var leftEye: [CGPoint] = []
  var rightEye: [CGPoint] = []
  var leftEyebrow: [CGPoint] = []
  var rightEyebrow: [CGPoint] = []
  var nose: [CGPoint] = []
  var outerLips: [CGPoint] = []
  var innerLips: [CGPoint] = []
  var faceContour: [CGPoint] = []

  var boundingBox = CGRect.zero
  
  func clear() {
    leftEye = []
    rightEye = []
    leftEyebrow = []
    rightEyebrow = []
    nose = []
    outerLips = []
    innerLips = []
    faceContour = []
    
    boundingBox = .zero
    
    DispatchQueue.main.async {
      self.setNeedsDisplay()
    }
  }
  
  //5
  override func draw(_ rect: CGRect) {
    // get the current graphics context
    guard let context = UIGraphicsGetCurrentContext() else {
      return
    }
    // push the current graphics state onto the stack
    context.saveGState()
    // Restore the graphics state when this method exits.
    defer {
      context.restoreGState()
    }
    // Add a path describing the bounding box to the context.
    context.addRect(boundingBox)

    // use red color
    UIColor.red.setStroke()

    // draw path .addRect
    context.strokePath()

  }
}
