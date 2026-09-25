FROM php:8.2-cli-alpine

WORKDIR /app

COPY . /app

# Permissões para que o PHP possa ler e escrever api/state.json
RUN chmod -R 777 /app/api

ENV PORT=8000
EXPOSE 8000

# Inicia o servidor embutido do PHP apontando para o router.php e docroot public
CMD ["sh", "-c", "php -S 0.0.0.0:${PORT:-8000} -t public router.php"]
