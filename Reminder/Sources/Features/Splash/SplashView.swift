import Foundation
import UIKit

class SplashView: UIView {
  
  private let logoImageView: UIImageView = {
    let uIImageView = UIImageView()
    uIImageView.contentMode = .scaleAspectFit
    uIImageView.image = UIImage(named: "logo")
    uIImageView.translatesAutoresizingMaskIntoConstraints = false
    return uIImageView
  }()

  
  init() {
    super.init(frame: .zero)
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initialize() {
    addSubview(logoImageView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      
      logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.medium)
      
    ])
  }
}

