#!/bin/bash

sudo chown -R paula:paula "$PWD"

sudo chown -R www-data:www-data ./var/
sudo chown -R www-data:www-data ./app/
sudo chown -R www-data:www-data ./pub/
sudo chown -R www-data:www-data ./generated/
