
init:
	git clone git@github.com:UnknownFrom/chat_app_users_api.git ./services/users_api && \
	git clone git@github.com:UnknownFrom/chat_app_frontend.git ./services/frontend
start:
	docker-compose up -d
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" up
restart:
	docker-compose down
	docker-compose up -d
down:
	docker-compose down
compose:
	docker-compose up -d
migrationDown:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" down 1
migrationUp:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" up 1
migrationsUp:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" up
migrationsDown:
	migrate -path=web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" down

