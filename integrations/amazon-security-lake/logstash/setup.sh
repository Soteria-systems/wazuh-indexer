#!/usr/bin/bash

# This script creates and configures a keystore for Logstash to store
# indexer's credentials. NOTE: works only for dockerized logstash.
#   Source: https://www.elastic.co/guide/en/logstash/current/keystore.html

# Prepare keystore
set +o history
export LOGSTASH_KEYSTORE_PASS="SecretPassword"
set -o history

# Create keystore
/usr/share/logstash/bin/logstash-keystore create
echo "admin" | /usr/share/logstash/bin/logstash-keystore add INDEXER_USERNAME
echo "admin" | /usr/share/logstash/bin/logstash-keystore add INDEXER_PASSWORD
