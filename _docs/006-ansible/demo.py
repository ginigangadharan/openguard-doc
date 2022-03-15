import ansible_runner

def run_ansible(node_names,playbook_file):

    ## varialble
    inventory_file = 'ansible_data/inventory/this_inventory'
    ## create inventory
    #hosts = {
    #    'hosts': {
    #        'Ubuntu-20-CP': {
    #            'ansible_host': '192.168.56.35',
    #            'ansible_user': 'devops',
    #            'ansible_password': 'devops'
    #        }
    #    },
    #}
    #print(hosts)
    
    ## create file manually due to persmission issue
    this_inventory = "Ubuntu-20-CP ansible_host=192.168.56.35 ansible_user=devops ansible_password=devops "
    new_inventory = open(inventory_file, "w")
    new_inventory.write(this_inventory)
    new_inventory.close()

    ## fetch and assign extra variables
    extravars = {
        'NODES': 'Ubuntu-20-CP'
    }

    ## build kwargs for passing to runner
    kwargs = {
        'playbook': playbook_file,
        #'inventory': {'all': hosts},
        #'inventory': inventory_file,
        #'envvars': envvars,
        'extravars': extravars,
        'private_data_dir': 'ansible_data'
    }

    #ansiblerunner = ansible_runner.run(private_data_dir='ansible_data', 
    #                       playbook='test.yml')

    ## run ansible_runner with **kwargs
    ansiblerunner = ansible_runner.run(**kwargs)

    print("{}: {}".format(ansiblerunner.status, ansiblerunner.rc))
    # successful: 0
    for each_host_event in ansiblerunner.events:
        print(each_host_event['event'])
    print("Final status:")
    print(ansiblerunner.stats)

run_ansible('localhost', 'test.yml')