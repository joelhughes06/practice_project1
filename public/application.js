$(document).ready(function() {

  // When any img tag with the class "avatar-option" is clicked, execute this code
  $('img.avatar-option').click(function() {
    // Find the form that contains the image and save it to $form variable.
    //
    // Note: some people use the $var convention when saving a jquery object to
    // a variable, then they always know if a variable contains a jquery object
    // or not
    var $form = $(this).closest('form');

    // Save the clicked image to a variable as a jquery object
    var $image = $(this)

    // Add a hidden field to the form with the name "avat", this will pass the
    // data in when the form is submitted.  Assign the value of the images src
    // attribute to that hidden field.
    $form.append($('<input type="hidden" name="avat" />').val($image.attr('src')));

    // Submit the form
    $form.get(0).submit();
  });

  $("input#alert_me").click(function() {
    alert("pop up alert here");
    return false;
  });
});