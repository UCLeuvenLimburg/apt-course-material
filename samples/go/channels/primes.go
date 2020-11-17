package main

import "fmt"

func integers() <-chan int {
	result := make(chan int)

	go func() {
		i := 0

		for {
			result <- i
			i++
		}
	}()

	return result
}

func is_prime(n int) bool {
	for i := 2; i < n; i++ {
		if n%i == 0 {
			return false
		}
	}

	return n > 1
}

func primes() <-chan int {
	result := make(chan int)

	go func() {
		ints := integers()

		for {
			i := <-ints

			if is_prime(i) {
				result <- i
			}
		}
	}()

	return result
}

func main() {
	ps := primes()

	for i := 0; i != 10; i++ {
		fmt.Println(<-ps)
	}
}
