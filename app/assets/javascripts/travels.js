/* global Sortable*/
/* global $ */

$(function() {
  const el = document.getElementById("sortable_list");
  if (el != null) {
    console.log("1");
    const sortable = Sortable.create(el, {
       handle: "#bar",
       delay: 150,

       onUpdate: function (evt) {
        $.ajax({
          // positionの変更
          url: 'travel/' + $("#travel_id").val() + '/sort',
          type: 'PATCH',
          data: { from: evt.oldIndex, to: evt.newIndex }
        });
      }
     });
  }
});