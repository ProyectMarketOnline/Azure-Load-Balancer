#!/bin/bash
# Script para validar balanceo de carga
while true; do curl -s http://4.249.44.56 | grep "server-name"; sleep 1; done
