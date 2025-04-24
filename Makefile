CONTAINER_NAME = postgres
DB_NAME = sales_db
DB_USER = postgres
DB_PASSWORD = postgres
POSTGRES_IMAGE = postgres:latest

NODE_CONTAINER = node
NODE_IMAGE = node:latest

PSQL = docker exec -i $(CONTAINER_NAME) psql -U $(DB_USER) -d $(DB_NAME)

# Função para executar um arquivo SQL
define run_sql
	@echo "Iniciando container PostgreSQL..."
	@docker run --name $(CONTAINER_NAME) \
		-e POSTGRES_USER=$(DB_USER) \
		-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
		-e POSTGRES_DB=$(DB_NAME) \
		-d $(POSTGRES_IMAGE) >/dev/null
	@echo "Aguardando PostgreSQL iniciar..."
	@sleep 3
	@echo "Executando arquivo SQL..."
	@docker exec -i $(CONTAINER_NAME) psql -U $(DB_USER) -d $(DB_NAME) < $(1)
	@echo "Removendo container..."
	@docker rm -f $(CONTAINER_NAME) >/dev/null
	@echo "Concluído!"
endef

# Função para executar um arquivo JavaScript
define run_js
	@echo "Executando arquivo JavaScript..."
	@docker run --rm -v "$(PWD):/app" -w /app $(NODE_IMAGE) node $(1)
	@echo "Concluído!"
endef

.PHONY: run-aggregation run-duplicated run-update run-join run-join-filter run-view run-js-*
run-aggregation:
	$(call run_sql,sql/2.1-aggregation.sql)

run-duplicated:
	$(call run_sql,sql/2.2-duplicatedRegistry.sql)

run-update:
	$(call run_sql,sql/2.3-updateConditionalData.sql)

run-join:
	$(call run_sql,sql/2.4-joinQuery.sql)

run-join-filter:
	$(call run_sql,sql/2.5-joinQueryWithFilter.sql)

run-view:
	$(call run_sql,sql/2.6-viewQuery.sql)

run-js-generic:
	$(call run_js,dist/1.1-genericTypeManipulation.js)

run-js-union:
	$(call run_js,dist/1.2-unionTypeValidation.js)

run-js-array:
	$(call run_js,dist/1.3-arrayImmutability.js)


.PHONY: help
help:
	@echo "Comandos SQL disponíveis:"
	@echo "  make run-aggregation  - Executa 2.1-aggregation.sql"
	@echo "  make run-duplicated   - Executa 2.2-duplicatedRegistry.sql"
	@echo "  make run-update       - Executa 2.3-updateConditionalData.sql"
	@echo "  make run-join         - Executa 2.4-joinQuery.sql"
	@echo "  make run-join-filter  - Executa 2.5-joinQueryWithFilter.sql"
	@echo "  make run-view         - Executa 2.6-viewQuery.sql"
	@echo ""
	@echo "Comandos JavaScript disponíveis:"
	@echo "  make run-js-generic   - Executa 1.1-genericTypeManipulation.js"
	@echo "  make run-js-union     - Executa 1.2-unionTypeValidation.js"
	@echo "  make run-js-array     - Executa 1.3-arrayImmutability.js"