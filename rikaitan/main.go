package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"path"

	rikaitan "github.com/Ajatt-Tools/rikaitan-import"
)

func usage() {
	fmt.Fprintf(os.Stderr, "Usage: %s [options] input-path output-path\n", path.Base(os.Args[0]))
	fmt.Fprint(os.Stderr, "https://github.com/Ajatt-Tools/rikaitan-import/\n\n")
	fmt.Fprint(os.Stderr, "Parameters:\n")
	flag.PrintDefaults()
}

func main() {
	var (
		format   = flag.String("format", rikaitan.DefaultFormat, "dictionary format [edict|enamdict|epwing|kanjidic|rikai]")
		language = flag.String("language", rikaitan.DefaultLanguage, "dictionary language (if supported)")
		title    = flag.String("title", rikaitan.DefaultTitle, "dictionary title")
		stride   = flag.Int("stride", rikaitan.DefaultStride, "dictionary bank stride")
		pretty   = flag.Bool("pretty", rikaitan.DefaultPretty, "output prettified dictionary JSON")
	)

	flag.Usage = usage
	flag.Parse()

	if flag.NArg() != 2 {
		usage()
		os.Exit(2)
	}

	if err := rikaitan.ExportDb(flag.Arg(0), flag.Arg(1), *format, *language, *title, *stride, *pretty); err != nil {
		log.Fatal(err)
	}
}
