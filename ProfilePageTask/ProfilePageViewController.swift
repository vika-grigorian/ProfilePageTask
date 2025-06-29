//
//  ViewController.swift
//  ProfilePageTask
//
//  Created by Vika on 29.06.25.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "EmmaWatson"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Emma Watson"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        return button
    }()

    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "🌎🎥 Actress, producer, activist, humanitarian and UN Women Goodwill ambassador"
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()

    private let followersLabel = ProfileStatView(title: "Followers", count: "73M")
    private let followingLabel = ProfileStatView(title: "Following", count: "117")
    private let postsLabel = ProfileStatView(title: "Posts", count: "451")

    // MARK: - Tagged Posts Section

    private let taggedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tagged Posts"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let taggedStackView: UIStackView = {
        let imageNames = ["tagged1", "tagged2", "tagged3"]
        let images = imageNames.map { name -> UIImageView in
            let imageView = UIImageView(image: UIImage(named: name))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return imageView
        }

        let stack = UIStackView(arrangedSubviews: images)
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        return stack
    }()

    private let taggedStack = UIStackView()
    private let mainStackView = UIStackView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupNavigationBar()
    }
    
    // MARK: - setup NavigationBar
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add section",
            style: .plain,
            target: self,
            action: #selector(toggleTaggedPosts)
        )
    }
}

// MARK: - setup Layout & Actions

private extension ProfilePageViewController {
    private func setupLayout() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        let headerStack = UIStackView(arrangedSubviews: [profileImageView, nameLabel, followButton])
        headerStack.axis = .horizontal
        headerStack.spacing = 12
        headerStack.alignment = .center
        headerStack.distribution = .fill

        let statsStack = UIStackView(arrangedSubviews: [followersLabel, followingLabel, postsLabel])
        statsStack.axis = .horizontal
        statsStack.spacing = 16
        statsStack.distribution = .fillEqually

        taggedStack.axis = .vertical
        taggedStack.spacing = 8
        taggedStack.addArrangedSubview(taggedTitleLabel)
        taggedStack.addArrangedSubview(taggedStackView)
        taggedStack.isHidden = true
        
        mainStackView.addArrangedSubview(headerStack)
        mainStackView.addArrangedSubview(bioLabel)
        mainStackView.addArrangedSubview(statsStack)
        mainStackView.addArrangedSubview(taggedStack)

        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }

    @objc private func toggleTaggedPosts() {
        let isHidden = taggedStack.isHidden
        taggedStack.isHidden = !isHidden

        UIView.animate(withDuration: 0.3) {
            self.mainStackView.layoutIfNeeded()
        }
    }
}
