default: elm-build

elm-build:
	elm-make src/Main.elm --output=index.html

test:
	elm-test