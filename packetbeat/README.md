# Welcome to Packetbeat 8.1.3

Packetbeat analyzes network traffic and sends the data to Elasticsearch.

## Getting Started

To get started with Packetbeat, you need to set up Elasticsearch on
your localhost first. After that, start Packetbeat with:

     ./packetbeat -c packetbeat.yml -e

This will start Packetbeat and send the data to your Elasticsearch
instance. To load the dashboards for Packetbeat into Kibana, run:

    ./packetbeat setup -e

For further steps visit the
[Quick start](https://www.elastic.co/guide/en/beats/packetbeat/8.1/packetbeat-installation-configuration.html) guide.

## Documentation

Visit [Elastic.co Docs](https://www.elastic.co/guide/en/beats/packetbeat/8.1/index.html)
for the full Packetbeat documentation.

## Release notes

https://www.elastic.co/guide/en/beats/libbeat/8.1/release-notes-8.1.3.html


docker run --cap-add=NET_ADMIN --network=host docker.elastic.co/beats/packetbeat:8.1.3 

