##### BEGIN external-mapped/Dockerfile/image-header #####
FROM $CONTECO_BASE
##### END external-mapped/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/build-instructions #####
USER root
RUN apt-get update && apt-get install -y gettext && apt-get install -y jq && rm -rf /var/cache/apt/*
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x jq-linux64 && mv jq-linux64 $(which jq)
##### END image/Dockerfile/build-instructions #####

##### BEGIN external/Dockerfile/conteco #####
COPY ./ /conteco/repo/
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:0.10.0
RUN confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-servicenow:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-syslog:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-avro-converter:latest
##### END external/Dockerfile/conteco #####

##### BEGIN external-mapped/Dockerfile/labels-footer #####
LABEL $CONTECO_LABELSPACE.schema-version="1.0" \
      $CONTECO_LABELSPACE.realm="$CONTECO_REALM_RUNTIME" \
      $CONTECO_LABELSPACE.ecosystem="$CONTECO_ECOSYSTEM_RUNTIME" \
      $CONTECO_LABELSPACE.type="$CONTECO_TYPE" \
      $CONTECO_LABELSPACE.name="$CONTECO_NAME" \
      $CONTECO_LABELSPACE.tag="$CONTECO_TAG" \
      $CONTECO_LABELSPACE.base="$CONTECO_BASE" \
      $CONTECO_LABELSPACE.build="$CONTECO_BUILD" \
      $CONTECO_LABELSPACE.label="$CONTECO_LABEL" \
      $CONTECO_LABELSPACE.description="$CONTECO_DESCRIPTION" \
      $CONTECO_LABELSPACE.repository="/conteco/repo"
##### END external-mapped/Dockerfile/labels-footer #####
