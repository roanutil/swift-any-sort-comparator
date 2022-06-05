// AnySortComparatorTests.swift
// AnySortComparator
//
//
// MIT License
//
// Copyright © 2022 Andrew Roan

import AnySortComparator
import XCTest

final class AnySortComparatorTests: XCTestCase {
    let unsortedData = [
        4,
        2,
        9,
        13,
        1,
        0,
        4,
        -8,
    ]

    func testMutateErasedOrder() throws {
        var comparator = KeyPathComparator(\Int.self)
        var erasedComparator = AnySortComparator(KeyPathComparator(\Int.self))

        let unsortedData = [
            4,
            2,
            9,
            13,
            1,
            0,
            4,
            -8,
        ]

        let sorted = unsortedData.sorted(using: comparator)
        let sortedByErased = unsortedData.sorted(using: erasedComparator)

        XCTAssertEqual(sorted, sortedByErased, "Both comparators should produce the same result")

        comparator.order = .reverse
        erasedComparator.order = .reverse

        let sortedReverse = unsortedData.sorted(using: comparator)
        let sortedReverseByErased = unsortedData.sorted(using: erasedComparator)

        XCTAssertEqual(
            sortedReverse,
            sortedReverseByErased,
            "Both comparators should produce the same result in reverse"
        )
        XCTAssertNotEqual(sorted, sortedReverse, "Forward and reverse sorting should not be equal")
        XCTAssertNotEqual(
            sortedByErased,
            sortedReverseByErased,
            "Forward and reverse sorting should not be equal for erased comparator"
        )
    }

    func testForwardVersusReverse() throws {
        let forward = AnySortComparator(KeyPathComparator(\Int.self, order: .forward))
        let reverse = AnySortComparator(KeyPathComparator(\Int.self, order: .reverse))

        let unsortedData = [
            4,
            2,
            9,
            13,
            1,
            0,
            4,
            -8,
        ]

        let sortedForward = unsortedData.sorted(using: forward)
        let sortedReverse = unsortedData.sorted(using: reverse)

        XCTAssertNotEqual(
            sortedForward,
            sortedReverse,
            "The resulting sorted data should not match for forward and reverse"
        )
        XCTAssertEqual(
            sortedForward,
            sortedReverse.reversed(),
            "The resulting sorted data should match when one is rerversed"
        )
    }
}
