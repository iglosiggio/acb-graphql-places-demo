%dw 2.0
import levenshteinDistance from dw::core::Strings
var expectedName = attributes.arguments.name
var expectedDistance = 3

type Place = {
    name: String,
    location: {
      latitude: Number,
      longitude: Number,
  },
  rating: Number
}

fun shouldInclude(place: Place): Boolean = levenshteinDistance(place.name, expectedName) <= expectedDistance
---
shouldInclude