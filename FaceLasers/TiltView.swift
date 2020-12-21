// UpDown -> Neck


import UIKit

struct Tilt {
  var origin: CGPoint
  var focus: CGPoint
}

class TiltView: UIView {
  private var tilt = Tilt(origin: 0, focus: 0)
  
  func add(tilt: tilt) {
    tilt = tilt
  }
  
  func clear() {
    tilt = Tilt(origin: 0, focus: 0)
    DispatchQueue.main.async {
      self.setNeedsDisplay()
    }
  }
  
  //  implement the draw method
  override func draw(_ rect: CGRect) {
    
    // Get the current graphics context.
    guard let context = UIGraphicsGetCurrentContext() else {
      return
    }
        
      // Push the current graphics state onto the stack.
      context.saveGState()
 
      context.addLines(between: [tilt.origin, tilt.focus])
       
      // Draw a thicker white line in the direction of the laser.
      context.setStrokeColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
      context.setLineWidth(7.5)
      context.strokePath()
          
      // Then draw a slightly thinner red line over the white line to give it a cool laser effect.
      context.addLines(between: [laser.origin, laser.focus])
          
      context.setStrokeColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.8)
      context.setLineWidth(6.0)
      context.strokePath()
    
    // Pop the current graphics context off the stack to restore it to its original state.
    context.restoreGState()

  }
}