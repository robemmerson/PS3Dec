FROM alpine AS build

RUN apk add cmake curl gcc git g++ make 
WORKDIR /app
RUN git clone --recurse-submodules https://github.com/robemmerson/PS3Dec /app
RUN mkdir -p /app/build && \
    cd /app/build && \
    cmake .. && \
    make

WORKDIR /app2
RUN curl https://raw.githubusercontent.com/qeedquan/ecm/master/unecm.c -o unecm.c
RUN gcc -o unecm unecm.c

FROM alpine

WORKDIR /app
RUN apk add gcc
COPY --from=build /app/build/Release/PS3Dec /usr/local/bin/PS3Dec
COPY --from=build /app2/unecm /usr/local/bin/unecm

ENTRYPOINT [ "PS3Dec" ]