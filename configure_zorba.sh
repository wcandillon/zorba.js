cd zorba/build
${EMSCRIPTEN}/emconfigure cmake \
	-DCMAKE_BUILD_TYPE=Debug \
	-DEMSCRIPTEN=1 \
	-DCMAKE_CXX_FLAGS="-std=c++11 -I${PWD}/../../system/include" \
	-DCMAKE_TOOLCHAIN_FILE=${EMSCRIPTEN}/cmake/Modules/Platform/Emscripten.cmake \
	-DCMAKE_MODULE_PATH=${EMSCRIPTEN}/cmake \
	-DZORBA_NO_ICU=ON \
	-DZORBA_NO_XMLSCHEMA=ON \
	-DZORBA_FOR_ONE_THREAD_ONLY=ON \
	-DZORBA_SUPPRESS_SWIG=ON \
	-DZORBA_NO_FULL_TEXT=ON \
	-DZORBA_WITH_DEBUGGER=OFF \
	-DZORBA_WITH_FILE_ACCESS=ON \
	-DLIBXML2_INCLUDE_DIR=${PWD}/../../system/include/libxml2 \
	-DLIBXML2_LIBRARIES=${PWD}/../../system/lib/libxml2.a \
	-DLIBXML2_XMLLINT_EXECUTABLE=${PWD}/../../system/bin/xmllint \
	-DICU_INCLUDE=${PWD}/../../system/include \
	-DICU_LIBRARY=${PWD}/../../system/lib/libicuuc.a \
	-DICU_I18N_LIBRARY=${PWD}/../../system/lib/libicui18n.a \
	-DICU_DATA_LIBRARY=${PWD}/../../system/lib/libicudata.a \
	..

