package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
)

type Tasks struct { //class
	ID          string `json:"id"`
	TaskName    string `json:"task_name"`
	TaskDetails string `json:"task_detail"`
	Date        string `json:"date"`
}

var tasks []Tasks

func allTasks() {
	task := Tasks{
		ID:          "1",
		TaskName:    "New Project",
		TaskDetails: "You must start the project",
		Date:        "2022-01-22",
	}
	tasks = append(tasks, task)
	task_1 := Tasks{
		ID:          "2",
		TaskName:    "New CV",
		TaskDetails: "You must start the the new CV",
		Date:        "2022-01-22",
	}
	tasks = append(tasks, task_1)
	fmt.Println("Your tasks are: ", tasks)
}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8082", router))

}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Home")
}
func getTasks(w http.ResponseWriter, r *http.Request) {
	// fmt.Println("Tasks")
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}
func getTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	fmt.Println(params["id"])
	taskId := mux.Vars(r)
	flag := false
	for i := 0; i < len(tasks); i++ {
		if taskId["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
	}

}
func createTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(1000))
	currentTime := time.Now().Format("01-02-2006")
	task.Date = currentTime
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(task)
	fmt.Println("Create")
}
func deleteTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	flag := false
	for index, item := range tasks {
		if item.ID == params["id"] {
			fmt.Println("This is the id: ", item.ID)
			tasks = append(tasks[:index], tasks[index+1:]...)
			json.NewEncoder(w).Encode(map[string]string{"status": "Success"})
			flag = true
			return
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
	}
}
func updateTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	flag := false
	for index, item := range tasks {
		if item.ID == params["id"] {
			fmt.Println("This is the id: ", item.ID)
			tasks = append(tasks[:index], tasks[index+1:]...)
			var task Tasks
			_ = json.NewDecoder(r.Body).Decode(&task)
			task.ID = params["id"]
			currentTime := time.Now().Format("01-02-2006")
			task.Date = currentTime
			tasks = append(tasks, task)
			flag = true
			json.NewEncoder(w).Encode(task)
			return
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
	}

}

func main() {
	allTasks()
	// fmt.Println("Hello world!")
	handleRoutes()
}
