console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
  method: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  dataType: 'json',
  success: function(message) {
    console.log(message["weather"][0]["main"]);
  },
  error() {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
console.log("Hello from outside my AJAX request!");
