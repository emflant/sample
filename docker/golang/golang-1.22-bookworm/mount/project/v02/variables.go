package main

import "fmt"

var c, python, java bool

var i, j int = 1, 2
var k = 3

const (
	Big = 1 << 10
)

func main() {
	var c, python, java = true, false, "no!"
	fmt.Println(i, j, k, c, python, java)
	var i int
	fmt.Println(i)

	var x, y int = 3, 4
	fmt.Println(x, y)

	// fmt.Println(Big)
}
