package main

import (
	"C"
	"encoding/json"
	"log"
	"unsafe"
)

//export helloWorld
func helloWorld() {
	log.Println("Hello World")
}

//export hello
func hello(namePtr *C.char) {
	name := C.GoString(namePtr)
	log.Println("Hello", name)
}

//export farewell
func farewell() *C.char {
	return C.CString("Bye!")
}

//export fromJSON
func fromJSON(documentPtr *C.char) {
	documentString := C.GoString(documentPtr)
	var jsonDocument map[string]interface{}
	err := json.Unmarshal([]byte(documentString), &jsonDocument)
	if err != nil {
		log.Fatal(err)
	}
	log.Println(jsonDocument)
}

//export loop_quotas
func loop_quotas(quotas_p *int64, n int64) int64 {
	quotas := unsafe.Slice(quotas_p, n)
	total := int64(0)
	for _, value := range quotas {
		total += value
	}
	return total
}

func main() {
}
