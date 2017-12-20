SHELL := /bin/bash

all:
	cargo build --target=asmjs-unknown-emscripten --release
	mkdir -p site
	find target/asmjs-unknown-emscripten/release -type f -name "wasm-demo.js" | xargs -I {} cp {} site/site.js
	sed -ibak 's/run()$$/Module\["arguments"\]=\[\];run();module\.exports=Module;/' site/site.js
	sed -ibak 's/process\["on"\]("uncaughtException",(function(ex){if(!(ex instanceof ExitStatus)){throw ex}}))/\/\*\*\//' site/site.js
	node index.js

