package main

import (
	"fmt"
	"time"
)

func main() {
	for{
		fmt.Println("hello dockerfile")
		time.Sleep(time.Millisecond*500)
	}
}
