#!/usr/bin/env sh

CO_SERVER_1=elophant_consul_$(( ((CONSUL_NODE_NUMBER) % 5)+1 )).${NETWORK}
CO_SERVER_2=elophant_consul_$(( ((CONSUL_NODE_NUMBER+1) % 5)+1 )).${NETWORK}
CO_SERVER_3=elophant_consul_$(( ((CONSUL_NODE_NUMBER+2) % 5)+1 )).${NETWORK}
CO_SERVER_4=elophant_consul_$(( ((CONSUL_NODE_NUMBER+3) % 5)+1 )).${NETWORK}

consul agent -config-file /etc/consul.d/server/elophant_consul_server.json -node "elophant_consul_${CONSUL_NODE_NUMBER}" -retry-interval 5s -retry-join ${CO_SERVER_1} ${CO_SERVER_2} ${CO_SERVER_3} ${CO_SERVER_4}
