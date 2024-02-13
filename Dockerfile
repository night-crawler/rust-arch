FROM archlinux:latest

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN pacman -Sy archlinux-keyring --noconfirm
RUN rm -rf /etc/pacman.d/gnupg/* \
  && pacman-key --init \
  && pacman-key --populate archlinux
RUN pacman -Sy base-devel --noconfirm
RUN pacman -Sy glibc --noconfirm
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install cargo-arch
