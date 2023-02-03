%dw 2.0
import mergeWith from dw::core::Objects
var data = {
  latitude: -34.666908010111236,
  longitude: -58.4828883737433
} mergeWith attributes.arguments.location
var radius_km = attributes.arguments.location.radius default 1

var nm_in_km = 1.852
var nm_in_arc = 1/60
var km_in_arc = nm_in_km / nm_in_arc
var radius = radius_km / km_in_arc
var squared_radius = radius * radius

type Place = {
    name: String,
    location: {
latitude: Number,
longitude: Number,
  },
  rating: Number
}

fun shouldInclude(place: Place): Boolean = do {
  var location = place.location
  var latitude_distance = (data.latitude - location.latitude)
  var longitude_distance = (data.longitude - location.longitude)
  var squared_distance = latitude_distance * latitude_distance + longitude_distance * longitude_distance
  ---
  squared_distance <= squared_radius
}
---
shouldInclude