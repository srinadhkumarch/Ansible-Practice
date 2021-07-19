#!/usr/bin/env python

import json

def get_inventory_data():
    return {
        "Slaves": {
              "hosts": {
                 "Slave": {
                     "ansbile_ssh_host": "10.150.3.47"
                  }
               }
         }
     }

if __name__ == "__main__":
   inventory_data = get_inventory_data()
   print(json.dumps(inventory_data))