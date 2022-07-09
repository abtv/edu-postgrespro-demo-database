all: download up exec

download:
	wget -N https://edu.postgrespro.ru/demo-big.zip
	unzip -p demo-big.zip > demo.sql
up:
	docker compose up -d
	sleep 10 # let's give Postgres some time to start accepting connections
down:
	docker compose down
exec:
	docker exec -ti postgres psql -U postgres -d demo -a -f /demo.sql
