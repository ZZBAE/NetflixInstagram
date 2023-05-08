//
//  UpcomingViewController.swift
//  Netflix+Instagram
//
//  Created by 변재은 on 2023/04/23.
//

import UIKit

import UIKit

class UpcomingViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true

        view.register(InstaStoryCell.self, forCellWithReuseIdentifier: InstaStoryCell.id)
        view.register(MyBadgeView.self, forSupplementaryViewOfKind: "MyBadgeView", withReuseIdentifier: "MyBadgeView")

        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()

    private var dataSource: [MySection] = [
        .main(
            [
                .init(text: "Story1"),
                .init(text: "Story2"),
                .init(text: "Story3"),
                .init(text: "Story4"),
                .init(text: "Story5"),
                .init(text: "Story6"),
                .init(text: "Story7"),
                .init(text: "Story8"),
                .init(text: "Story9"),
                .init(text: "Story10"),
                .init(text: "Story11"),
                .init(text: "Story12"),
            ]
        ),
        .sub(
            [
                .init(text: "Feed1"),
                .init(text: "Feed2"),
                .init(text: "Feed3"),
                .init(text: "Feed4"),
                .init(text: "Feed5"),
                .init(text: "Feed6"),
            ]
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])

        self.collectionView.dataSource = self
    }

    private func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            switch self.dataSource[sectionIndex] {
            case .main:
                return self.getGridSection()
            case .sub:
                return self.getListSection()
            }
        }
    }

    private func getGridSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(90),
                                              heightDimension: .absolute(90))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.15))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

    private func getListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionView.performBatchUpdates(nil, completion: nil)
    }
}

extension UpcomingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.dataSource[section] {
        case let .main(items):
            return items.count
        case let .sub(items):
            return items.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstaStoryCell.id, for: indexPath) as! InstaStoryCell
        switch self.dataSource[indexPath.section] {
        case let .main(items):
            cell.prepare(text: items[indexPath.item].text)
        case let .sub(items):
            cell.prepare(text: items[indexPath.item].text)
        }
        return cell
    }
}
