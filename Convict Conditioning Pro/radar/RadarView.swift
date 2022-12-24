import SwiftUI

struct RadarChartGrid: Shape {
  let categories: Int
  let divisions: Int
  
  func path(in rect: CGRect) -> Path {
    let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
    let stride = radius / CGFloat(divisions)
    var path = Path()
    
    for category in 1 ... categories {
      path.move(to: CGPoint(x: rect.midX, y: rect.midY))
      path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius,
                               y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius))
    }
    
    for step in 1 ... divisions {
      let rad = CGFloat(step) * stride
      path.move(to: CGPoint(x: rect.midX + cos(-.pi / 2) * rad,
                            y: rect.midY + sin(-.pi / 2) * rad))
      
      for category in 1 ... categories {
        path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad,
                                 y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad))
      }
    }
    
    return path
  }
}

struct RadarChartPath: Shape {
  let data: [Double]
  
  func path(in rect: CGRect) -> Path {
    guard
      3 <= data.count,
      let minimum = data.min(),
      0 <= minimum,
      let maximum = data.max()
    else { return Path() }
    
    let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
    var path = Path()
    
    for (index, entry) in data.enumerated() {
      switch index {
        case 0:
          path.move(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))
          
        default:
          path.addLine(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                   y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))
      }
    }
    path.closeSubpath()
    return path
  }
}

struct RadarChart: View {
  var data: [Double]
  let gridColor: Color
  let dataColor: Color
  
  init(data: [Double], gridColor: Color = .gray, dataColor: Color = .blue) {
    self.data = data
    self.gridColor = gridColor
    self.dataColor = dataColor
  }
  
  var body: some View {
    ZStack {
      RadarChartGrid(categories: data.count, divisions: 10)
        .stroke(gridColor, lineWidth: 0.5)
      
      RadarChartPath(data: data)
        .fill(dataColor.opacity(0.3))
      
      RadarChartPath(data: data)
        .stroke(dataColor, lineWidth: 2.0)
    }
  }
}
