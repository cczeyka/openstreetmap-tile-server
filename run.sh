#!/bin/bash

service apache2 restart

# Configure renderd threads
sed -i -E "s/num_threads=[0-9]+/num_threads=${THREADS:-16}/g" /usr/local/etc/renderd.conf

if [ -f /shapefiles/mapnik.xml ]; then
  cp -f /shapefiles/mapnik.xml /home/renderer/src/openstreetmap-carto/
fi

# Run
sudo -u renderer renderd -f -c /usr/local/etc/renderd.conf

exit 0
