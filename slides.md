<!-- fg=white bg=black -->
# Django+Docker
<!-- effect=matrix -->
---
<!-- fg=white bg=black -->
# Django+Docker
---
<!-- fg=white bg=black -->
# Django ?
---
<!-- fg=white bg=black -->
# MVT vs. MVC
---
<!-- fg=white bg=black -->
## MVC
---
<!-- fg=white bg=black -->
```
            ,--------.
            | modèle |
            `--------'
                ^
                | Lecture/écriture
                | des données
Requête         v
HTTP      ,------------.
( )-----> | contrôleur | ----->( )
          `------------'       Réponse
                ^              HTTP
                | Rendu
                v
             ,-----.
             | vue |
             `-----'
```
---
<!-- fg=white bg=black -->
## MVT
---
<!-- fg=white bg=black -->
```
            Requête
            HTTP      ,-------.
            ( )-----> | urls  |
                      `-------'
                          | Redirection
                          | vers la vue
                          | appropriée
                          v
,--------.   Données   ,-----.
| modèle | <---------> | vue | ----->( )
`--------'             `-----'       Réponse
                          ^          HTTP
                          |
                          |
                     ,---------.
                     | gabarit |
                     `---------'
```
---
<!-- fg=white bg=black -->
# OhMyBlog!
---
<!-- fg=white bg=black -->
```
               ,-.               ,-.
               `-'  :extends:    `-'
               /|\ -----------|> /|\
               / \               / \
             Blogueur         Internaute --------.
                |                 |              |
                |                 |              |
          ,----------.     ,-------------.  ,---------.
          | Gère les |     | Consulte la |  | Lit un  |
          | articles |     | liste des   |  | article |
          `----------'     | articles    |  `---------'
             |  |  |       `-------------'
             |  |  |
(Ajout) -----'  |  |_________
                |            |
         (Modification)      |
                             |
                       (Suppression)
```
---
<!-- fg=white bg=black -->
## Création d'un environnement virtuel
---
<!-- fg=white bg=black -->
## Installation de Django
---
<!-- fg=white bg=black -->
## Création du projet et de l'application
---
<!-- fg=white bg=black -->
## Le modèle
---
<!-- fg=white bg=black -->
| Champ | Description         | Type      |
| ----- | ------------------- | --------- |
| title | Titre de l'article  | Char(100) |
| date  | Date de publication | DateTime  |
| text  | Texte de l'article  | Text      |
---
<!-- fg=white bg=black -->
## La vue
---
<!-- fg=white bg=black -->
## Ajout de l'URL
---
<!-- fg=white bg=black -->
## Le gabarit (template)
---
<!-- fg=white bg=black -->
## Migration et rendu
---
<!-- fg=white bg=black -->
## Ajout d'un article
* Manuellement...
---
<!-- fg=white bg=black -->
## Ajout d'un article
* Manuellement
* Via la console d'administration...
---
<!-- fg=white bg=black -->
## Afficher un article.
---
<!-- fg=white bg=black -->
## Les fichiers statiques.
---
<!-- fg=white bg=black -->
## Résultat.
---
<!-- fg=white bg=black -->
# Test en production
---
<!-- fg=white bg=black -->
## Le fichier de configuration.
---
<!-- fg=white bg=black -->
## Le fichier de configuration.

* **SECRET_KEY**
---
<!-- fg=white bg=black -->
## Le fichier de configuration.

* **SECRET_KEY**
* **DEBUG**
---
<!-- fg=white bg=black -->
## Le fichier de configuration.

* **SECRET_KEY**
* **DEBUG**
* **ALLOWED_HOSTS**
---
<!-- fg=white bg=black -->
## Le fichier de configuration.

* **SECRET_KEY**
* **DEBUG**
* **ALLOWED_HOSTS**
* **CSRF_TRUSTED_ORIGINS**
---
<!-- fg=white bg=black -->
## Le fichier de configuration.

* **SECRET_KEY**
* **DEBUG**
* **ALLOWED_HOSTS**
* **CSRF_TRUSTED_ORIGINS**
* **STATIC_ROOT**
---
<!-- fg=white bg=black -->
# Docker ?
---
<!-- fg=white bg=black -->

```
                                                     [ Application ]
                  ,------------------.                      |
                  | Conteneur Docker |                      |
                  |-----------------------------------------v-----.
                  | +-------+      +----------+        +--------+ |
Navigateur ( )----->| Nginx | ---> | Gunicorn | -----> | Django | |
http://0.0.0.0    | +-------+      +----------+        +--------+ |
                  `-----^----------------^------------------------'
                        |                |
                        |                |
                        |     [ Serveur d'application ]
                        |
                        |
                 [ Serveur web ]
```
---
<!-- fg=white bg=black -->
# Gunicorn ?
---
<!-- fg=white bg=black -->
# Nginx ?
---
<!-- fg=white bg=black -->
## Dockerfile pour Python et les modules Gunicorn et Django
---
<!-- fg=white bg=black -->
## Dockerfile pour Nginx
---
<!-- fg=white bg=black -->
## Fichier de configuration Nginx
---
<!-- fg=white bg=black -->
## Fichier docker-compose
---
<!-- fg=white bg=black -->
## L'instant de vérité
---
<!-- fg=white bg=black -->
<!-- effect=fireworks -->
---
<!-- fg=white bg=black -->
# Conclusion
---
<!-- fg=white bg=black -->
## M E R C I  D E  V O T R E  A T T E N T I O N  !
<!-- effect=stars -->
---
