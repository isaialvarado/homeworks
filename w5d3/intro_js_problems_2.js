// Phase I: Callbacks

function titleize(array, callback) {
  let titleized = array.map(el => {
    "Mx." + el + "Jingleheimer Schmidt";
  });
  callback(titleized);
}

titleize(["Mary", "Brian", "Leo"], names => {
  names.forEach(name => {
    console.log(name);
  });
});
