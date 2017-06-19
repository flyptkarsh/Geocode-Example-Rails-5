$(window).load ->

    addNewRow = (data) ->
      latLng =  data.latitude + "," + data.longitude
      map = '<img src="https://maps.googleapis.com/maps/api/staticmap?center= '+ latLng + '&zoom=14&scale=1&size=200x200&maptype=roadmap&format=png&visual_refresh=true">'
      tableRow = "<tr><td>"  + map + "</td><td>" + data.name + "</td><<td>" + data.latitude + "</td><td>" + data.longitude + "</td></tr>"
      $("#locationsTable").prepend(  tableRow);
      $("#newPlace").val('')

    $('#submit').click ->
      newPlace = $("#newPlace").val()
      if newPlace.length == 0
        alert( "Nothing to look for, search for a place" )
      else
        $.post('/locations.json',
          location: {name: newPlace }
        ).done (data) ->
          addNewRow(data)
        .fail (data) ->
          alert( "Sorry, we cannot find "  + newPlace  )
