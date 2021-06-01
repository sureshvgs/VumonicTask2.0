//
//  ViewController.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//

import UIKit

class ViewController: UIViewController {
    private let  button : UIButton = {
        let button = UIButton(frame: CGRect(x: 0,y:0,width: 200,height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self,action:#selector(didTabButton),
                         for:.touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    @objc func didTabButton()
    {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        tabBarVC.setViewControllers( [vc1, vc2, vc3, vc4, vc5], animated: false)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        let images = ["house","magnifyingglass","video.badge.plus","heart","person"]
        for x in 0..<images.count{
            items[x].image = UIImage(systemName: images[x])
        }
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
    }
}
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
}
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
    }
}
class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
    }
}
class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
    }
}
class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
    }
}


