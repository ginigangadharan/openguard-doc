# Ansible Runner

- [Using Runner as a Python Module Interface to Ansible](https://ansible-runner.readthedocs.io/en/stable/python_interface/#)
- [Running with Ansible Runner](https://swapps.com/blog/go-beyond-with-automation-ansible-runner)
- [Ansible Runner Examples](https://programtalk.com/python-examples/ansible.runner.Runner/)
- [how to use ansible runner programatically](https://gist.github.com/privateip/879683a0172415c408fb2afb82a97511)



```shell
ansible-runner -p my_playbook.yml run /path/to/my/project
```

```python
import ansible_runner
r = ansible_runner.run(private_data_dir='/tmp/demo', playbook='test.yml')
print("{}: {}".format(r.status, r.rc))
# successful: 0
for each_host_event in r.events:
    print(each_host_event['event'])
print("Final status:")
print(r.stats)
```

## Passing inventory to ansible runner

The ansible_runner.run() accepts following values for inventory parameter.

1. Path to the inventory file in the private_data_dir
2. Native python dict supporting the YAML/json inventory structure
3. A text INI formatted string
4. A list of inventory sources, or an empty list to disable passing inventory

Default value, if not passed, for this parameter is private_data_dir/inventory directory. Passing this parameter overrides the inventory directory/file.