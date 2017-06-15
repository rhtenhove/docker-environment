FROM eclipse-mosquitto
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

ADD mosquitto.conf /mosquitto/config/mosquitto.conf

# Create dummy file to be able to use mosquitto_passwd -b. See README.
RUN touch /mosquitto/passwords