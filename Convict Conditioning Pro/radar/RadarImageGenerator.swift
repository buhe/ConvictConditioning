//
//  RadarImageGenerator.swift
//  Convict Conditioning Pro
//
//  Created by AI Assistant on 2026/01/11.
//

import UIKit

class RadarImageGenerator {
    
    static func generateRadarImage(data: [Double], labels: [String], size: CGSize = CGSize(width: 400, height: 400)) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let radius = min(size.width, size.height) * 0.35
            let categories = data.count
            
            // 绘制背景
            UIColor.white.setFill()
            context.fill(rect)
            
            // 绘制网格
            drawRadarGrid(context: context, center: center, radius: radius, categories: categories)
            
            // 绘制数据
            drawRadarData(context: context, data: data, center: center, radius: radius)
            
            // 绘制标签
            drawLabels(context: context, labels: labels, center: center, radius: radius + 30)
        }
    }
    
    private static func drawRadarGrid(context: UIGraphicsImageRendererContext, center: CGPoint, radius: CGFloat, categories: Int) {
        let cgContext = context.cgContext
        
        // 设置网格样式
        cgContext.setStrokeColor(UIColor.lightGray.cgColor)
        cgContext.setLineWidth(0.5)
        
        // 绘制同心圆
        for i in 1...5 {
            let currentRadius = radius * CGFloat(i) / 5.0
            cgContext.addEllipse(in: CGRect(x: center.x - currentRadius, y: center.y - currentRadius, 
                                          width: currentRadius * 2, height: currentRadius * 2))
            cgContext.strokePath()
        }
        
        // 绘制射线
        for i in 0..<categories {
            let angle = CGFloat(i) * 2 * .pi / CGFloat(categories) - .pi / 2
            let endX = center.x + cos(angle) * radius
            let endY = center.y + sin(angle) * radius
            
            cgContext.move(to: center)
            cgContext.addLine(to: CGPoint(x: endX, y: endY))
            cgContext.strokePath()
        }
    }
    
    private static func drawRadarData(context: UIGraphicsImageRendererContext, data: [Double], center: CGPoint, radius: CGFloat) {
        let cgContext = context.cgContext
        guard data.count > 0 else { return }
        
        let maxValue: Double = 10.0
        let categories = data.count
        
        // 创建数据路径
        var pathPoints: [CGPoint] = []
        
        for (index, value) in data.enumerated() {
            let normalizedValue = min(value / maxValue, 1.0)
            let angle = CGFloat(index) * 2 * .pi / CGFloat(categories) - .pi / 2
            let distance = radius * CGFloat(normalizedValue)
            
            let x = center.x + cos(angle) * distance
            let y = center.y + sin(angle) * distance
            pathPoints.append(CGPoint(x: x, y: y))
        }
        
        // 绘制填充区域
        cgContext.setFillColor(UIColor.systemBlue.withAlphaComponent(0.3).cgColor)
        cgContext.beginPath()
        cgContext.move(to: pathPoints[0])
        for i in 1..<pathPoints.count {
            cgContext.addLine(to: pathPoints[i])
        }
        cgContext.closePath()
        cgContext.fillPath()
        
        // 绘制边框
        cgContext.setStrokeColor(UIColor.systemBlue.cgColor)
        cgContext.setLineWidth(2.0)
        cgContext.beginPath()
        cgContext.move(to: pathPoints[0])
        for i in 1..<pathPoints.count {
            cgContext.addLine(to: pathPoints[i])
        }
        cgContext.closePath()
        cgContext.strokePath()
    }
    
    private static func drawLabels(context: UIGraphicsImageRendererContext, labels: [String], center: CGPoint, radius: CGFloat) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.darkGray
        ]
        
        for (index, label) in labels.enumerated() {
            let angle = CGFloat(index) * 2 * .pi / CGFloat(labels.count) - .pi / 2
            let x = center.x + cos(angle) * radius
            let y = center.y + sin(angle) * radius
            
            let textSize = (label as NSString).size(withAttributes: attributes)
            let textRect = CGRect(x: x - textSize.width / 2, y: y - textSize.height / 2, 
                                width: textSize.width, height: textSize.height)
            
            label.draw(in: textRect, withAttributes: attributes)
        }
    }
}