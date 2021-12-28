FROM debian:latest

WORKDIR /tmp

ADD . .

WORKDIR /tmp

# Install arduino-cli
RUN apt update && apt-get install curl python3 python3-serial python3-pip git -y
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh

# Install python, pip and pyserial
RUN pip3 install pyserial

# Install esp32 core
RUN printf "board_manager:\n  additional_urls:\n    - https://dl.espressif.com/dl/package_esp32_index.json\n" > .arduino-cli.yaml
RUN arduino-cli core update-index --config-file .arduino-cli.yaml
RUN arduino-cli core install esp32:esp32 --config-file .arduino-cli.yaml

RUN arduino-cli lib install "Adafruit BME280 Library"
RUN arduino-cli lib install "Adafruit Unified Sensor"
RUN arduino-cli lib install "HCSR04 ultrasonic sensor"
RUN arduino-cli lib install "ArduinoJson"
RUN arduino-cli lib install "MPU9250_asukiaaa"
 
RUN cd /root/Arduino/libraries && git clone https://github.com/me-no-dev/AsyncTCP.git
RUN cd /root/Arduino/libraries && git clone https://github.com/me-no-dev/ESPAsyncWebServer.git

CMD ["sh entrypoint"]