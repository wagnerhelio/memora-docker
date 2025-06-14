# 🚀 Projeto MEMORA (Django + Docker)

Sistema web baseado em Django, containerizado com Docker e pronto para desenvolvimento local ou deploy em ambiente simulado com Apache + mod_wsgi.

---

## ✅ Requisitos

- Python 3.11+
- Docker + Docker Compose
- Git
- VS Code (opcional, mas recomendado)

---

## 🧱 Estrutura do Projeto

```
memora-docker/
├── memora/                  # Projeto Django (manage.py, apps, settings)
│   ├── manage.py
│   ├── memora/              # Configurações (settings.py, urls.py)
│   ├── perform/             # App centralizador
│   └── sspgo/               # App funcional SSPGO
├── apache/                  # Configuração Apache/mod_wsgi
├── static/                  # Arquivos estáticos coletados
├── requirements.txt
├── docker-compose.yml
├── Dockerfile
└── .env (opcional)
```

---

## 🔧 Instalação Local (sem Docker)

### 1. Clone o repositório

```bash
git clone https://github.com/SEU_USUARIO/memora-docker.git
cd memora-docker
```

### 2. Crie o ambiente virtual

```bash
python -m venv venv
venv\Scripts\activate       # Windows
# ou
source venv/bin/activate   # Linux/macOS
```

### 3. Instale as dependências

```bash
pip install -r requirements.txt
```

### 4. Configure o ambiente

Crie (opcional) um `.env` com:

```
DEBUG=True
SECRET_KEY=sua_chave_secreta
```

### 5. Execute o projeto

```bash
cd memora
python manage.py migrate
python manage.py runserver
```

Acesse em `http://127.0.0.1:8000/`

---

## 🐳 Executando com Docker

### 1. Build e run com Docker Compose

```bash
docker-compose up --build
```

O projeto estará acessível em:

```
http://localhost:8000/
```

### 2. Acessar o container

```bash
docker-compose exec memora-web bash
```

### 3. Criar superusuário (opcional)

```bash
python manage.py createsuperuser
```

---

## 🧠 Desenvolvimento com VS Code + Docker

Se você usa VS Code com a extensão **Dev Containers**, conecte ao container com:

```
F1 → Dev Containers: Attach to Running Container
→ memora-docker-memora-web-1
```

Abra a pasta `/var/www/html/sistemas/memora-env/memora`

---

## 🔍 Endpoints disponíveis

| Rota                  | Descrição                      |
|-----------------------|-------------------------------|
| `/admin/`             | Painel administrativo Django  |
| `/sspgo/`             | Módulo principal da SSPGO     |
| `/`                   | Página inicial (`perform`)    |

---

## 📦 Variáveis importantes (.env)

```env
SECRET_KEY=sua_chave_secreta
DEBUG=True
```

---

## 🚀 Futuro (CI/CD e Produção)

- [ ] Integração com GitHub Actions para build e teste
- [ ] Dockerfile de produção (Gunicorn + Nginx)
- [ ] Deploy remoto via SSH ou cloud (Render/Railway)

---

## 📄 Licença

Este projeto está sob a licença MIT.
