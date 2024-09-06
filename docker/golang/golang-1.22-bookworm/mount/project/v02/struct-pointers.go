package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

func main() {

	v := Vertex{1, 2}
	p := &v
	v2 := &v
	p.X = 1e9

	fmt.Println(v)

	fmt.Println(*v2)
}
