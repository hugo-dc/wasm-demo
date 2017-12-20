SHELL := /bin/bash

all:
	cargo build --target=asmjs-unknown-emscripten --release
	mkdir -p site
	find target/asmjs-unknown-emscripten/release -type f -name "wasm-demo.js" | xargs -I {} cp {} site/site.js

