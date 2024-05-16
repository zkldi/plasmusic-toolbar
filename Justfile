id := "plasmoid-zk.plasmoid"

default:
	@just --choose

build:
	mkdir -p dist
	zip -r dist/{{id}} ./src

install: build uninstall && clean
	kpackagetool5 --install dist/{{id}}

uninstall: build 
	# remove fails if you dont have it installed
	-kpackagetool5 --remove dist/{{id}}

clean:
	rm -rf dist/