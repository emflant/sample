package main

import "fmt"

func main() {

	defer fmt.Println("world")
	fmt.Println("hello")
	fmt.Println("1")
	fmt.Println("2")
}
