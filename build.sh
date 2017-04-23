JAVA_HEAP_SIZE=4096m ${EMSCRIPTEN}/em++ -O2 src/zorba.cpp -I${PWD}/system/include/ -L${PWD}/system/lib -lzorba_simplestore -o zorba.html
