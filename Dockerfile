FROM debian:10 AS builder

RUN mkdir -p /root/git/gitsinet/ 
ADD shared.tar Debian10.list /root/git/gitsinet/
WORKDIR /root/git/gitsinet/shared

RUN mv ../Debian10.list /etc/apt/sources.list && apt update && apt upgrade -y && apt install -y make g++ gcc 
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/git/gitsinet/shared/
RUN make 

FROM debian:bullseye-slim
COPY --from=builder /root/git/gitsinet/shared/libhelloworld.so /dbfw/svc/lib/libhelloworld.so
RUN echo "/dbfw/svc/lib" >> /etc/ld.so.conf && ldconfig
COPY --from=builder /root/git/gitsinet/shared/main /root/main
WORKDIR /root
# CMD [ "/root/main" ] 

