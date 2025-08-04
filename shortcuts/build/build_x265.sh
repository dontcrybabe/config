 cmake -S ./source -B build-12 \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
	      -DCMAKE_ASM_NASM_FLAGS='-w-macro-params-legacy' \
        -DENABLE_ALPH="ON" \
	      -DENABLE_CLI="OFF" \
        -DENABLE_MULTIVIEW="ON" \
        -DENABLE_SVT_HEVC="" \
        -DNATIVE_BUILD="ON" \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
 	      -DMAIN12='ON' \
        -Wno-dev
    cmake --build build-12

    cmake -S ./source -B build-10 \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
        -DCMAKE_ASM_NASM_FLAGS='-w-macro-params-legacy' \
        -DENABLE_ALPH="ON" \
        -DENABLE_CLI="OFF" \
        -DENABLE_MULTIVIEW="ON" \
        -DENABLE_SVT_HEVC="" \
        -DNATIVE_BUILD="ON" \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
	      -DMAIN10:BOOL=ON \
        -Wno-dev
    cmake --build build-10

    cmake -S ./source -B build \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_ALPH="ON" \
        -DENABLE_CLI="ON" \
        -DENABLE_MULTIVIEW="ON" \
        -DENABLE_SVT_HEVC="" \
        -DNATIVE_BUILD="ON" \
        -DEXPORT_C_API='ON' \
        -DENABLE_SHARED='ON'\
        -DENABLE_HDR10_PLUS='' \
        -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
        -DEXTRA_LINK_FLAGS='-L.' \
        -DLINKED_10BIT='ON' \
        -DLINKED_12BIT='ON' \
        -Wno-dev
    ln -s ../build-10/libx265.a build/libx265_main10.a
    ln -s ../build-12/libx265.a build/libx265_main12.a
    cmake --build build
#    make
cd ./build
echo "WE ARE IN: $(pwd)"
mv libx265.a libx265_main.a
ar -M <<EOF
CREATE libx265.a
ADDLIB libx265_main.a
ADDLIB libx265_main10.a
ADDLIB libx265_main12.a
SAVE
END
EOF

