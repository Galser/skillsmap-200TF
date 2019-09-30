#!/usr/bin/env bash
sudo cp /tmp/assets/lissajous /usr/local/bin/
sudo chmod a+x /usr/local/bin/lissajous
sudo cp /tmp/assets/lissajous_systemd /lib/systemd/system/lissajous.service
sudo ufw allow http
sudo service lissajous start