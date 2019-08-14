.PHONY: up deploy destroy

up:
	@vagrant up

docker_initialise:
	ansible-playbook \
		--private-key=~/.vagrant.d/insecure_private_key \
		-u vagrant \
		-i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
		requests/docker_demo.yml

deploy: up

destroy:
	vagrant destroy -f