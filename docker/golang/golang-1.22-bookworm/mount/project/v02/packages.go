package main

import (
	"fmt"
	"math"
	"math/rand"
)

func main() {
	n, err := fmt.Println("My favorite number is", rand.Intn(10))

	if err == nil {
		fmt.Println(n)
	}

	fmt.Printf("Now you have %g problems.\n", math.Sqrt(7))

	// Exported names
	// 대문자로 시작하는 함수나 변수는 밖에서 참조할 수 있음.
	fmt.Println(math.Pi)

	// Function
	fmt.Println(add(42, 13))

	fmt.Println(add2(42, 13))

	a, b := swap("hello", "world")
	fmt.Println(a, b)

	fmt.Println(split(17))

}

func add(x int, y int) int {
	return x + y
}

// Functions continued
// 함수에 입력하는 변수가 연속해서 같은 타입이라면 마지막에만 입력하면 된다.
func add2(x, y int) int {
	return x + y
}

// Multiple results
// 리턴값이 여러개인 케이스.
func swap(x, y string) (string, string) {
	return y, x
}

// Named return values
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}
