
init:
	git clone
start:
	docker-compose up -d
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" up
restart:
	docker-compose down
	docker-compose up -d
down:
	docker-compose down
compose:
	docker-compose up -d
migrationDown:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" down 1
migrationUp:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" up 1
migrationsUp:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" up
migrationsDown:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" down

