function getSign(item){
  return html = '<div class="signature"><p class="name">'+ item.name + '</p><p class="organization">' + item.org + '</p><p class = "aim">'+ item.why +'</p></div>';
}

// function populating the signatories container with the data from json. slice(0,5) allow to show the first five.

$( document ).ready(function() {
  $.getJSON( "/signatories.json", function( data ) {
    var items = data.items.slice(0,5).map(function (item) {
      var div = getSign(item);
      $(div).appendTo("#signatures");
    });
  });
});
