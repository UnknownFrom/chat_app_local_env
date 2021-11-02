
init:
	(git clone git@github.com:UnknownFrom/chat_app_users_api ./services/users_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_chat_api ./services/chat_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_frontend ./services/frontend || true)
	cd ./services/users_api/web/app && composer install
	cd ./services/frontend/composer && composer install
	cd ./services/chat_api && npm install
	cd ./docker && docker-compose build
start:
	cd ./docker && docker-compose up -d
migrate:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up
restart:
	cd ./docker && docker-compose down
	cd ./docker && docker-compose up -d
down:
	cd ./docker && docker-compose down
build:
	cd ./docker && docker-compose up --build -d

