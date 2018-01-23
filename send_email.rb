require 'gmail'
require 'rubygems'
require 'google_drive'

def send_email_to_line(dest, town) # Création de la premiere fonction qui prend comme argument le destinaitre ( laddresse email) et la town ( la nom de la ville)
gmail = Gmail.connect("TonEmail", "TonPassword") # Connexion au compte Gmail qui va nous servir a envoyer les mails.
if  gmail.logged_in? == true then # Verification de la connexion (si True => on passe direct a la préparation d'envoi)
puts "preparing email ..." 
end
		gmail.deliver do # je demande au compte connecté gmail de faire l'action : envoyer un mail au destinataire contenu dans la variable DEST. 
			to dest 
			subject "Découvrez The Hacking Project !"
  			html_part do # 

  			content_type 'text/html; charset=UTF-8' 
  			body get_the_email_html(town) # J'appel la fonction qui renvoi le contenu de mon texte HTML avec comme argument la valeur town recu en debut de fonction.
  			end
  		end

puts "sent"
gmail.logout
end

	
def go_through_all_the_lines()# Création de la méthode qui permet de récupérer les emails de chacune des lignes contenu dans le googlesheet.
	g_session = GoogleDrive::Session.from_config("config.json") # initialisation de la session 
	w_sheet = g_session.spreadsheet_by_key("1rX8FDF7FrF_EMKblnVbYTJ2uRFSGo6T9Ctwd8UFfLt4").worksheets[0] # on définit la variable w_sheet qui contient le lien de partage du google sheet, feuille 1 ( [0])

	(1..w_sheet.num_rows).each do |x| # A partir de la ligne 1 et pour chacune des lignes..
		city_name = w_sheet[x, 1] # la variable city_name est égale à la valeur de la premiere colonne 
		mail_adresse = w_sheet[x, 2] # la variable mail_adresse est égale à la valeur de la deuxieme colonne
		send_email_to_line(mail_adresse, city_name) # on appelle la méthode send_email_to_line qui prend comme argument le mail et la ville.
	end
end


def get_the_email_html(town) # Création de la méthode qui renvoi le code HTML du mail et qui prend comme argument le nom de la ville.

return "<h1>Bonjour</h1
<p>Je m'appelle Jean Michel, je suis moussaillon à <FONT color= #FF8000> <B>THE HACKING PROJECT</B> </FONT>une super formation de code <FONT color= #FF8000> <B>gratuite, ouverte à tous</B></FONT>, sans restriction géographique, ni restriction de niveau. <br> Regardez de plus près :  (http://thehackingproject.org/). <br> Nous apprenons l'informatique via la méthode du <FONT color= #FF8000> <B>peer-learning </B> </FONT>: nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.</p>
<p>Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à <FONT color= #FF8000> <B> #{town}</B> </FONT>, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.<br> Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons, nous serions ravis de travailler avec <FONT color= #FF8000> <B>#{town} </B> </FONT>!</p>
<p>N'hésitez pas ! Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : <FONT color= #FF8000> 06.95.46.60.80 </FONT></p> "

end

go_through_all_the_lines()  
