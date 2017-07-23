$(document).ready(function(){
  $("form").change(function() {
    $form = $(this);
    $input_value = $form.children("#min_confidence").val();
    $label = $form.children("#min_confidence").siblings("label");
    $label.text("Minimum confidence: " + $input_value);
  })

})
