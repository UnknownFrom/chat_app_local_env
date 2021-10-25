
init:
	(git clone git@github.com:UnknownFrom/chat_app_users_api ./services/users_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_chat_api ./services/chat_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_frontend ./services/frontend || true)
start:
	cd ./services/users_api/web/app && composer install
	cd ./services/frontend/composer && composer install
	cd ./docker && docker-compose up -d
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up
connect:
	cd ./services/chat_api && npm install && node server.js
restart:
	cd ./docker && docker-compose down
	cd ./docker && docker-compose up -d
down:
	cd ./docker && docker-compose down
migrationDown:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" down 1
migrationUp:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up 1
migrationsUp:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up
migrationsDown:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" down

