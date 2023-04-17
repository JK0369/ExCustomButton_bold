//
//  ViewController.swift
//  ExCustomButton
//
//  Created by 김종권 on 2023/04/17.
//

import UIKit

class ViewController: UIViewController {
    private let button: RoundableButton = {
        let button = RoundableButton()
        
        // title
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.7
        
        // image
        let image = UIImage(named: "blog")?.imageWith(newSize: .init(width: 30, height: 30))
        button.setImage(image, for: .normal)
        
        // inset
        let verticalSpace = 4.0
        let horizontalSpace = 12.0
        let interSpace = 3.0
        button.contentEdgeInsets = .init(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
        button.imageEdgeInsets = .init(top: 0, left: -interSpace, bottom: 0, right: interSpace)
        button.titleEdgeInsets = .init(top: 0, left: interSpace, bottom: 0, right: -interSpace)
        
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        // print(button.titleLabel?.font)
        // bold setting x
        // <UICTFont: 0x119f0ce90> font-family: ".SFUI-Regular"; font-weight: normal; font-style: normal; font-size: 18.00pt
        
        // bold setting o
        // <UICTFont: 0x105409610> font-family: ".SFUI-Semibold"; font-weight: normal; font-style: normal; font-size: 18.00pt
        
        button.imageView?.contentMode = .left
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // print(button.imageView?.frame)
        // bold setting off
        // (x, y, width, height)
        // (9.0, 4.0, 30.0, 30.0)
        
        // bold setting on
        // (16.0, 4.0, 31.0, 30.0)
        
        
        // print(button.titleLabel?.frame)
        // bold setting off
        // (45.0, 8.0, 32.0, 22.0)
        
        // bold setting on
        // (53.666666666666664, 8.0, 16.0, 22.0)
    }
}

extension UIImage {
    func imageWith(newSize: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        return image.withRenderingMode(renderingMode)
    }
}

final class RoundableButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}
