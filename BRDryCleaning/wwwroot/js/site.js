// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

//Listen for changes in the search bar entry 
function searchGrid() {
    var input, filter, searchGrid, a, i;

    input = document.getElementById("mySearch");

    //Make the search term uppercase 
    filter = input.value.toUpperCase();

    //Searching con grid 
    searchGrid = document.getElementById("searchableGrid");

    //Looking at the items in that grid
    searchableItems = searchGrid.getElementsByTagName("tr");
    console.log(searchableItems);

    for (i = 0; i < searchableItems.length; i++) {
        var searchMe = searchableItems[i].getElementsByTagName("td");

        console.log('searchMe');
        console.log(searchMe);
        console.log(filter);

        for (var c = 0; c < 1; c++) {
            console.log(searchMe[c]);
            if (searchMe[c].innerHTML.toUpperCase().indexOf(filter) > -1) {
                searchableItems[i].style.display = "";
            } else {
                searchableItems[i].style.display = "none";
            }            
        }
    }
}