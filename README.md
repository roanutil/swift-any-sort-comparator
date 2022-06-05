# AnySortComparator

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