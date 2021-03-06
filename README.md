# AnySortComparator
[![CI](https://github.com/roanutil/swift-any-sort-comparator/actions/workflows/ci.yml/badge.svg)](https://github.com/roanutil/swift-any-sort-comparator/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/roanutil/swift-any-sort-comparator/branch/main/graph/badge.svg?token=Kd8r0wlmvK)](https://codecov.io/gh/roanutil/swift-any-sort-comparator)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Froanutil%2Fswift-any-sort-comparator%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/roanutil/swift-any-sort-comparator)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Froanutil%2Fswift-any-sort-comparator%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/roanutil/swift-any-sort-comparator)

`AnySortComparator` is a type erased implementation of the [SortComparator](https://developer.apple.com/documentation/foundation/sortcomparator) `protocol`. 

## The Problem
`SortComparator` has an `associatedType` and therefore cannot be used as a first class type. 

For example, it is not valid to create an array of `SortComparator`s:
```swift
let comparators: [SortComparator] // Not Valid!
```

Considering that the `Sequence` protocol offers a [method for sorting](https://developer.apple.com/documentation/swift/sequence/3802502-sorted) with a `Sequence` of `SortComparator`s, it would be nice to shake the constraint of only one concrete implementation of `SortComparator`.

## The Solution
`AnySortComparator` preserves the behavior of the original compare function while still allowing mutation of the order.

## Hashable

The `hashValue` of a given `AnySortComparator` is not equal to the `hashValue` of the 'base' comparator it holds. As expected, the `hashValue` of two `AnySortComparator`s will be equal if their 'base' comparators have equal `hashValue`s and their `order`s are the same. Or put another way:

```swift
AnySortComparator(KeyValueComparator(\Int.self)).hashValue != KeyValueComparator(\Int.self).hashValue

AnySortComparator(KeyValueComparator(\Int.self)).hashValue == AnySortComparator(KeyValueComparator(\Int.self)).hashValue
```