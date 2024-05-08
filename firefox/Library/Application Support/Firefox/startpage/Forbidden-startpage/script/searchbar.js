console.log("loaded searchbar.js")
const searchbar = document.getElementById("searchbar")
console.log(searchbar)
searchbar.addEventListener("keypress", (e) => {
    if (e.key == "Enter") {
        console.log("enter pressed")
        const query = searchbar.value
        if (query.endsWith("!s") || query.startsWith("!s")) {
            startPageSearch(query)
        }
        else {
            braveSearch(query)
        }
    }
})


function braveSearch(query) {
    const url = `https://search.brave.com/search?q=${query}`
    window.location.href = url
}
function startPageSearch(query) {
    const url = `https://www.startpage.com/do/metasearch.pl?query=${query}`
    window.location.href = url
}
