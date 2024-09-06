package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

func main() {

	i := 42

	p := &i
	fmt.Println(p)

	fmt.Println(Vertex{1, 2})

	v := Vertex{1, 2}
	v.X = 5

	fmt.Println(v.X)

}
