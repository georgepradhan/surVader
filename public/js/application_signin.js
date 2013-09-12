// ?? Can you console.log() anywhere?

// ?? What is this first function doing?
// ?? Is this a constructor function?

function Modal(){

}

// ?? Defining method for new Modal object?
Modal.prototype = {
  showModal: function(form, link){
    $(form).easyModal({
      top: 400,
    });

    // //optional load modal on click functionality
    // $(link).click(function(e){
    //   $(form).trigger('openModal');
    //   e.preventDefault();
    // });
  }
}


$(document).ready(function() {

 var modal = new Modal();
 jQuery.noConflict();
  modal.showModal($('#signup'), $('#sign_up_modal'));

});
