FROM alpine AS build

RUN apk add cmake make gcc g++ git
RUN git clone --recurse-submodules https://github.com/robemmerson/PS3Dec /PS3Dec
RUN mkdir -p /PS3Dec/build && \
    cd /PS3Dec/build && \
    cmake .. && \
    make


FROM alpine

WORKDIR /app
RUN apk add gcc
COPY --from=build /PS3Dec/build/Release/PS3Dec /app/PS3Dec

ENTRYPOINT [ "/app/PS3Dec" ]