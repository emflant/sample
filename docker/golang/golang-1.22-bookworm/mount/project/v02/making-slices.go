package main

import "fmt"

func main() {

	a := make([]int, 5)
	printSlice("a", a)

	b := make([]int, 0, 5)
	printSlice("b", b)

	c := b[:2]
	printSlice("c", c)

	primes := [6]int{2, 3, 5, 7, 11, 13}
	fmt.Println(primes[:2])

	p2 := primes[:2]
	fmt.Println(p2[4:5])
	fmt.Println(primes[4:5])

	var s []int
	printSlice2(s)

	s = append(s, 0)
	printSlice2(s)
	s = append(s, 1)
	printSlice2(s)

	var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

	for i, v := range pow {
		fmt.Printf("2**%d = %d\n", i, v)
	}
}

func printSlice(s string, x []int) {
	fmt.Printf("%s len=%d cap=%d %v\n", s, len(x), cap(x), x)
}
func printSlice2(x []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(x), cap(x), x)
}
