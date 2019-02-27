# README :closed_book:


## Description

 Ce projet est une **plateforme de requêtes RGPD** pleinement fonctionnelle composée d'un front office et d'un back office.

 :question: Qu'est-ce que le RGPD? https://www.cnil.fr/fr/rgpd-de-quoi-parle-t-on

---
* Le **front office** est un formulaire pouvant recueillir les **demandes des utilisateurs** dans le cadre du *RGPD*.
* Le **back office** permet aux **DPO** de s'inscrire avec un token généré par l'admin de la plateforme puis ensutie de **personnaliser le formulaire aux besoins de leur entreprise**. Pour ce faire j'ai utilisé différents models en **CRUD** permettant par exemple de donner à l'utilisateur le choix de se désinscrire d'une newsletter, de ne plus recevoir d'invitations, de promotions, etc...

### Ce que j'ai appris :man_student:

* Mise en pratique de mes connaissances en **Ruby on Rails**
* Découverte de **SASS** (SCSS)
* Familiarisation avec l'**ActionMailer**
* **Mise en production** d'une application WEB au niveau professionnel.
* 


## README technique :gear:

Cette section documente l'aspect fonctionnel du projet

* Ruby version
 ruby-2.5.1 | rails 
* Dépendences systèmes

postgresql postgresql-server-dev-all  build-essential dirmngr gnupg ruby ruby-dev zlib1g-dev libruby libssl-dev libpcre3-dev libcurl4-openssl-dev rake ruby-rack

* Configuration
 Le fichier de configuration de la db est à refaire.
* Créaton de la DB
 Créer un user "Rails User"
* Initialisation de la DB
```
rails db:migrate
```

* Instructions de déploiement
 Avant déploiement, configurer la DB et les variables d'environnement via la gem figaro.
 
 Pour serveur web, j'ai utilisé Nginx avec phusion passenger. https://www.phusionpassenger.com/
