# Send-Email-THP

L'exercice ici est de créer un programme send_emails.rb, qui va envoyer un email a chaque mairie contenues dans  reprendre chaque colonne d'un googlesheet réalisé à l'aide d'un SCRAPPING, contenant des noms de mairies et des emails de mairies, et qui va envoyer un email à la mairie indiquée. 

- On va donc commencer par créer une méthode go_through_all_the_lines : Elle prendra les emails de chaques lignes.

- On va ensuite la coupler à une méthode send_email_to_line : Elle prendra l'email en colonne B, et lui enverra un message, qui pourra être alterné en fonction du nom de la mairie en colonne A.

- Enfin, on créer une methode get_the_email_html qui récupereras le nom de la ville concernée, et qui renvoie un HTML.

Lien googlesheet : https://docs.google.com/spreadsheets/d/1rX8FDF7FrF_EMKblnVbYTJ2uRFSGo6T9Ctwd8UFfLt4/edit?usp=sharing 
Lien googlesheet a intégrer ( si absent) : 1rX8FDF7FrF_EMKblnVbYTJ2uRFSGo6T9Ctwd8UFfLt4

<B>Tu auras seulement besoin de créer fichier config.json avec tes propres ID client googledrive, ainsi que de rentrer tes propres identifiants et mot de passe gmail pour éxécuter les programmes. </B>
