document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addFavoritePlace = (e) => {
    e.preventDefault();

    const input = document.querySelector("favorite-input");
    const nameOfPlace = input.value;
    input.value = "";

    const li = document.createElement("li");
    li.textContent = nameOfPlace;

    const ul = document.getElementById("sf-places");
    ul.appendChild(li);
  };

  const listContainer = document.querySelector(".list-container");
  listContainer.addEventListener("submit", addFavoritePlace);

  // adding new photos

  // --- your code here!



});
