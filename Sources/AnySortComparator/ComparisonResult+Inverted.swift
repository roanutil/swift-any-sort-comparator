// ComparisonResult+Inverted.swift
// AnySortComparator
//
//
// MIT License
//
// Copyright © 2023 Andrew Roan

import Foundation

extension ComparisonResult {
    public func inverted() -> Self {
        switch self {
        case .orderedSame:
            return self
        case .orderedAscending:
            return .orderedDescending
        case .orderedDescending:
            return .orderedAscending
        }
    }
}
