//
//  ModelViewContreller.swift
//  tiktok
//
//  Created by Rashit Osmonov on 15/2/22.
//

import Foundation
import UIKit
import SnapKit

class ModelViewContreller: UITableViewCell {
    
    private var layoutPhoto = UIView()
    
    var videoImage = UIImageView()
    
    private lazy var profile: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        return view
    }()
    private lazy var likes: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "heart"), for: .normal)
        return view
    }()
    private lazy var comments: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "message"), for: .normal)
        return view
    }()
    private lazy var share: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "arrowshape.turn.up.forward.fills"), for: .normal)
        return view
    }()
    
    override func layoutSubviews() {
        
        setViews()
    }
    
    private func setViews() {
        
        addSubview(layoutPhoto)
        layoutPhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutPhoto.addSubview(videoImage)
        videoImage.contentMode = .scaleAspectFill
        videoImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        layoutPhoto.addSubview(share)
        share.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalToSuperview().offset(-100)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutPhoto.addSubview(comments)
        comments.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(share.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutPhoto.addSubview(likes)
        likes.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(comments.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutPhoto.addSubview(profile)
        profile.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(likes.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        
    }
    func fill(model: TiktokViewControler) {
        videoImage.image = UIImage(named: model.image)
    }
    
}
