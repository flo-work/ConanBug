FROM conanio/gcc7-armv7hf
WORKDIR /src
RUN mkdir -p /src/build
COPY . /src
RUN cmake -S /src -B /src/build -DCMAKE_BUILD_TYPE=Release && cmake --build /src/build