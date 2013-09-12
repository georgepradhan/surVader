function Modal(){
}

Modal.prototype = {
  showModal: function(form){
    console.log("in showModal method")
    $(form).easyModal({
      top: 400,
      autoOpen: true
    });

    // //optional load modal on click functionality
    // $(link).click(function(e){
    //   console.log("sign_in clicked")
    //   $(form).trigger('openModal');
    //   e.preventDefault();
    // });
  }
}


$(document).ready(function() {

 var modal = new Modal();
 jQuery.noConflict();
  modal.showModal($('#signup'));

});
