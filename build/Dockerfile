FROM ubuntu:bionic as builder

COPY ${PWD}/install.sh /install.sh
 
RUN chmod +x /install.sh && /install.sh

FROM ubuntu:bionic as final

COPY --from=builder /*.deb /

COPY ${PWD}/install-final.sh /install-final.sh
 
RUN chmod +x /install-final.sh && /install-final.sh

# We need some environment variables to work please review and modify
ENV RUN_RTPENGINE=yes
ENV LISTEN_TCP=25060
ENV LISTEN_UDP=12222
ENV LISTEN_NG=22222
ENV LISTEN_CLI=9900
ENV TIMEOUT=60
ENV SILENT_TIMEOUT=3600
ENV PIDFILE=/var/run/ngcp-rtpengine-daemon.pid
ENV FORK=no
ENV TABLE=0
ENV PORT_MIN=16384
ENV PORT_MAX=16485
ENV LOG_LEVEL=7

# Get the startup script.  It's long and complicated
COPY ${PWD}/run.sh /run.sh
RUN chmod 755 /run.sh

CMD /run.sh