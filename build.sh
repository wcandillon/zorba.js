JAVA_HEAP_SIZE=4096m ${EMSCRIPTEN}/em++ \
	-s WASM=1 \
	-O2 \
	src/zorba.cpp \
	-I${PWD}/system/include/ \
	-L${PWD}/system/lib \
	-lzorba_simplestore \
	-o zorba.html
