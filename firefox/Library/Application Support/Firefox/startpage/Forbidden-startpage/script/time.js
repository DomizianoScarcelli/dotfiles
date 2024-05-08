// Formats and Displays the current Day and Time
const displayDate = setInterval(() => {
    const date = new Date()
    const day = date.getDay()
    const dayOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    const today = dayOfWeek[day]

    document.getElementsByClassName("date")[0].innerHTML = today
    document.getElementsByClassName("time")[0].innerHTML = date.toLocaleTimeString([], {
        hour: 'numeric',
        minute: 'numeric'
    })
}, 1000)