$( function() {
    

    $( "#add_user_email" ).autocomplete({
      source: function( request, response ) {
        $.ajax( {
          url: "/api/v1/users",
          dataType: "json",
          data: {
            email: request.term
          },
          success: function( data ) {
            response( data );
          }
        } );
      },
      minLength: 3,
      // select: function( event, ui ) {
      //   log( "Selected: " + ui.item.value + " aka " + ui.item.id );
      // }
    } );
  } );
