# ESP 32 Build Tools

# Usage

```
docker run -it bisonshark/esp32builder -v /path/to/src:/project_name arduino-cli compile --fqbn esp32:esp32:esp32 -o output.bin project_name.ino
```