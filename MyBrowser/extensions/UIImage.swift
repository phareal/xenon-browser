//
// Created by POTCHONA Essosolam Justin on 25/04/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        let scaleFactor = min(widthRatio, heightRatio)

        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
                width: size.width * scaleFactor,
                height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
                size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                    origin: .zero,
                    size: scaledImageSize
            ))
        }

        return scaledImage
    }
}