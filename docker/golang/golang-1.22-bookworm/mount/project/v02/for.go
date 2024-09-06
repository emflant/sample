package main

import "fmt"

func main() {

	sum := 0
	for i := 0; i < 10; i++ {
		sum += i
	}

	fmt.Println(sum)

	sum1 := 1

	for sum1 < 1000 {
		fmt.Println(sum1)
		sum1 += sum1
	}

	fmt.Println(sum1)

	x := 2

	if x == 2 {
		fmt.Println("x == 2")
	}
}
