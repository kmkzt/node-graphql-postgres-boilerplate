start:
	docker-compose up -d && yarn && yarn start

console:
	docker exec -it db bash

reset:
	docker-compose down && rm -r dbdata