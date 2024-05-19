//
//  UIViewController+Extensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/19.
//

import UIKit

extension UIViewController {
    func presentLoadingView(show: Bool, message: String? = nil) {
        let loadingView = LoadingView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: view.bounds.width,
                                                      height: view.bounds.height))
        if show {
            loadingView.frame = view.bounds
            view.addSubview(loadingView)
            loadingView.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                loadingView.alpha = 0.7
            }

        } else {
            loadingView.removeFromSuperview()
        }
    }
}
