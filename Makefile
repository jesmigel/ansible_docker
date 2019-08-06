.PHONY: up deploy destroy

up:
	vagrant up

deploy: up
	ansible-playbook \
		--private-key=~/.vagrant.d/insecure_private_key \
		-u vagrant \
		-i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
		requests/docker_deploy.yml

destroy:
	vagrant destroy -f