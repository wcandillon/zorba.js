em++ -s WASM=1 -s DISABLE_EXCEPTION_CATCHING=0 -O2 src/spiro.cpp -Isystem/include/ -Lsystem/lib -lzorba_simplestore	--preload-file data -o spiro.html
