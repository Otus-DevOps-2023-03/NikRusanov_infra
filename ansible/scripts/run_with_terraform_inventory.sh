#!/bin/bash -e
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
terraform -chdir=$CUR_DIR/../terraform/stage/ show -json   | jq |  python3 $CUR_DIR/scripts/dynamic_inventory.py  | jq > $CUR_DIR/dynamic_inventory.json
ansible-playbook  clone.yaml  -i dynamic_inventory.json
