$(window).load ->

    addNewRow = (data) ->
      tableRow = "<tr><td>" + data.name + "</td><<td>" + data.latitude + "</td><td>" + data.longitude + "</td></tr>"
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
