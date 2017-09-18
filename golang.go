// Go Programming Notes

// To run Go program
// $ mkdir pkgname
// $ cd pkgname
// $ go build

// Standardized formatting of Go programs
// $ gofmt goprogram.go

package main

import (
	"fmt"       // I/O function
	"math"      // Basic constants and math functions
	"math/rand" // Pseudo-random number generators
)

// Functions can take zero or more arguments
func add(x int, y int) int {
	return x + y
}

// If params of same time, you can omit all but last type call
func subtract(x, y int) int {
	return x - y
}

func main() {
	rand.Seed(3123)
	fmt.Println("My favorite number is", rand.Intn(6))

	// Exported names are capitalized
	// fmt.Println(math.pi) <- this fails
	fmt.Println(math.Pi)

	// Call previously defined functions
	fmt.Println(add(42, 13))
	fmt.Println(subtract(42, 13))
}
