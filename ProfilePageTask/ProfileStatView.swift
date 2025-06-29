//
//  ProfileStatView.swift
//  ProfilePageTask
//
//  Created by Vika on 29.06.25.
//

import UIKit

final class ProfileStatView: UIView {

    init(title: String, count: String) {
        super.init(frame: .zero)
        setup(title: title, count: count)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(title: String, count: String) {
        let countLabel = UILabel()
        countLabel.text = count
        countLabel.font = .boldSystemFont(ofSize: 16)
        countLabel.textAlignment = .center

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = .gray
        titleLabel.textAlignment = .left

        let stack = UIStackView(arrangedSubviews: [countLabel, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
