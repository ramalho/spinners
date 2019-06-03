package main

import (
	"fmt"
	"strings"
	"time"
)

func spin(msg string, done <-chan bool) {
	spinner_chars := []rune(`|/-\`)
	i := 0
	status := ""
	repeat := true
	for repeat {
		select {
		case <- done:
			repeat = false
		default:
			time.Sleep(100 * time.Millisecond)
			char := spinner_chars[i]
			i = (i + 1) % len(spinner_chars)
			status = fmt.Sprintf("%c %s", char, msg)
			fmt.Printf("%s\r", status)
		}
	}
	fmt.Printf("%s\r", strings.Repeat(" ", len(status)))
}

func slow_function() int {
    time.Sleep(3 * time.Second)
	return 42
}

func supervisor() int {
	done := make(chan bool)
	go spin("thinking!", done)
	result := slow_function()
	done <- true
	return result
}

func main() {
	result := supervisor()
	fmt.Println("Answer:", result)
}
