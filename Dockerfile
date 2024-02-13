FROM archlinux:latest

RUN pacman -Sy archlinux-keyring --noconfirm
RUN rm -rf /etc/pacman.d/gnupg/* \
  && pacman-key --init \
  && pacman-key --populate archlinux
RUN pacman -Sy base-devel glibc git cargo --noconfirm

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN cargo install cargo-arch cargo-get
RUN rustup default stable

RUN useradd -s /bin/sh -m user
RUN sudo -iu user rustup default stable
