package main

import "fmt"

func main() {

	var a [2]string
	a[0] = "Hello"
	a[1] = "World"

	fmt.Println(a[0], a[1])
	fmt.Println(a)

	primes := [6]int{2, 3, 5, 7, 11, 13}
	fmt.Println(primes)
	fmt.Println(primes[0:4])

	names := [4]string{
		"John", "Paul", "George", "Ringo",
	}

	fmt.Println(names)

	aa := names[0:2]
	bb := names[1:3]
	fmt.Println(aa, bb)
	bb[0] = "XXX"
	fmt.Println(aa, bb)
	fmt.Println(names)

	q := []int{
		2, 3, 5, 7, 11, 13,
	}
	fmt.Println(q)
	fmt.Println(len(q[0:2]), cap(q[:0]))

	r := []struct {
		i int
		b bool
	}{
		{2, true}, {3, false}, {5, true},
	}

	fmt.Println(r)

}
