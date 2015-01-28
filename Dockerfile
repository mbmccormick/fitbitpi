FROM resin/rpi-raspbian:wheezy-2015-01-15

# manually set the PATH variable to get access to crontab
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# install python
RUN apt-get update && apt-get install -y python

# install python dependencies for usb and pip
RUN apt-get update && apt-get install -y python-usb python-pip

# install galileo
RUN pip install galileo

# modify permissions on fitbit usb dongle and restart udev service
COPY 99-fitbit.rules /etc/udev/rules.d/99-fitbit.rules
CMD service udev restart

# add galileo daemon rules to crontab
CMD crontab daemon.conf

# launch galileo for the first time
CMD galileo >> /var/log/galileo.log 2>&1
