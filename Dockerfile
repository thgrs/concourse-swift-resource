FROM progrium/busybox

RUN opkg-install ca-certificates

# satisfy go crypto/x509
RUN for cert in `ls -1 /etc/ssl/certs/*.crt | grep -v /etc/ssl/certs/ca-certificates.crt`; \
      do cat "$cert" >> /etc/ssl/certs/ca-certificates.crt; \
    done

ENV PATH /opt/resource:$PATH
COPY bin/ /opt/resource/
