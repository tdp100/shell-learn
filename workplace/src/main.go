package main

import "fmt"

func main() {
	a := TestDefer()
	fmt.Println(a)
}

func TestDefer() (i int) {
	defer func() {
		i++
	}()

	defer func() {
		i++
	}()
	i = +10
	return
}
