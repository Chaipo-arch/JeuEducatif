extends Node

static var array : Array= []

static func charger():
	array.append(Question.new("Parmi les 4 réponses laquelle correspond à des langages de programmation ?", "HTML, CSS, PHP", ["htp, yop", "youtube, google, dailymotion", "je sais pas"]))
	array.append(Question.new("Pourquoi ce lien est-il dangereux ? http://fakeYoutube.dll", "Le fake est l'extension ne porte pas confiance", ["Il n'est pas dangereux", "je sais pas", "A cause du fake"]))
	array.append(Question.new("Parmi les 4 réponses laquelle définit ce qu'est un logiciel ?", "Un programme pour ordinateur", ["Un composant d’ordinateur", "C’est le mode hors connexion de l’ordinateur", "C’est un mot pour dire site web"]))
	array.append(Question.new("Parmi les 4 réponses laquelle définit ce qu'est un composant d’ordinateur ?", "C’est un élément qui fait fonctionner l’ordinateur", ["C’est un programme de l’ordinateur", "C’est une touche du clavier", "C’est un élément qui permet de charger l’ordinateur"]))
	array.append(Question.new("Excel c’est quoi ?", "C’est un logiciel qui permet de faire des calculs et gérer des données", ["Un logiciel de communication", "Un logiciel de partage de données", "Un réseau social"]))
	array.append(Question.new("Parmi les 4 réponses laquelle définit ce qu'est un programme ?", "Une suite d’instructions que l’ordinateur comprend", ["Quelque chose qui aide pour programmer", "Un logiciel qui aide l’utilisateur de l’ordinateur", "Un élément affiché sur l’écran"]))
	array.append(Question.new("A quoi sert un moteur de recherche ?", "Cela sert à consulter des informations avec une suite de mots", ["Cela permet de démarrer l’ordinateur", "Cela permet de programmer", "Cela donne le niveau de batterie de l’ordinateur"]))
	array.append(Question.new("Parmi les 4 réponses laquelle correspond à un moteur de recherche ?", "Google", ["chrone", "Boing", "Youpi"]))
	array.append(Question.new("Parmi les 4 réponses laquelle définit ce qu'est un virus sur un ordinateur ?", "Un programme malveillant", ["Une maladie de l’ordinateur", "Un élément qui augmente la puissance de l’ordinateur", " Un programme qui aide à faire fonctionner l’ordinateur"]))
	array.append(Question.new("Parmi les 4 réponses laquelle correspond au nom des logiciels qui détectent les virus ?", "Un antivirus", ["Un détecteur de virus", "Norton", " Un attrapeur de virus"]))
	array.append(Question.new("Une donnée est sauvegardée quand … ?", "Elle est enregistrée", ["Elle est effacée", "Elle est partagée", " Elle est dupliquée"]))
	array.append(Question.new("A quoi sert GMAIL ?", "Cela permet de partager des documents et des messages", ["Cela sert à calculer", "Cela sert à jouer au jeu vidéo", "Cela sert à regarder des vidéos"]))
	array.append(Question.new("Parmi les 4 réponses laquelle correspond à un logiciel ?", "Word", ["Google", "Fornite", "Youtube"]))
	array.append(Question.new("Le logiciel WORD permet de … ?", "Modifier du texte", ["Gérer des fichiers", "Gérer le stockage de l’ordinateur", "Modifier un fichier vidéo"]))
	array.append(Question.new("Un fichier .mp4 est un fichier … ?", "Un fichier vidéo", ["Un fichier sonore", "Une image", "Un fichier texte"]))
	array.append(Question.new("Un fichier .mp3 est un fichier … ?", "Un fichier sonore", ["Un dossier", "Un fichier texte", "Un fichier vidéo"]))
	array.append(Question.new("Un fichier .txt est un fichier … ?", "Texte", ["Exécutable", "Document", "Vidéo"]))
	array.append(Question.new("Windows sur un ordinateur est un(e) … ?", "Système d’exploitation", ["une fenêtre", "Un composant de l’ordinateur", "C'est un autre nom pour dire un programme"]))
	array.append(Question.new("Un ordinateur permet de … ?", "gérer des fichiers et lancer des programmes", ["ordonner des choses", "réchauffer", "créer de l’énergie"]))
	array.append(Question.new("Un élément est supprimé quand … ?", "il est irrécupérable", ["placer dans la corbeille", "copier puis coller", "partagé"]))
	array.append(Question.new("Combien de temps passent les jeunes sur leur téléphone ?", "4 heures et 45 minutes", ["10 heures", "10 minutes", "1 heure"]))
	array.append(Question.new("C’est quoi le cyberHarcèlement ?", "C’est comme le harcèlement mais à partir d’un matériel électronique comme un téléphone", ["C’est une attaque de robot", "Ce n’est pas différent de l'harcèlement", "Je ne sais pas"]))
	array.append(Question.new("Wikipédia est un … ?", "Site web", ['Logiciel', "Calculateur", "Nom d’un élément informatique"]))
	array.append(Question.new("Instagram est un … ?", "réseau social", ["serveur", "un outil de programmation", "un éditeur de texte"]))
	array.append(Question.new("Combien de personnes utilisent Instagram par jour ?", "500 millions", ["2 milliards", "1 million", "Ma famille et moi"]))
	array.append(Question.new("Youtube est un … ?", "service de lecture de vidéo", ["outil pour lire les fichiers .mp4", "outil pour modifier les vidéos", "outil pour parler avec des personnes"]))
	array.append(Question.new(" “Mon_fichier” est stocké dans mon disque D dans un dossier “mon_dossier” quel est son chemin d'accès ?", "D:/mon_dossier/Mon_fichier", ["stockage/disqueD/Mon_fichier", " mon_dossier/D/Mon_fichier", " Mon_fichier/D/mon_dossier"]))
	array.append(Question.new("Lorsque je navigue sur internet je laisse … ?", "des informations personnelles", ["des fichiers", "des images", "des vidéos"]))
	array.append(Question.new("Une image soumise à des droits d’auteur signifie …?", "qu'elle est protégée", ["qu'elle peut être vendue", "qu'elle peut être libre de droit", " qu’un auteur a partagé son image pour tout le monde"]))	
func _ready():
	
	print_debug(array.size())
	
const Reponse = preload("res://Reponse.gd")

static func choseAleaQ2() -> Question:
	if(array.size() == 0) :
		charger()
	var index = randi() % array.size()
	var q = array[index]
	array.erase(index)
	array.pop_at(index)
	return q
	
func chooseAleaQ() -> Question:
	
	var index = randi() % array.size()
	return array[index]


class Question:
	var textQuestion : String
	var correcte : String
	var ReponsesFausses : Array

	func _init(text: String, ReponseJuste: String, faux: Array):
		self.textQuestion = text
		self.correcte = ReponseJuste
		
		
		self.ReponsesFausses = []
		for element in faux:
			var reponseFausse = element
			self.ReponsesFausses.append(reponseFausse)
		
	func assignQuestion(text: String, ReponseJuste: String, faux: Array) :
		self.textQuestion = text
		self.correcte = ReponseJuste
		for element in faux:
			var reponseFausse = element
			ReponsesFausses.append(reponseFausse)
	
