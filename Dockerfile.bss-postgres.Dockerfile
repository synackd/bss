# MIT License
#
# (C) Copyright [2018-2021] Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# Dockerfile for building HMS bss.

### build-base stage ###
# Build base just has the packages installed we need.
FROM golang:1.16-alpine AS build-base

RUN set -ex \
    && apk -U upgrade \
    && apk add build-base

### base stage ###
# Base copies in the files we need to test/build.
FROM build-base AS base

# Copy all the necessary files to the image.
COPY go.mod /hms-bss/go.mod
COPY go.sum /hms-bss/go.sum
COPY cmd /hms-bss/cmd
COPY pkg /hms-bss/pkg
COPY internal /hms-bss/internal
COPY .version /hms-bss/.version

### Build Stage ###
FROM base AS builder

RUN set -ex \
    && cd /hms-bss/cmd/boot-script-service \
    && go build -v -o /usr/local/bin/boot-script-service

### Final Stage ###
FROM alpine:3.15
LABEL maintainer="Hewlett Packard Enterprise"
EXPOSE 27778
STOPSIGNAL SIGTERM

# Setup environment variables.
ENV HSM_URL=http://smd:27779
ENV NFD_URL=http://cray-hmnfd

# WARNING: Our containers currently do not have certificates set up correctly
#          to allow for https connections to other containers.  Therefore, we
#          will use an insecure connection.  This needs to be corrected before
#          release.  Once the certificates are properly set up, the --insecure
#          option needs to be removed.
ENV BSS_OPTS="--insecure --postgres-insecure"

ENV BSS_RETRY_DELAY=30
ENV BSS_HSM_RETRIEVAL_DELAY=10

# Other potentially useful env variables:
# BSS_IPXE_SERVER defaults to "api-gw-service-nmn.local"
# BSS_CHAIN_PROTO defaults to "https"
# BSS_GW_URI defaults to "/apis/bss"

# Include curl in the final image.
RUN set -ex \
    && apk -U upgrade \
    && apk add --no-cache curl

# Get the boot-script-service from the builder stage.
COPY --from=builder /usr/local/bin/boot-script-service /usr/local/bin/.

COPY .version /

# nobody 65534:65534
USER 65534:65534

# Set up the command to start the service, the run the init script.
CMD boot-script-service $BSS_OPTS --cloud-init-address localhost --postgres --postgres-host $POSTGRES_HOST --postgres-port $POSTGRES_PORT --retry-delay=$BSS_RETRY_DELAY --hsm $HSM_URL --hsm-retrieval-delay=$BSS_HSM_RETRIEVAL_DELAY
