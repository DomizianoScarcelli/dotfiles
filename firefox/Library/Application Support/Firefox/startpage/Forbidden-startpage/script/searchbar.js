const searchbar = document.getElementById("searchbar")
searchbar.focus()
searchbar.addEventListener("keypress", (e) => {
    if (e.key == "Enter") {
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
