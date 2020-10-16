# `external.kafka_connect` - ContEco

Confluent Kafka Connect image with ContEco external prerequisites installed.
See `conteco.docs.overview` for more information on the ContEco ecosystem.

## Installed External Prerequisites

* gettext - for availability of envsubst
* jq - JSON processor

## Installed Connectors

* confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq-sink:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
* confluent-hub install --no-prompt debezium/debezium-connector-mysql:0.10.0
* confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-servicenow:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-syslog:latest
* confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest

## Tags

* 6.0.0 (latest)  
* 5.3.1
