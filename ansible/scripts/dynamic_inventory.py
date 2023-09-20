#!/usr/bin/python3

import json,sys

terraform_json=json.load(sys.stdin)

inventory={}

# jsonString = json.dumps(inventory, indent=4)

for resources in  terraform_json["values"]["root_module"]["child_modules"]:
    for elem in resources["resources"]:
#        print(elem["name"])
        if elem["type"] == "yandex_compute_instance":
            print ()

            inventory[elem["name"]]= { 'hosts': {
                elem["values"]["name"] : {
                    "ansible_host" : elem["values"]["network_interface"][0]["nat_ip_address"]
                }
              }
            }

result = { "all" : { "children": inventory } }
json_object = json.dumps(result, indent = 2 )
print(json_object)

#app_ip = terraform_json["values"]["outputs"]["external_ip_address_app"]["value"]
#db_ip =  terraform_json["values"]["outputs"]["external_ip_address_db"]["value"]
#print(db_ip)
#print(app_ip)

