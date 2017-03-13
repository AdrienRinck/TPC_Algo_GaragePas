{BUT:
ENTREE:
SORTIE:
Type AdressType=ENREGISTREMENT
	Num:ENTIER
	Voie:Chaine
	CP:Chaine
	Ville:Chaine
	Pays:Chaine
	NumTel:Chaine
	Email:Chaine
FinEnregistrement
Type Date=Enregistrement
	Jour:entier
	Mois:entier
	Annee:entier
FinEnregistrement
Type MarqueType=(Renault,Peugeot,Audi,BMW,Lexus)
Type EnergieType=(Essence,Diesel,GPL,Electrique,Hybride)
Type Voitures=ENREGISTREMENT
	Marque:MarqueType
	Modele:Chaine
	Energie:EnergieType
	PuiFisc:Entier
	PuiDYN:Entier
	Couleur:Chaine
	Option:Chaine
	Annee:Entier
	Prixneuf:entier
	Cote:reel
	DateMiseCirc:Date
	Age:Entier
	Plaque:Chaine
FinEnregistrement
Type Tab1=Tableau [1...15] de Voitures
Type Garage=Enregistrement
	Caisse:Tab1
	Nom:Chaine
	Adresse:AdressType
FinEnregistrement
Type Tab12= Tableau [1..2] de Garage
Fonction ValidationDate()
DEBUT
	CAS T2[1].Caisse[i].DateMiseCirc.Mois Parmis 
		1 : DEBUT 
				Si 
FIN 
Procedure GarageAdresse (var T2:Tab12)
Var
	i:Entier
DEBUT
	Ecrire ("Entrez un nom pour le garage numero 1 : ")
	Lire (T2[1).Nom)
	Ecrire ("Puis son adresse :(num,cp,ville)")
	Lire (T2[1].Adresse.Num,T2[1].Adresse.Voie,T2[i].Adresse.CP,T2[1].Adresse.Ville)
	REPETER
		Ecrire ("Entrez le num de phone ")
		Lire (T2[1].Adresse.NumTel)
	JUSQUA longueur(T2[1].Adresse.NumTel)=10
	Ecrire ("Veuillez entrer l adresse mail")
	Lire (T2[1].Adresse.Email)
	Ecrire ("Entrez un nom pour le garage num 2")
	Lire (T2[2].Nom)
	Ecrire ("Puis son adresse :(num,cp,ville)")
	Lire (T2[2].Adresse.Num,T2[2].Adresse.Voie,T2[2].Adresse.CP,T2[2].Adresse.Ville)
	REPETER
		Ecrire ("Entrez le num de phone ")
		Lire (T2[2].Adresse.NumTel)
	JUSQUA longueur(T2[2].Adresse.NumTel)=10
	Ecrire ("Veuillez entrer l adresse mail")
	Lire (T2[2].Adresse.Email)
FinProcedure
Procedure GarageAffichage (var T2:Tab12)
Var
	i:Entier
DEBUT
	Ecrire ("Voici les parametres du garage num 1 :")
	Ecrire ("Garage : ",T2[1].Nom)
	Ecrire ("Adresse : ",T2[1].Adresse.Num,"rue des/de/du ",T2[1].Adresse.Voie," ",T2[1].Adresse.CP," ",T2[1].Adresse.Ville)
	Ecrire ("Num Tel : ",T2[1].Adresse.NumTel)
	Ecrire ("Email : ",T2[1].Adresse.Email)
	Ecrire ("Voici les parametres du garage num 2 :")
	Ecrire ("Garage : ",T2[2].Nom)
	Ecrire ("Adresse : ",T2[2].Adresse.Num,"rue des/de/du ",T2[2].Adresse.Voie," ",T2[2].Adresse.CP," ",T2[2].Adresse.Ville)
	Ecrire ("Num Tel : ",T2[2].Adresse.NumTel)
	Ecrire ("Email : ",T2[2].Adresse.Email)
FinProcedure
Fonction CoteArgusEtAgeV1 (var T2:Tab12;var T1:Tab1;var VoitureG1:Entier):Entier
DEBUT
	T2[1].Caisse[VoitureG1].Age<-  (2017)-(T2[1].Caisse[VoitureG1].Annee)
	CAS T2[1].Caisse[VoitureG1].Age Parmis
		0 : (T2[1].Caisse[VoitureG1].Cote)<-  (T2[1].Caisse[VoitureG1].Prixneuf);
        1 : (T2[1].Caisse[VoitureG1].Cote)<-  (T2[1].Caisse[VoitureG1].Prixneuf)*0.85
        2 : (T2[1].Caisse[VoitureG1].Cote)<-  (T2[1].Caisse[VoitureG1].Prixneuf)*0.765
        3 : (T2[1].Caisse[VoitureG1].Cote)<-  (T2[1].Caisse[VoitureG1].Prixneuf)*0.67
	FinCasParmis
	Si T2[1].Caisse[VoitureG1].Age>3 alors
		(T2[1].Caisse[VoitureG1].Cote)<-  0
	FinSI
FinFonction
Fonction CoteArgusEtAgeV2 (var T2:Tab12;var T1:Tab1;var VoitureG2:Entier):Entier
DEBUT
	T2[2].Caisse[VoitureG2].Age<-  (2017)-(T2[2].Caisse[VoitureG2].Annee)
	CAS T2[2].Caisse[VoitureG2].Age Parmis
		0 : (T2[2].Caisse[VoitureG1].Cote)<-  (T2[2].Caisse[VoitureG2].Prixneuf);
        1 : (T2[2].Caisse[VoitureG1].Cote)<-  (T2[2].Caisse[VoitureG2].Prixneuf)*0.85
        2 : (T2[2].Caisse[VoitureG1].Cote)<-  (T2[2].Caisse[VoitureG2].Prixneuf)*0.765
        3 : (T2[2].Caisse[VoitureG1].Cote)<-  (T2[2].Caisse[VoitureG2].Prixneuf)*0.67
	FinCasParmis
	Si T2[2].Caisse[VoitureG2].Age>3 alors
		(T2[2].Caisse[VoitureG2].Cote)<-  0
	FinSI
FinFonction
Procedure Garage1 (var T1:Tab1; var T2:Tab12; var VoitureG1:Entier)
var
	j:entier
	MaChaine:Chaine
DEBUT
	Ecrire("Vous entrez la voiture numero ",VoitureG1," Dans le garage 1");
    Ecrire("Entrez la marque du vehicule :");
    Ecrire("Renault / Peugeot / Audi / BMW / Ferrari");
    Lire(T2[1].Caisse[VoitureG1].Marque);
    Ecrire("Entrez le modele du vehicule");
    Lire(T2[1].Caisse[VoitureG1].Modele);
    Ecrire("Quel energie utilise elle ?");
    Ecrire("Essence / Diesel / GPL / Electrique / Hybride");
    Lire(T2[1].Caisse[VoitureG1].energie);
    Ecrire("Indiquez la puissance fiscal");
    Lire(T2[1].Caisse[VoitureG1].PuiFisc);
    Ecrire("Entrez la puissance dynamique");
    Lire(T2[1].Caisse[VoitureG1].PuiDyn);
    Ecrire("Quel est la couleur du vehicule ?");
    Lire(T2[1].Caisse[VoitureG1].Couleur);
    Ecrire("De quels options disposent-elle ?");
    Lire(T2[1].Caisse[VoitureG1].Option);
	REPETER
		Ecrire ("Indiquez l annee du mode (1990 minimum)")
		Lire (T2[1].Caisse[VoitureG1].annee)
	JUSQUA (T2[1].Caisse[VoitureG1].annee>=1990) ET (T2[1].Caisse[VoitureG1].annee<=2017)
	FinRepeter
	Ecrire ("Entrez la valeur a neuf du vehicule")
	Lire (T2[1].Caisse[VoitureG1].Prixneuf)
	CoteArgusEtAgeV1(T2,T1,VoitureG1)
	REPETER
		Ecrire ("Entrez l annee de circulation du modele  1990 mini")
		Lire (T2[1].Caisse[VoitureG1].DateMiseCirc)
	JUSQUA (T2[1].Caisse[VoitureG1].DateMiseCirc>=1990) ET (T2[1].Caisse[VoitureG1].DateMiseCirc<=2017)
	MaChaine=' '
	POUR j de 1 A 9 faire
		Si (j<3) OU (j>7) alors
			Aleatoire
			MaChaine<-  MaChaine+chr(alea(90-48+1)+65)
		FinSi
		Si (j=3) OU (j=7) alors
			MaChaine<- MaChaine+'-'
		FinSi
		Si (j>3) ET (j<7) alors
			Aleatoire
			MaChaine<-  MaChaine+chr(alea(57-48+1)+48)
		FinSi
	FinPour
	T2[1].Caisse[VoitureG1].Plaque<-  MaChaine
	Ecrire ("Plaque d i mmatriculation")
	Ecrire (T2[1].Caisse[VoitureG1].Plaque)
	VoitureG1<-  VoitureG1+1
FinProcedure
Procedure Garage2 (var T1:Tab1; var T2:Tab12; var VoitureG2:Entier)
var
	j:entier
	MaChaine:Chaine
DEBUT
	Ecrire("Vous entrez la voiture numero ",VoitureG2," Dans le garage 2");
    Ecrire("Entrez la marque du vehicule :");
    Ecrire("Renault / Peugeot / Audi / BMW / Ferrari");
    Lire(T2[2].Caisse[VoitureG2].Marque);
    Ecrire("Entrez le modele du vehicule");
    Lire(T2[2].Caisse[VoitureG2].Modele);
    Ecrire("Quel energie utilise elle ?");
    Ecrire("Essence / Diesel / GPL / Electrique / Hybride");
    Lire(T2[2].Caisse[VoitureG2].energie);
    Ecrire("Indiquez la puissance fiscal");
    Lire(T2[2].Caisse[VoitureG2].PuiFisc);
    Ecrire("Entrez la puissance dynamique");
    Lire(T2[2].Caisse[VoitureG2].PuiDyn);
    Ecrire("Quel est la couleur du vehicule ?");
    Lire(T2[2].Caisse[VoitureG2].Couleur);
    Ecrire("De quels options disposent-elle ?");
    Lire(T2[2].Caisse[VoitureG2].Option);
	REPETER
		Ecrire ("Indiquez l annee du mode (1990 minimum)")
		Lire (T2[2].Caisse[VoitureG2].annee)
	JUSQUA (T2[2].Caisse[VoitureG2].annee>=1990) ET (T2[2].Caisse[VoitureG2].annee<=2017)
	FinRepeter
	Ecrire ("Entrez la valeur a neuf du vehicule")
	Lire (T2[2].Caisse[VoitureG2].Prixneuf)
	CoteArgusEtAgeV2(T2,T1,VoitureG2)
	REPETER
		Ecrire ("Entrez l annee de circulation du modele  1990 mini")
		Lire (T2[2].Caisse[VoitureG2].DateMiseCirc)
	JUSQUA (T2[2].Caisse[VoitureG2].DateMiseCirc>=1990) ET (T2[2].Caisse[VoitureG2].DateMiseCirc<=2017)
	MaChaine=' '
	POUR j de 1 A 9 faire
		Si (j<3) OU (j>7) alors
			Aleatoire
			MaChaine<-  MaChaine+chr(alea(90-48+1)+65)
		FinSi
		Si (j=3) OU (j=7) alors
			MaChaine<- MaChaine+'-'
		FinSi
		Si (j>3) ET (j<7) alors
			Aleatoire
			MaChaine<-  MaChaine+chr(alea(57-48+1)+48)
		FinSi
	FinPour
	T2[2].Caisse[VoitureG2].Plaque<-  MaChaine
	Ecrire ("Plaque d i mmatriculation")
	Ecrire (T2[2].Caisse[VoitureG2].Plaque)
	VoitureG2<-  VoitureG2+1
FinProcedure
Procedure VoitureProc (var T1:Tab1; var T2:Tab12; var VoitureG1:Entier; var VoitureG2:Entier)
var
	Choix:Entier
DEBUT
	Voitureg1<- 1
	VoitureG2<- 1
	REPETER
		Ecrire("Entrez le garage dans lequel vous voulez entrez une voiture : 1 ou 2")
		Ecrire("Ou 0 pour quitter")
		Lire (Choix)
		SI Choix=1 alors
			Garage(T1,T2,VoitureG1)
		FinSi
		SI Choix=2 alors
			Garage2(T1,T2,VoitureG2)
		FinSI
	JUSQUA (Choix=0)
	FinRepeter
FinProcedure
Procedure AffichageGarage1(var T2:Tab12; var T1:Tab1; var VoitureG1:Entier)
VAR
	i:Entier
DEBUT
	Ecrire ("Garage Num 1")
	POUR i de 1 A VoitureG1-1 faire
		Ecrire("VOITURE NUMERO ",i);
        Ecrire("MARQUE : ",T2[1].Caisse[i].Marque);
        Ecrire("MODELE : ",T2[1].Caisse[i].Modele);
        Ecrire("ENERGIE : ",T2[1].Caisse[i].Energie);
        Ecrire("PUI. FISCALE : ",T2[1].Caisse[i].PuiFisc);
        Ecrire("PUI. DYNAMIQUE : ",T2[1].Caisse[i].PuiDyn);
        Ecrire("COULEUR : ",T2[1].Caisse[i].Couleur);
        Ecrire("OPTION : ",T2[1].Caisse[i].option);
        Ecrire("ANNEE : ",T2[1].Caisse[i].annee);
        Ecrire("PRIX NEUF : ",T2[1].Caisse[i].Prixneuf);
        Ecrire("COTE : ",T2[1].Caisse[i].cote:1);
        Ecrire("AGE : ",T2[1].Caisse[i].Age);
        Ecrire("DATE MISE EN CIRCU. : ",T2[1].Caisse[i].DateMiseCirc);
        Ecrire("PLAQUE : ",T2[1].Caisse[i].Plaque);
	FinPour
FinProcedure
Procedure AffichageGarage2(var T2:Tab12; var T1:Tab1; var VoitureG2:Entier)
VAR
	i:Entier
DEBUT
	Ecrire ("Garage Num 2")
	POUR i de 1 A VoitureG2-1 faire
		Ecrire("VOITURE NUMERO ",i);
        Ecrire("MARQUE : ",T2[2].Caisse[i].Marque);
        Ecrire("MODELE : ",T2[2].Caisse[i].Modele);
        Ecrire("ENERGIE : ",T2[2].Caisse[i].Energie);
        Ecrire("PUI. FISCALE : ",T2[2].Caisse[i].PuiFisc);
        Ecrire("PUI. DYNAMIQUE : ",T2[2].Caisse[i].PuiDyn);
        Ecrire("COULEUR : ",T2[2].Caisse[i].Couleur);
        Ecrire("OPTION : ",T2[2].Caisse[i].option);
        Ecrire("ANNEE : ",T2[2].Caisse[i].annee);
        Ecrire("PRIX NEUF : ",T2[2].Caisse[i].Prixneuf);
        Ecrire("COTE : ",T2[2].Caisse[i].cote:1);
        Ecrire("AGE : ",T2[2].Caisse[i].Age);
        Ecrire("DATE MISE EN CIRCU. : ",T2[2].Caisse[i].DateMiseCirc);
        Ecrire("PLAQUE : ",T2[2].Caisse[i].Plaque);
	FinPour
FinProcedure
Procedure VoitureAncien (var T2:Tab12;var T1:Tab1;var TStockage:Tab1;var VoitureG1:Entier;var VoitureG2:Entier)
var
	i,j:Entier
DEBUT
	TStockage[1].Age<- 0
	Pour i de 1 a VoitureG1-1 faire
		Si T2[1].Caisse[i].Age>TStockage[1].Age alors
			TStockage[1].Marque<-T2[1].Caisse[i].Marque
            TStockage[1].Modele<-T2[1].Caisse[i].Modele
            TStockage[1].Energie<-T2[1].Caisse[i].Energie
            TStockage[1].PuiFisc<-T2[1].Caisse[i].PuiFisc
            TStockage[1].PuiDyn<-T2[1].Caisse[i].PuiDyn
            TStockage[1].Couleur<-T2[1].Caisse[i].Couleur
            TStockage[1].Option<-T2[1].Caisse[i].Option
            TStockage[1].annee<-T2[1].Caisse[i].annee
            TStockage[1].Prixneuf<-T2[1].Caisse[i].Prixneuf
            TStockage[1].cote<-T2[1].Caisse[i].cote
            TStockage[1].Age<-T2[1].Caisse[i].Age
            TStockage[1].DateMiseCirc<-T2[1].Caisse[i].DateMiseCirc
            TStockage[1].Plaque<-T2[1].Caisse[i].Plaque
		FinSI
	FinPour
	POUR i de 1 a VoitureG2-1 faire
		SI T2[2].Caisse[i].Age>TStockage[1].Age faire
			TStockage[1].Marque<-T2[2].Caisse[i].Marque
            TStockage[1].Modele<-T2[2].Caisse[i].Modele
            TStockage[1].Energie<-T2[2].Caisse[i].Energie
            TStockage[1].PuiFisc<-T2[2].Caisse[i].PuiFisc
            TStockage[1].PuiDyn<-T2[2].Caisse[i].PuiDyn
            TStockage[1].Couleur<-T2[2].Caisse[i].Couleur
            TStockage[1].Option<-T2[2].Caisse[i].Option
            TStockage[1].annee<-T2[2].Caisse[i].annee
            TStockage[1].Prixneuf<-T2[2].Caisse[i].Prixneuf
            TStockage[1].cote<-T2[2].Caisse[i].cote
            TStockage[1].Age<-T2[2].Caisse[i].Age
            TStockage[1].DateMiseCirc<-T2[2].Caisse[i].DateMiseCirc
            TStockage[1].Plaque<-T2[2].Caisse[i].Plaque
		FinSI
	FinPour
	Ecrire("VOICI LA VOITURE LA PLUS ANCIENNE : "")
    Ecrire("MARQUE : ",TStockage[1].Marque)
    Ecrire("MODELE : ",TStockage[1].Modele)
    Ecrire("ENERGIE : ",TStockage[1].Energie)
    Ecrire("PUI. FISCALE : ",TStockage[1].PuiFisc)
    Ecrire("PUI. DYNAMIQUE : ",TStockage[1].PuiDyn)
    Ecrire("COULEUR : ",TStockage[1].Couleur)
    Ecrire("OPTION : ",TStockage[1].option)
    Ecrire("ANNEE : ",TStockage[1].annee)
    Ecrire("PRIX NEUF : ",TStockage[1].Prixneuf)
    Ecrire("COTE : ",TStockage[1].cote:1)
    Ecrire("AGE : ",TStockage[1].Age)
    Ecrire("DATE MISE EN CIRCU. : ",TStockage[1].DateMiseCirc)
    Ecrire("PLAQUE : ",TStockage[1].Plaque)
FinProcedure
Procedure VoitureMoyenne (var T2:Tab12;var T1:Tab1; var VoitureG1:Entier;var VoitureG2:Entier)
var
	i,MoyenneG1,MoyenneG2,Moyenne:Entier
DEBUT
	MoyenneG1<- 0
	MoyenneG2<- 0
	Moyenne<- 0
	Pour i de 1 a VoitureG1-1 faire
		MoyenneG1<- (MoyenneG1+T2[1].Caisse[i].Prixneuf)
	FinPour
	MoyenneG1<- (MoyenneG1 DIV (VoitureG1-1))
	Pour i de 1 a VoitureG2-1 faire
		MoyenneG2<- (MoyenneG2+T2[2].Caisse[i].Prixneuf)
    FinPour
    MoyenneG2:=(MoyenneG2 DIV (VoitureG2-1))
    Moyenne:=MoyenneG1+MoyenneG2
    Moyenne:=(Moyenne DIV 2
	Ecrire ("La moyenne du prix neuf des voitures du garage 1 est : ")
	Ecrire (MoyenneG1)
	Ecrire ("La moyenne du prix neuf des  voitures du garage 2 est : ")
	Ecrire (MoyenneG2)
	Ecrire ("La moyenne du prix neuf des vehicules est : ")
	Ecrire (Moyenne)
FinProcedure
Procedure VoitureCher(var T2:Tab12;var T1:Tab1;var TStockage:Tab1;var VoitureG1:Entier; var VoitureG2:Entier)
Var
	i,j:Entier
DEBUT
	TStockage[2].Prineuf<- 0
	POUR i de 1 a VoitureG1-1 faire
		SI T2[1].Caisse[i].Prixneuf>TStockage[2].Prixneuf alors
			 TStockage[1].Marque<-T2[1].Caisse[i].Marque
             TStockage[1].Modele<-T2[1].Caisse[i].Modele
             TStockage[1].Energie<-T2[1].Caisse[i].Energie
             TStockage[1].PuiFisc<-T2[1].Caisse[i].PuiFisc
             TStockage[1].PuiDyn<-T2[1].Caisse[i].PuiDyn
             TStockage[1].Couleur<-T2[1].Caisse[i].Couleur
             TStockage[1].Option<-T2[1].Caisse[i].Option
             TStockage[1].annee<-T2[1].Caisse[i].annee
             TStockage[1].Prixneuf<-T2[1].Caisse[i].Prixneuf
             TStockage[1].cote<-T2[1].Caisse[i].cote
             TStockage[1].Age<-T2[1].Caisse[i].Age
             TStockage[1].DateMiseCirc<-T2[1].Caisse[i].DateMiseCirc
             TStockage[1].Plaque<-T2[1].Caisse[i].Plaque
		FinSI
	FinPour
	Pour i de 1 a VoitureG2-1 faire
		SI T2[2].Caisse[i].Prixneuf>TStockage[2].Prixneuf alors
			TStockage[2].Marque:=T2[2].Caisse[i].Marque
			TStockage[2].Modele:=T2[2].Caisse[i].Modele
			TStockage[2].Energie:=T2[2].Caisse[i].Energie
			TStockage[2].PuiFisc:=T2[2].Caisse[i].PuiFisc
			TStockage[2].PuiDyn:=T2[2].Caisse[i].PuiDyn
			TStockage[2].Couleur:=T2[2].Caisse[i].Couleur
			TStockage[2].Option:=T2[2].Caisse[i].Option
			TStockage[2].annee:=T2[2].Caisse[i].annee
			TStockage[2].Prixneuf:=T2[2].Caisse[i].Prixneuf
			TStockage[2].cote:=T2[2].Caisse[i].cote
			TStockage[2].Age:=T2[2].Caisse[i].Age
			TStockage[2].DateMiseCirc:=T2[2].Caisse[i].DateMiseCirc
			TStockage[2].Plaque:=T2[2].Caisse[i].Plaque
		FinSi
	FinPour
	Ecrire("VOICI LA VOITURE LA PLUS CHERE : ")
	Ecrire("MARQUE : ",TStockage[2].Marque)
	Ecrire("MODELE : ",TStockage[2].Modele)
	Ecrire("ENERGIE : ",TStockage[2].Energie)
	Ecrire("PUI. FISCALE : ",TStockage[2].PuiFisc)
	Ecrire("PUI. DYNAMIQUE : ",TStockage[2].PuiDyn)
	Ecrire("COULEUR : ",TStockage[2].Couleur)
	Ecrire("OPTION : ",TStockage[2].option)
	Ecrire("ANNEE : ",TStockage[2].annee)
	Ecrire("PRIX NEUF : ",TStockage[2].Prixneuf)
	Ecrire("COTE : ",TStockage[2].cote:1)
	Ecrire("AGE : ",TStockage[2].Age)
	Ecrire("DATE MISE EN CIRCU. : ",TStockage[2].DateMiseCirc)
	Ecrire("PLAQUE : ",TStockage[2].Plaque)
FinProcedure
Procedure Affichage (var T2:Tab12;var T1:Tab1; var VoitureG1:Entier;var VoitureG2:Entier;var TStockage:Tab1)
var
	Nb:entier
DEBUT
	REPETER
		REPETER
			Ecrire("Entrez :")
            Ecrire("0 : Pour sortir")
            Ecrire("1 : Affichage des deux garages")
            Ecrire("2 : Affichage du garage qui a le plus de vehicule")
            Ecrire("3 : Affichage du vehicule le plus ancien")
            Ecrire("4 : Affichage de la moyenne de valeurs des vehicule par garage")
            Ecrire("5 : Affichage du vehicule le plus cher neuf")
			Lire (Nb)
		JUSQUA (Nb>=0) ET (Nb<6)
		FinRepeter
		CAS Nb PARMIS
			1 :  AffichageGarage1(T2,T1,VoitureG1)
                 AffichageGarage2(T2,T1,VoitureG2)
            2:	 if VoitureG1<VoitureG2 then
					AffichageGarage2(T2,T1,VoitureG2)
                else AffichageGarage1(T2,T1,VoitureG1)
            3 : VoitureAncien(T2,T1,TStockage,VoitureG1,VoitureG2)
            4 : VoitureMoyenne(T2,T1,VoitureG1,VoitureG2)
            5 : VoitureCher(T2,T1,TStockage,VoitureG1,VoitureG2)
	JUSQUA Nb=0
	FinRepeter
FinProcedure
Var
	T1:Tableau [1..15] de Voitures
	T2:Tableau[1..2] de Garage
	TStockage:Tableau [1..15] de Voitures
	Choix,VoitureG1,VoitureG2,i:Entier
	ChaineEmail:Chaine
DEBUT
	GarageAdresse(T2)
	GarageAffichage(T2)
	VoitureProc(T1,T2,VoitureG1,VoitureG2)
	Affichage(T2,T1,VoitureG1,VoitureG2,TStockage)
FIN.

}
Program Garag;
uses crt,dateutils;

Type AdressType=Record
	Num:integer;
	Voie:String;
	CP:String;
	Ville:String;
	Pays:String;
	NumTel:String;
	Email:string;
End;
Type MarqueType=(Renault,Peugeot,Audi,BMW,Ferrari);
Type EnergieType=(Essence,Diesel,GPL,Electrique,Hybride);
Type Date=record
	Jour:integer;
	Mois:integer;
	Annee:integer;
End;
Type Voitures=Record
	Marque:MarqueType;
	Modele:String;
	Energie:EnergieType;
	PuiFisc:integer;
	PuiDyn:integer;
	Couleur:String;
	Option:String;
	Annee:integer;
	Prixneuf:integer;
	Cote:real;
	DateMiseCirc:Date;
	Age:integer;
	Plaque:String;
End;
Type Tabl=Array [1..15] of Voitures;
Type Garage=Record
	Caisse:Tabl;
	Nom:String;
	Adresse:AdressType;
End;
Type Tabl2=Array [1..2] of Garage;
Procedure GarageAdresse (var T2:Tabl2);
var
        i:integer;
Begin
	clrscr;
	Writeln('Entrez un nom pour le garage numero 1 : ');
	Readln(T2[1].Nom);
	Writeln('Puis son adresse comme ceci : 3 ((a ne pas mettre)rue des) Fleurs 68720 Flax');
	Readln(T2[1].Adresse.Num,T2[1].Adresse.Voie,T2[1].Adresse.CP,T2[1].Adresse.Ville);
	Repeat
		Writeln('Entrez le numero de telephone : ');
		Readln(T2[1].Adresse.NumTel);
	Until Length(T2[1].Adresse.NumTel)=10;
	Writeln('Puis l''adresse mail');
	Readln(T2[1].Adresse.Email);
	clrscr;
	Writeln('Entrez un nom pour le garage numero 2 : ');
	Readln(T2[2].Nom);
	Writeln('Puis son adresse comme ceci : ((ne pas mettre)rue des) 3 Fleurs 68720 Flax');
	Readln(T2[2].Adresse.Num,T2[2].Adresse.Voie,T2[2].Adresse.CP,T2[2].Adresse.Ville);
	Repeat
		Writeln('Entrez le numero de telephone : ');
		Readln(T2[2].Adresse.NumTel);
	Until Length(T2[2].Adresse.NumTel)=10;
	Writeln('Puis l''adresse mail');
	Readln(T2[2].Adresse.Email);
End;
Procedure GarageAffichage (var T2:Tabl2);
Var
	i:integer;
Begin
	clrscr;
	Writeln('VOICI LES PARAMETRES DU GARAGE NUM 1 : ');
	Writeln('Garage : ',T2[1].Nom);
	Writeln('Adresse : ',T2[1].Adresse.Num,' rue des/de/du ',T2[1].Adresse.Voie,' ',T2[1].Adresse.CP,' ',T2[1].Adresse.Ville);
	Writeln('Num Tel : ',T2[1].Adresse.NumTel);
	Writeln('Email : ', T2[1].Adresse.Email);
	Writeln;
	Readln;
	Writeln('VOICI LES PARAMETRES DU GARAGE NUM 2 : ');
	Writeln('Garage : ',T2[2].Nom);
	Writeln('Adresse : ',T2[2].Adresse.Num,' rue des/de/du ',T2[2].Adresse.Voie,' ',T2[2].Adresse.CP,' ',T2[2].Adresse.Ville);
	Writeln('Num Tel : ',T2[2].Adresse.NumTel);
	Writeln('Email : ', T2[2].Adresse.Email);
	Readln;
End;	
Function CoteArgusEtAgeV1 (var T2:Tabl2; var T1:Tabl; var VoitureG1:integer):integer;
Begin
	T2[1].Caisse[VoitureG1].Age:=(2017)-(T2[1].Caisse[VoitureG1].Annee);	
	Case T2[1].Caisse[VoitureG1].Age of
		0 : (T2[1].Caisse[VoitureG1].Cote):=(T2[1].Caisse[VoitureG1].Prixneuf);
		1 : (T2[1].Caisse[VoitureG1].Cote):=(T2[1].Caisse[VoitureG1].Prixneuf)*0.85;
		2 : (T2[1].Caisse[VoitureG1].Cote):=(T2[1].Caisse[VoitureG1].Prixneuf)*0.765;
		3 : (T2[1].Caisse[VoitureG1].Cote):=(T2[1].Caisse[VoitureG1].Prixneuf)*0.67;
		end;
			if T2[1].Caisse[VoitureG1].Age>3 then
				(T2[1].Caisse[VoitureG1].Cote):=0;
End;
Function CoteArgusEtAgeV2 (var T2:Tabl2; var T1:Tabl; var VoitureG2:integer):integer;
Begin
	T2[2].Caisse[VoitureG2].Age:=(2017)-(T2[2].Caisse[VoitureG2].Annee);	
	Case T2[2].Caisse[VoitureG2].Age of
		0 : (T2[2].Caisse[VoitureG2].Cote):=(T2[2].Caisse[VoitureG2].Prixneuf);
		1 : (T2[2].Caisse[VoitureG2].Cote):=(T2[2].Caisse[VoitureG2].Prixneuf)*0.85;
		2 : (T2[2].Caisse[VoitureG2].Cote):=(T2[2].Caisse[VoitureG2].Prixneuf)*0.765;
		3 : (T2[2].Caisse[VoitureG2].Cote):=(T2[2].Caisse[VoitureG2].Prixneuf)*0.67;
		end;
		if T2[2].Caisse[VoitureG2].Age>3 then
			(T2[2].Caisse[VoitureG2].Cote):=0;
End;
Procedure Garage1 (var T1:Tabl; var T2:Tabl2; var VoitureG1:integer);
var
	j:integer;
	MaChaine:string;
Begin
	Writeln('Vous entrez la voiture numero ',VoitureG1,' Dans le garage 1');
	Writeln('Entrez la marque du vehicule :');
	Writeln('Renault / Peugeot / Audi / BMW / Ferrari');
	Readln(T2[1].Caisse[VoitureG1].Marque);
	Writeln('Entrez le modele du vehicule');
	Readln(T2[1].Caisse[VoitureG1].Modele);
	Writeln('Quel energie utilise elle ?');
	Writeln('Essence / Diesel / GPL / Electrique / Hybride');
	Readln(T2[1].Caisse[VoitureG1].energie);
	Writeln('Indiquez la puissance fiscal');
	Readln(T2[1].Caisse[VoitureG1].PuiFisc);
	Writeln('Entrez la puissance dynamique');
	Readln(T2[1].Caisse[VoitureG1].PuiDyn);
	Writeln('Quel est la couleur du vehicule ?');
	Readln(T2[1].Caisse[VoitureG1].Couleur);
	Writeln('De quels options disposent-elle ?');
	Readln(T2[1].Caisse[VoitureG1].Option);
	Repeat
		Writeln('Indiquez l''annee du modele - 1990 minimum');
		Readln(T2[1].Caisse[VoitureG1].annee);
	Until (T2[1].Caisse[VoitureG1].annee>=1990) AND (T2[1].Caisse[VoitureG1].annee<=2017);
	Writeln('Entrez la valeur neuf du vehicule');
	Readln(T2[1].Caisse[VoitureG1].Prixneuf);
	CoteArgusEtAgeV1(T2,T1,VoitureG1);
	Repeat
		Writeln('Entree la date de mise en de circulation du modele - ');
		Readln(T2[1].Caisse[VoitureG1].DateMiseCirc.Jour,T2[1].Caisse[VoitureG1].DateMiseCirc.Mois,T2[1].Caisse[VoitureG1].DateMiseCirc.Annee);
	Until IsValidDate(T2[1].Caisse[VoitureG1].DateMiseCirc.Annee,T2[1].Caisse[VoitureG1].DateMiseCirc.Mois,T2[1].Caisse[VoitureG1].DateMiseCirc.Jour);
	MaChaine:=' ';
	For j:=1 to 9 do
		begin
			If (j<3) OR (j>7) then
			Begin
				Randomize;
				MaChaine:=MaChaine+chr(random(90-48+1)+65);
			End;
			If (j=3) OR (j=7)  then
				MaChaine:=MaChaine+'-';
			If (j>3) AND (j<7) then
			Begin
				Randomize;
				MaChaine:=MaChaine+chr(random(57-48+1)+48);
			End;
		end;
	T2[1].Caisse[VoitureG1].Plaque:=MaChaine;
	Writeln('Plaque d''imatriculation');
	Writeln(T2[1].Caisse[VoitureG1].Plaque);
	Readln;
	VoitureG1:=VoitureG1+1
End;
Procedure Garage2 (var T1:Tabl; var T2:Tabl2; var VoitureG2:integer);
var
	j:integer;
	MaChaine:string;
Begin
	Writeln('Vous entrez la voiture numero ',VoitureG2,' Dans le garage 2');
	Writeln('Entrez la marque du vehicule :');
	Writeln('Renault / Peugeot / Audi / BMW / Ferrari');
	Readln(T2[2].Caisse[VoitureG2].Marque);
	Writeln('Entrez le modele du vehicule');
	Readln(T2[2].Caisse[VoitureG2].Modele);
	Writeln('Quel energie utilise elle ?');
	Writeln('Essence / Diesel / GPL / Electrique / Hybride');
	Readln(T2[2].Caisse[VoitureG2].energie);
	Writeln('Indiquez la puissance fiscal');
	Readln(T2[2].Caisse[VoitureG2].PuiFisc);
	Writeln('Entrez la puissance dynamique');
	Readln(T2[2].Caisse[VoitureG2].PuiDyn);
	Writeln('Quel est la couleur du vehicule ?');
	Readln(T2[2].Caisse[VoitureG2].Couleur);
	Writeln('De quels options disposent-elle ?');
	Readln(T2[2].Caisse[VoitureG2].Option);
	Repeat
		Writeln('Indiquez l''annee du modele - 1990 minimum');
		Readln(T2[2].Caisse[VoitureG2].annee);
	Until (T2[2].Caisse[VoitureG2].annee>=1990) AND (T2[2].Caisse[VoitureG2].annee<=2017);
	Writeln('Entrez la valeur neuf du vehicule');
	Readln(T2[2].Caisse[VoitureG2].Prixneuf);
	CoteArgusEtAgeV2(T2,T1,VoitureG2);	
   Repeat
		Writeln('Entree la date de mise en de circulation du modele - ');
		Readln(T2[2].Caisse[VoitureG2].DateMiseCirc.Jour,T2[2].Caisse[VoitureG2].DateMiseCirc.Mois,T2[2].Caisse[VoitureG2].DateMiseCirc.Annee);
	Until IsValidDate(T2[2].Caisse[VoitureG2].DateMiseCirc.Annee,T2[2].Caisse[VoitureG2].DateMiseCirc.Mois,T2[2].Caisse[VoitureG2].DateMiseCirc.Jour);
	MaChaine:=' ';
	For j:=1 to 9 do
		begin
			If (j<3) OR (j>7) then
			Begin
				Randomize;
				MaChaine:=MaChaine+chr(random(90-48+1)+65);
			End;
			If (j=3) OR (j=7)  then
				MaChaine:=MaChaine+'-';
			If (j>3) AND (j<7) then
			Begin
				Randomize;
				MaChaine:=MaChaine+chr(random(57-48+1)+48);
			End;
		end;
	T2[2].Caisse[VoitureG2].Plaque:=MaChaine;
	Writeln('Plaque d''imatriculation');
	Writeln(T2[2].Caisse[VoitureG2].Plaque);
	Readln;
	VoitureG2:=VoitureG2+1
End;
Procedure VoitureProc (var T1:Tabl; var T2:Tabl2; var VoitureG1:integer; var VoitureG2:integer);
var
	Choix:integer;
Begin
	VoitureG1:=1;
	VoitureG2:=1;
	Repeat
		clrscr;
		Writeln('Entrez le garage dans lequel vous voulez entrez une voiture : 1 ou 2');
		Writeln('Ou 0 pour quitter');
		Readln(Choix);
	If Choix=1 then
		Begin
			Garage1(T1,T2,VoitureG1);
		End;
	If Choix=2 then
		Begin 	
			Garage2(T1,T2,VoitureG2);
		End;
	Until (Choix=0);
End;
Procedure AffichageGarage1(var T2:Tabl2; var T1:Tabl; var VoitureG1:integer);
Var	
	i:integer;
Begin
	clrscr;
	Writeln('GARAGE NUMERO 1');
	For i:=1 to VoitureG1-1 do
		Begin
			Writeln('VOITURE NUMERO ',i);
			Writeln('MARQUE : ',T2[1].Caisse[i].Marque);
			Writeln('MODELE : ',T2[1].Caisse[i].Modele);
			Writeln('ENERGIE : ',T2[1].Caisse[i].Energie);
			Writeln('PUI. FISCALE : ',T2[1].Caisse[i].PuiFisc);
			Writeln('PUI. DYNAMIQUE : ',T2[1].Caisse[i].PuiDyn);
			Writeln('COULEUR : ',T2[1].Caisse[i].Couleur);
			Writeln('OPTION : ',T2[1].Caisse[i].option);
			Writeln('ANNEE : ',T2[1].Caisse[i].annee);
			Writeln('PRIX NEUF : ',T2[1].Caisse[i].Prixneuf);
			Writeln('COTE : ',T2[1].Caisse[i].cote:1);
			Writeln('AGE : ',T2[1].Caisse[i].Age);
	        Writeln('DATE MISE EN CIRCU. : ',T2[1].Caisse[i].DateMiseCirc.Jour,' ',T2[1].Caisse[i].DateMiseCirc.Mois,' ',T2[1].Caisse[i].DateMiseCirc.Annee);
			Writeln('PLAQUE : ',T2[1].Caisse[i].Plaque);
			Writeln;
			Readln;
		End;
End;
Procedure AffichageGarage2 (var T2:Tabl2; var T1:Tabl; var VoitureG2:integer);
Var
	i:integer;
Begin
	Writeln('GARAGE NUMERO 2');
	For i:=1 to VoitureG2-1 do
		Begin
			Writeln('VOITURE NUMERO ',i);
			Writeln('MARQUE : ',T2[2].Caisse[i].Marque);
			Writeln('MODELE : ',T2[2].Caisse[i].Modele);
			Writeln('ENERGIE : ',T2[2].Caisse[i].Energie);
			Writeln('PUI. FISCALE : ',T2[2].Caisse[i].PuiFisc);
			Writeln('PUI. DYNAMIQUE : ',T2[2].Caisse[i].PuiDyn);
			Writeln('COULEUR : ',T2[2].Caisse[i].Couleur);
			Writeln('OPTION : ',T2[2].Caisse[i].option);
			Writeln('ANNEE : ',T2[2].Caisse[i].annee);
			Writeln('PRIX NEUF : ',T2[2].Caisse[i].Prixneuf);
			Writeln('COTE : ',T2[2].Caisse[i].cote:1);
			Writeln('AGE : ',T2[2].Caisse[i].Age);
		    Writeln('DATE MISE EN CIRCU. : ',T2[2].Caisse[i].DateMiseCirc.Jour,' ',T2[2].Caisse[i].DateMiseCirc.Mois,' ',T2[2].Caisse[i].DateMiseCirc.Annee);
			Writeln('PLAQUE : ',T2[2].Caisse[i].Plaque);
			Writeln;
			Readln;
		End;
	Readln;
End;
Procedure VoitureAncien (var T2:Tabl2; var T1:Tabl; var TStockage:Tabl; var VoitureG1:integer; var VoitureG2:integer);
var
	i,j:integer;
	Begin
	TStockage[1].Age:=0;
		For i:=1 to VoitureG1-1 do
			Begin 	
				if T2[1].Caisse[i].Age>TStockage[1].Age then
					Begin
						TStockage[1].Marque:=T2[1].Caisse[i].Marque;
						TStockage[1].Modele:=T2[1].Caisse[i].Modele;
						TStockage[1].Energie:=T2[1].Caisse[i].Energie;
						TStockage[1].PuiFisc:=T2[1].Caisse[i].PuiFisc;
						TStockage[1].PuiDyn:=T2[1].Caisse[i].PuiDyn;
						TStockage[1].Couleur:=T2[1].Caisse[i].Couleur;
						TStockage[1].Option:=T2[1].Caisse[i].Option;
						TStockage[1].annee:=T2[1].Caisse[i].annee;
						TStockage[1].Prixneuf:=T2[1].Caisse[i].Prixneuf;
						TStockage[1].cote:=T2[1].Caisse[i].cote;
						TStockage[1].Age:=T2[1].Caisse[i].Age;
						TStockage[1].DateMiseCirc:=T2[1].Caisse[i].DateMiseCirc;
						TStockage[1].Plaque:=T2[1].Caisse[i].Plaque;
					End;
			End;
		For i:=1 to VoitureG2-1 do
			Begin
				if T2[2].Caisse[i].Age>TStockage[1].Age then
					Begin 	
						TStockage[1].Marque:=T2[2].Caisse[i].Marque;
						TStockage[1].Modele:=T2[2].Caisse[i].Modele;
						TStockage[1].Energie:=T2[2].Caisse[i].Energie;
						TStockage[1].PuiFisc:=T2[2].Caisse[i].PuiFisc;
						TStockage[1].PuiDyn:=T2[2].Caisse[i].PuiDyn;
						TStockage[1].Couleur:=T2[2].Caisse[i].Couleur;
						TStockage[1].Option:=T2[2].Caisse[i].Option;
						TStockage[1].annee:=T2[2].Caisse[i].annee;
						TStockage[1].Prixneuf:=T2[2].Caisse[i].Prixneuf;
						TStockage[1].cote:=T2[2].Caisse[i].cote;
						TStockage[1].Age:=T2[2].Caisse[i].Age;
						TStockage[1].DateMiseCirc:=T2[2].Caisse[i].DateMiseCirc;
						TStockage[1].Plaque:=T2[2].Caisse[i].Plaque;
					End;
			End;
			Writeln('VOICI LA VOITURE LA PLUS ANCIENNE : ');
			Writeln('MARQUE : ',TStockage[1].Marque);
			Writeln('MODELE : ',TStockage[1].Modele);
			Writeln('ENERGIE : ',TStockage[1].Energie);
			Writeln('PUI. FISCALE : ',TStockage[1].PuiFisc);
			Writeln('PUI. DYNAMIQUE : ',TStockage[1].PuiDyn);
			Writeln('COULEUR : ',TStockage[1].Couleur);
			Writeln('OPTION : ',TStockage[1].option);
			Writeln('ANNEE : ',TStockage[1].annee);
			Writeln('PRIX NEUF : ',TStockage[1].Prixneuf);
			Writeln('COTE : ',TStockage[1].cote:1);
			Writeln('AGE : ',TStockage[1].Age);
		    Writeln('DATE MISE EN CIRCU. : ',TStockage[1].DateMiseCirc.Jour,' ',TStockage[1].DateMiseCirc.Mois,' ',TStockage[1].DateMiseCirc.Annee);
			Writeln('PLAQUE : ',TStockage[1].Plaque);
			Readln;
End;	
Procedure VoitureMoyenne (var T2:Tabl2; var T1:Tabl; var VoitureG1:integer; var VoitureG2:integer);
var
	i,MoyenneG1,MoyenneG2,Moyenne:integer;
Begin
	MoyenneG1:=0;
	MoyenneG2:=0;
	Moyenne:=0;
	For i:=1 to VoitureG1-1 do
		Begin
			MoyenneG1:=(MoyenneG1+T2[1].Caisse[i].Prixneuf);
		End;
	MoyenneG1:=(MoyenneG1 DIV (VoitureG1-1));
	For i:=1 to VoitureG2-1 do
		Begin
			MoyenneG2:=(MoyenneG2+T2[2].Caisse[i].Prixneuf);
		End;
	MoyenneG2:=(MoyenneG2 DIV (VoitureG2-1));
	Moyenne:=MoyenneG1+MoyenneG2;
	Moyenne:=(Moyenne DIV 2);
	Writeln('LA MOYENNE DU PRIX NEUF DES VOITURES DU GARAGE 1 EST : ');
	Writeln(MoyenneG1);
	Writeln('LA MOYENNE DU PRIX NEUF DES VOITURES DU GARAGE 2 EST : ');
	Writeln(MoyenneG2);
	Writeln('LA MOYENNE DU PRIX NEUF DES VOITURES EST : ');
	Writeln(Moyenne);
	Readln;
End;		
Procedure VoitureCher (var T2:Tabl2; var T1:Tabl; var TStockage:Tabl; var VoitureG1:integer; var VoitureG2:integer);
var
	i,j:integer;
Begin
	TStockage[2].Prixneuf:=0;
		For i:=1 to VoitureG1-1 do
			Begin 	
				if T2[1].Caisse[i].Prixneuf>TStockage[2].Prixneuf then
					Begin
						TStockage[1].Marque:=T2[1].Caisse[i].Marque;
						TStockage[1].Modele:=T2[1].Caisse[i].Modele;
						TStockage[1].Energie:=T2[1].Caisse[i].Energie;
						TStockage[1].PuiFisc:=T2[1].Caisse[i].PuiFisc;
						TStockage[1].PuiDyn:=T2[1].Caisse[i].PuiDyn;
						TStockage[1].Couleur:=T2[1].Caisse[i].Couleur;
						TStockage[1].Option:=T2[1].Caisse[i].Option;
						TStockage[1].annee:=T2[1].Caisse[i].annee;
						TStockage[1].Prixneuf:=T2[1].Caisse[i].Prixneuf;
						TStockage[1].cote:=T2[1].Caisse[i].cote;
						TStockage[1].Age:=T2[1].Caisse[i].Age;
						TStockage[1].DateMiseCirc:=T2[1].Caisse[i].DateMiseCirc;
						TStockage[1].Plaque:=T2[1].Caisse[i].Plaque;
					End;
			End;
		For i:=1 to VoitureG2-1 do
			Begin
				if T2[2].Caisse[i].Prixneuf>TStockage[2].Prixneuf then
					Begin 	
						TStockage[2].Marque:=T2[2].Caisse[i].Marque;
						TStockage[2].Modele:=T2[2].Caisse[i].Modele;
						TStockage[2].Energie:=T2[2].Caisse[i].Energie;
						TStockage[2].PuiFisc:=T2[2].Caisse[i].PuiFisc;
						TStockage[2].PuiDyn:=T2[2].Caisse[i].PuiDyn;
						TStockage[2].Couleur:=T2[2].Caisse[i].Couleur;
						TStockage[2].Option:=T2[2].Caisse[i].Option;
						TStockage[2].annee:=T2[2].Caisse[i].annee;
						TStockage[2].Prixneuf:=T2[2].Caisse[i].Prixneuf;
						TStockage[2].cote:=T2[2].Caisse[i].cote;
						TStockage[2].Age:=T2[2].Caisse[i].Age;
						TStockage[2].DateMiseCirc:=T2[2].Caisse[i].DateMiseCirc;
						TStockage[2].Plaque:=T2[2].Caisse[i].Plaque;
					End;
			End;
			Writeln('VOICI LA VOITURE LA PLUS CHERE : ');
			Writeln('MARQUE : ',TStockage[2].Marque);
			Writeln('MODELE : ',TStockage[2].Modele);
			Writeln('ENERGIE : ',TStockage[2].Energie);
			Writeln('PUI. FISCALE : ',TStockage[2].PuiFisc);
			Writeln('PUI. DYNAMIQUE : ',TStockage[2].PuiDyn);
			Writeln('COULEUR : ',TStockage[2].Couleur);
			Writeln('OPTION : ',TStockage[2].option);
			Writeln('ANNEE : ',TStockage[2].annee);
			Writeln('PRIX NEUF : ',TStockage[2].Prixneuf);
			Writeln('COTE : ',TStockage[2].cote:1);
			Writeln('AGE : ',TStockage[2].Age);
		    Writeln('DATE MISE EN CIRCU. : ',TStockage[2].DateMiseCirc.Jour,' ',TStockage[2].DateMiseCirc.Mois,' ',TStockage[2].DateMiseCirc.Annee);
			Writeln('PLAQUE : ',TStockage[2].Plaque);
			Readln;
End;	
Procedure Affichage (var T2:Tabl2; var T1:Tabl; var VoitureG1:integer; var VoitureG2:integer; var TStockage:Tabl);
var
	Nb:integer;
Begin 	
	Repeat
		Repeat
			clrscr;
			Writeln('Entrez :');
			Writeln('0 : Pour sortir');
			Writeln('1 : Affichage des deux garages');
			Writeln('2 : Affichage du garage qui a le plus de vehicule');
			Writeln('3 : Affichage du vehicule le plus ancien');
			Writeln('4 : Affichage de la moyenne de valeurs des vehicule par garage');
			Writeln('5 : Affichage du vehicule le plus cher neuf');
			Readln(Nb);
		Until (Nb>=0) AND (Nb<6);
		Case Nb of
			1 : begin
				AffichageGarage1(T2,T1,VoitureG1);
				AffichageGarage2(T2,T1,VoitureG2);
				End;
			2: begin
				if VoitureG1<VoitureG2 then
					begin
						clrscr;
						AffichageGarage2(T2,T1,VoitureG2)
					end
				else AffichageGarage1(T2,T1,VoitureG1);
				end;
			3 : VoitureAncien(T2,T1,TStockage,VoitureG1,VoitureG2);
			4 : VoitureMoyenne(T2,T1,VoitureG1,VoitureG2);
			5 : VoitureCher(T2,T1,TStockage,VoitureG1,VoitureG2);
		End;
	Until Nb=0;
End;
Var
	T1:Array[1..15] of Voitures;
	T2:Array[1..2] of Garage;
	TStockage:Array[1..15] of Voitures;
	Choix,VoitureG1,VoitureG2,i:integer;
        ChaineEmail:string;
Begin
	GarageAdresse(T2);
	GarageAffichage(T2);
	VoitureProc(T1,T2,VoitureG1,VoitureG2);
	Affichage(T2,T1,VoitureG1,VoitureG2,TStockage);
End.
			
