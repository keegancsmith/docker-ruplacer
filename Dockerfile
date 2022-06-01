FROM rust AS builder

RUN rustup target add x86_64-unknown-linux-musl

RUN cargo install --target x86_64-unknown-linux-musl ruplacer

FROM scratch
COPY --from=builder /usr/local/cargo/bin/ruplacer /usr/local/bin/ruplacer
ENTRYPOINT ["/usr/local/bin/ruplacer"]
