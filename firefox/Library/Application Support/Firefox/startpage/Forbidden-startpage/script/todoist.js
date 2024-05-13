import dotenv from "dotenv"
dotenv.config()

async function getActiveTasks() {
    const endpoint = "https://api.todoist.com/rest/v2/tasks"
    const response = await fetch(endpoint, {
        headers: {
            "Authorization": "Bearer " + process.env.TODOIST_TOKEN
        }
    })
    console.log(response)
}

getActiveTasks()


