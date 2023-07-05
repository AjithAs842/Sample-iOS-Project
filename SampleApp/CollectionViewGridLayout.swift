//
//  CollectionViewGridLayout.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import Foundation

import Foundation

import UIKit

@objc public protocol CollectionViewDelegateGridLayout: UICollectionViewDelegate {
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       rowSpacingForSection section: Int) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       columnSpacingForSection section: Int) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       insetForSection section: Int) -> UIEdgeInsets
}
public struct CollectionViewGridLayout {
    private init() { }
    public struct SectionLayoutAttributes {
        public let items: [UICollectionViewLayoutAttributes]
        public let header: UICollectionViewLayoutAttributes?
        public let footer: UICollectionViewLayoutAttributes?
        // swiftlint:disable:next line_length
        public init(items: [UICollectionViewLayoutAttributes], header: UICollectionViewLayoutAttributes?, footer: UICollectionViewLayoutAttributes?) {
            self.items = items
            self.header = header
            self.footer = footer
        }
    }
}
