$(document).ready(function(){
  let image


  $('#shutter-button').on('click', function(){
    take_snapshot()
    removeShutter()
    addSubmit()
  })

  $('div.button').on('click', '#submit-button', function(e) {
    e.preventDefault()
    let url = $('#my_camera').attr('data-submit')
    let email = $('#email-webcam').val()
    if (email == '') {
      alert("Please enter your e-mail address in the field below the photo")
    } else {
      $.ajax({
        type: "POST",
        url: url,
        data: {image: image, email: email},
        success: function(data){

        }
      })
    }
  })

  $('div.button').on('click', '#reset-button', function(e) {
    e.preventDefault()
    location.reload()
  })

  function take_snapshot() {
    $('#my_camera').empty()
    Webcam.snap( function(data_uri) {
      image = data_uri
      $("#my_camera").css("overflow", `hidden`)
      $("#my_camera").css("background-image", `url(${data_uri}`)
    } );
  }

  function removeShutter(){
    $('#shutter-button').remove()
  }

  function addSubmit(){
    $('div.container .button').append('<button class="btn btn-success" id="submit-button">Submit Photo</button>')
    $('div.container .button').append('<button class="btn btn-danger" id="reset-button">Retake photo</button>')
  }
})
