# 📦 Environnement de test WordPress + WooCommerce – Fédération Envie

Ce projet Docker met en place un environnement local pour tester l’interconnexion entre WooCommerce et le système d’information **Sealog** (SIERG) utilisé par la Fédération Envie.

Il permet de tester :
- La publication et gestion des produits via l’API WooCommerce
- La création de commandes
- La synchronisation des stocks
- Les performances de l’API REST WooCommerce dans un contexte moderne (version récente, sans limitation de 2016)

---

## ✅ Contenu de l’environnement

- **WordPress 6.7**
- **WooCommerce** (dernière version)
- **PHP 8.2**
- **MariaDB 10.11**
- **phpMyAdmin**
- Configuration PHP personnalisée (upload max, mémoire, etc.)
- Support complet de l’API REST WooCommerce (v3)

---

## 🚀 Installation

### 1️⃣ Étape 1 – Cloner le dépôt

```bash
git clone <url-du-repo>
cd <nom-du-dossier>
```

---

### 2️⃣ Étape 2 – Créer le fichier `.env`

À la racine du projet, créer un fichier nommé `.env` et y coller ce contenu :

```env
# WordPress
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD=wordpress
WORDPRESS_DB_NAME=wordpress
WORDPRESS_TITLE="Site Envie Test"
WORDPRESS_ADMIN_USER=admin
WORDPRESS_ADMIN_PASSWORD=admin123
WORDPRESS_ADMIN_EMAIL=admin@example.com

# MariaDB
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=wordpress

# PhpMyAdmin
PMA_HOST=db
```

---

### 3️⃣ Étape 3 – Lancer les conteneurs Docker

Une fois le fichier `.env` créé, démarre l’environnement avec :

```bash
docker-compose up --build -d
```

Cette commande :
- construit l’image personnalisée de WordPress (si nécessaire),
- démarre tous les services (WordPress, base de données, PhpMyAdmin),
- applique les paramètres définis dans le `.env`.

---

## 4️⃣ Étape 4 – Accéder aux services

Une fois les conteneurs lancés, ouvre ton navigateur :

### 🔗 Interfaces disponibles

| Service        | URL                       | Identifiants par défaut                  |
|----------------|---------------------------|------------------------------------------|
| 🧩 WordPress    | http://localhost:8888     | admin / admin123                         |
| 🛠️ PhpMyAdmin  | http://localhost:8081     | root / rootpassword (défini dans `.env`) |

---

### 🧩 Accéder à l’administration WordPress

- URL : [http://localhost:8888/wp-admin](http://localhost:8888/wp-admin)
- Identifiants :
  - **Utilisateur** : `admin`
  - **Mot de passe** : `admin123`

C’est ici que tu peux configurer WooCommerce, créer des produits, gérer les commandes, ou générer des clés API REST.

---

### 🛠️ Accéder à PhpMyAdmin

- URL : [http://localhost:8081](http://localhost:8081)
- Identifiants :
  - **Utilisateur** : `root`
  - **Mot de passe** : `rootpassword`

PhpMyAdmin permet de visualiser et manipuler la base de données `wordpress`, utile pour les tests d’intégration côté SI Sealog.

---

### 📌 Infos techniques

- **Ports définis dans `docker-compose.yml` :**
  - `8888` → WordPress
  - `8081` → PhpMyAdmin
- **Volumes persistants :**
  - `wordpress_data` : fichiers WordPress
  - `db_data` : base MariaDB

---