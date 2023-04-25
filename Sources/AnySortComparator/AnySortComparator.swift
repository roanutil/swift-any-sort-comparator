// AnySortComparator.swift
// AnySortComparator
//
//
// MIT License
//
// Copyright © 2023 Andrew Roan

import Foundation

public struct AnySortComparator<Compared>: SortComparator {
    // MARK: Public properties

    public var order: SortOrder
    public var base: Any {
        hashableBase.base
    }

    // MARK: Public methods

    public func compare(_ lhs: Compared, _ rhs: Compared) -> ComparisonResult {
        let result = _compare(lhs, rhs)
        if order != initialOrder {
            return result.inverted()
        } else {
            return result
        }
    }

    public init<Erased>(_ base: Erased) where Erased: SortComparator, Erased.Compared == Self.Compared {
        _compare = base.compare(_:_:)
        initialOrder = base.order
        order = base.order
        hashableBase = AnyHashable(base)
    }

    // MARK: Private properties

    private let _compare: (Compared, Compared) -> ComparisonResult
    private let initialOrder: SortOrder

    fileprivate let hashableBase: AnyHashable
}

// MARK: Equatable

extension AnySortComparator: Equatable {
    public static func == (lhs: AnySortComparator<Compared>, rhs: AnySortComparator<Compared>) -> Bool {
        lhs.hashableBase == rhs.hashableBase
            && lhs.order == rhs.order
    }
}

// MARK: Hashable

extension AnySortComparator: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(hashableBase)
        hasher.combine(order)
    }
}
