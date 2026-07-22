package main

import (
    "fmt"
    "io/ioutil"
    // "path/filepath"
    "os"
    "log"
    "os/exec"
)

func _createDirIfNotExist(dir string) {
    if _, err := os.Stat(dir); os.IsNotExist(err) {
            err = os.MkdirAll(dir, 0755)
            if err != nil {
                    panic(err)
            }
        fmt.Println("Directory",dir,"created!")
    }
}

// For directory or file.
func _verifyNotExists(object string){
    if _, err := os.Stat(object); os.IsNotExist(err) {
        fmt.Println("Not exist!")
    }
}

// For directory or file.
func _verifyExists(object string){
    if _, err := os.Stat(object); err == nil {
        fmt.Println("Exist!")
    }
}

func _runCommandUnix(command_linux string){
    out, err := exec.Command("/bin/bash", "-c", command_linux).Output()
    if err != nil {
        log.Fatal(err)
    }
    fmt.Printf("%s", out)
}

func _readFileExist(file string){
    if _, err := os.Stat(file); err == nil {
        b, err := ioutil.ReadFile(file) // just pass the file name
        if err != nil {
            fmt.Print(err)
        }
        fmt.Println(b) // print the content as 'bytes'
        str := string(b) // convert content to a 'string'
        fmt.Println(str) // print the content as a 'string'
    }
}

func main() {

    _verifyNotExists("/tmp/testDir.txt")
    _verifyExists("/tmp")
    _createDirIfNotExist("/tmp/go_folder")
    _readFileExist("/tmp/go_file.txt")
    _runCommandUnix("/usr/bin/uname -v")

}
