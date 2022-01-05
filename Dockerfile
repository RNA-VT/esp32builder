FROM debian:bullseye-slim

WORKDIR /tmp

RUN apt update && apt-get install curl python3 python3-serial python3-pip git -y
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install arduino-cli
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh

# Install arduino-lint
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-lint/main/etc/install.sh | BINDIR=/usr/local/bin sh

# Install pyserial
RUN pip3 install pyserial

# Install esp32 core
RUN printf "board_manager:\n  additional_urls:\n    - https://dl.espressif.com/dl/package_esp32_index.json\n" > .arduino-cli.yaml
RUN arduino-cli core update-index --config-file .arduino-cli.yaml
RUN arduino-cli core install esp32:esp32 --config-file .arduino-cli.yaml
