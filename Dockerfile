FROM python:3.11-slim

# Instala Apache + mod_wsgi + ferramentas de build
RUN apt-get update && apt-get install -y apache2 apache2-dev libapache2-mod-wsgi-py3 gcc

# Define diretório do projeto Django
WORKDIR /var/www/html/sistemas/memora-env

# Copia tudo para dentro do container
COPY . .

# Instala dependências Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Aplica migrações, coleta estáticos e garante permissões corretas no volume
RUN python memora/manage.py migrate && \
    python memora/manage.py collectstatic --noinput && \
    chown -R www-data:www-data /var/www/html/sistemas/memora-env

# Aponta para config personalizada do Apache
RUN cp apache/memora.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod wsgi

EXPOSE 80

# Inicia o Apache
CMD ["apachectl", "-D", "FOREGROUND"]
