Webcam.attach('#my_camera', function(){
  $('#my_camera').empty()
})

$('#shutter-button').on('click', function(){
  take_snapshot()
  removeShutter()
  addSubmit()
})

$('div.button').on('click', '#submit-button', function(e) {
  e.preventDefault()
})

$('div.button').on('click', '#reset-button', function(e) {
  e.preventDefault()
  location.reload()
})

function take_snapshot() {
    Webcam.snap( function(data_uri) {
        document.getElementById('my_camera').innerHTML = '<img src="'+data_uri+'"/>';
    } );
}

function removeShutter(){
  $('#shutter-button').remove()
}

function addSubmit(){
  $('div.container .button').append('<button class="btn btn-primary" id="submit-button">Submit Photo</button>')
  $('div.container .button').append('<button class="btn btn-primary" id="reset-button">Retake photo</button>')
}
