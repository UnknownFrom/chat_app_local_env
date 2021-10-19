
init:
	git clone https://github.com/UnknownFrom/chat_app_users_api ./services/users_api && \
	git clone https://github.com/UnknownFrom/chat_app_frontend ./services/frontend
start:
	cd ./services/users_api/web/app && composer install
	cd ./docker && docker-compose up -d
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up
restart:
	cd ./docker && docker-compose down
	cd ./docker && docker-compose up -d
down:
	cd ./docker && docker-compose down
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

