//
//  ViewController.swift
//  tiktok
//
//  Created by Rashit Osmonov on 13/2/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private lazy var layoutScreen = UIView()
    
    private lazy var tiktokTablView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(ModelViewContreller.self, forCellReuseIdentifier: "ModelViewContreller")
        view.isPagingEnabled = true
        view.backgroundColor = .black
        return view
    }()
    private lazy var tiktokStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    private lazy var tiktokStack2: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var button1: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "house"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    private lazy var button2: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    private lazy var button3: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.app"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    private lazy var button4: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "message"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    private lazy var button5: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "person.fill"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    private lazy var subscriptions: UILabel = {
        let view = UILabel()
        view.text = "subscriptions"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    private lazy var recommendation: UILabel = {
        let view = UILabel()
        view.text = "recommendation"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    private lazy var button6: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "person.fill"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var videos: [TiktokViewControler] = [
        TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.30"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.49"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.30"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.45.04"), TiktokViewControler(image: "photo_2021-11-17 18.48.04"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.45.04"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.30"), TiktokViewControler(image: "image2"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.30"), TiktokViewControler(image: "Снимок экрана 2022-02-16 в 17.44.49"), TiktokViewControler(image: "image1"), TiktokViewControler(image: "photo_2021-11-17 18.48.04")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        tiktokTablView.reloadData()
        
        
        view.addSubview(tiktokTablView)
        tiktokTablView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
        
        
        view.addSubview(tiktokStack)
        tiktokStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalToSuperview()
        }
        
        view.addSubview(tiktokStack2)
        tiktokStack2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(view.frame.width / 9)
            make.width.equalToSuperview()
            tiktokStack2.addArrangedSubview(subscriptions)
            tiktokStack2.addArrangedSubview(recommendation)
            recommendation.snp.makeConstraints { make in
                make.left.equalTo(subscriptions.snp.right).offset(80)
            }
        }
        tiktokStack.addArrangedSubview(button1)
        tiktokStack.addArrangedSubview(button2)
        tiktokStack.addArrangedSubview(button3)
        tiktokStack.addArrangedSubview(button4)
        tiktokStack.addArrangedSubview(button5)
        
    }
    
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ModelViewContreller()
        let model = videos[indexPath.row]
        
        cell.fill(model: model)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height - 80
    }
    
    
    
}
