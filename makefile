create-stack:
	aws cloudformation create-stack --stack-name $(stackname) --template-body file://$(template) --parameters file://$(params) --capabilities CAPABILITY_NAMED_IAM
update-stack:
	aws cloudformation update-stack --stack-name $(stackname) --template-body file://$(template) --parameters file://$(params) --capabilities CAPABILITY_NAMED_IAM

create-network:
	$(MAKE) stackname=UdacityProjNetwork template=network.yaml params=network-params.json create-stack
update-network:
	$(MAKE) stackname=UdacityProjNetwork template=network.yaml params=network-params.json update-stack

create-servers:
	$(MAKE) stackname=UdacityProjServers template=servers.yaml params=servers-params.json create-stack
update-servers:
	$(MAKE) stackname=UdacityProjServers template=servers.yaml params=servers-params.json update-stack