id := "plasmoid-zk.plasmoid"

build:
	mkdir -p dist
	zip -r dist/{{id}} ./src

install: build && clean
	# remove fails if you dont have it installed
	-kpackagetool5 --remove dist/{{id}}

	kpackagetool5 --install dist/{{id}}

clean:
	rm -rf dist/