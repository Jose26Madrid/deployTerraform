#!/bin/bash
set -e

echo "Clonando repositorio"
[ ! -d ~/terraform ] && git clone https://github.com/Jose26Madrid/terraform.git ~/terraform || echo "El proyecto ya existe, no se clona"
ls -lrt terraform
