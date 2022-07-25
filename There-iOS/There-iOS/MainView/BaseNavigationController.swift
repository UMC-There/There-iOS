//
//  BaseNavigationController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class BaseNavigationController: UINavigationController {

//    private var backButtonImage: UIImage? {
//        //edge에 -값을 주면 해당 edge 반대방향으로 이동
//        //edge에 +값을 주면 해당 edge 방향으로 이동
//        return UIImage(named: "button")?.withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -12.0, bottom: -5.0, right: 0.0))
//    }
//
//
//    private static let backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "button"), for: .normal)
//
//        return button
//    }()
//
//    private static let paddingBarButtonItem: UIBarButtonItem = {
//        let spaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        spaceBarButtonItem.width = 32.0 /// 32.0만큼 왼쪽 버튼과 여백
//        return spaceBarButtonItem
//    }()
//
//
//
//    private static let titleLabel: UILabel = {
//           let label = UILabel()
//           label.font = .systemFont(ofSize: 16.0, weight: .bold)
//           label.textColor = .white
//           label.textAlignment = .left
//
//           return label
//       }()
//
//
//    static func getCustomBarButtonItems(isShowBackButton: Bool, labelText: String) -> [UIBarButtonItem] {
//
//            var barButtonItems = [UIBarButtonItem]()
//
//            if isShowBackButton {
//                let backButtonItem = UIBarButtonItem(customView: backButton)
//                barButtonItems.append(backButtonItem)
//                barButtonItems.append(paddingBarButtonItem)
//            }
//            titleLabel.text = labelText
//            let labelBarButtonItem = UIBarButtonItem(customView: titleLabel)
//            barButtonItems.append(labelBarButtonItem)
//
//            return barButtonItems
//        }
//
//    private var backButtonAppearance: UIBarButtonItemAppearance {
//           let backButtonAppearance = UIBarButtonItemAppearance()
//           // backButton하단에 표출되는 text를 안보이게 설정
//           backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0.0)]
//
//           return backButtonAppearance
//       }
//
//
//
//    static func makeNavigationController(rootViewController: UITabBarController) -> BaseNavigationController {
//        let navigationController = BaseNavigationController(rootViewController: rootViewController)
//        navigationController.modalPresentationStyle = .fullScreen
//
//        return navigationController
//    }
//
//    private func setNavigationBarAppearance() {
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .white
//        appearance.shadowColor = .clear
//
//            /// transitionMaskImage파라미터: push되거나 pop될때의 backButton 마스크 이미지
//               appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
//               appearance.backButtonAppearance = backButtonAppearance
//
//               navigationBar.standardAppearance = appearance
//               navigationBar.compactAppearance = appearance
//               navigationBar.scrollEdgeAppearance = appearance
//               navigationBar.isTranslucent = false
//               /// navigationItem의 버튼 색상을 .white로 지정
//               navigationBar.tintColor = .white
//
//    }
//
                                                                 
    override func viewDidLoad() {
        super.viewDidLoad()

//        setNavigationBarAppearance()
    }
    
    
  
    

}
