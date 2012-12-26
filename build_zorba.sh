cd zorba/build
${EMSCRIPTEN}/emconfigure cmake -DEMSCRIPTEN=1 -DCMAKE_TOOLCHAIN_FILE=${EMSCRIPTEN}/cmake/Platform/Emscripten.cmake -DCMAKE_MODULE_PATH=${EMSCRIPTEN}/cmake -DZORBA_NO_ICU=ON -DZORBA_NO_XMLSCHEMA=ON -DZORBA_FOR_ONE_THREAD_ONLY=ON -DZORBA_SUPPRESS_SWIG=ON -DZORBA_NO_FULL_TEXT=ON -DZORBA_WITH_DEBUGGER=OFF -DZORBA_WITH_FILE_ACCESS=OFF -DLIBXML2_INCLUDE_DIR=${PWD}/../../system/include/libxml2 -DLIBXML2_LIBRARIES=${PWD}/../../system/lib/libxml2.a -DLIBXML2_XMLLINT_EXECUTABLE=${PWD}/../../system/bin/xmllint ..
${EMSCRIPTEN}/emmake make $1
cp src/libzorba_simplestore.so ${PWD}/../../system/lib/
cp -R include/zorba ${PWD}/../../system/include/
cp -R ../include/zorba/* ${PWD}/../../system/include/zorba
