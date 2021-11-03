init:
	(git clone git@github.com:UnknownFrom/chat_app_users_api ./services/users_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_chat_api ./services/chat_api || true)
	(git clone git@github.com:UnknownFrom/chat_app_frontend ./services/frontend || true)
	cd ./services/users_api/web/app && composer install
	cd ./services/frontend/composer && composer install
	cd ./services/chat_api && npm install
startBD:
	cd ./docker && docker-compose -f stack.yml up -d
start: migrate
	cd ./docker && docker-compose up -d
migrate:
	migrate -path=./services/users_api/web/public/database/migrator/migrations/ -database "mysql://root:root@tcp(localhost:8989)/chat" up
restart: down startBD start
down:
	cd ./docker && docker-compose stop
	cd ./docker && docker-compose -f stack.yml down
	cd ./docker && docker-compose down

