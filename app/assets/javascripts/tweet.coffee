# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
getUrlParameter = (sParam) ->
  sPageURL = decodeURIComponent(window.location.search.substring(1))
  sURLVariables = sPageURL.split('&')
  sParameterName = undefined
  i = undefined
  i = 0
  while i < sURLVariables.length
    sParameterName = sURLVariables[i].split('=')
    if sParameterName[0] == sParam
      return if sParameterName[1] == undefined then true else sParameterName[1]
    i++
  return

window.getMarker = (coords, name) ->
  bounds = new (google.maps.LatLngBounds)
  i = 0
  if Array.isArray coords[0]
    while i < coords.length
      j = 0
      while j < coords[i].length
        bounds.extend coords[i][j]
        j++
      i++
  else
    while i < coords.length
      bounds.extend coords[i]
      i++
  infowindow = new (google.maps.InfoWindow)(content: name)
  marker = new (google.maps.Marker)(
    position: bounds.getCenter())
  marker.addListener 'click', ->
    infowindow.open marker.getMap(), marker
    return
  div = document.createElement('button')
  div.className = 'btnTweet'
  div.onclick = ->
    marker.getMap().setCenter new (google.maps.LatLng)(marker.getPosition().lat(), marker.getPosition().lng())
    return
  div.innerHTML = name
  document.getElementById('side').appendChild div
  marker

window.getUrlParameter = (sParam) ->
  sPageURL = decodeURIComponent(window.location.search.substring(1))
  sURLVariables = sPageURL.split('&')
  sParameterName = undefined
  i = undefined
  i = 0
  while i < sURLVariables.length
    sParameterName = sURLVariables[i].split('=')
    if sParameterName[0] == sParam
      return if sParameterName[1] == undefined then true else sParameterName[1]
    i++
  return
