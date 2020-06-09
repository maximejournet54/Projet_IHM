unit u_detail_inscrit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_detail_inscrit }

  Tf_detail_inscrit = class(TForm)
    btn_retour: TButton;
    cbx_genre: TComboBox;
    cbx_filiere: TComboBox;
    edt_telephone: TEdit;
    edt_portable: TEdit;
    edt_email: TEdit;
    edt_adresse: TEdit;
    edt_cp: TEdit;
    edt_commune: TEdit;
    edt_nom: TEdit;
    edt_prenom: TEdit;
    edt_num: TEdit;
    lbl_erreur_filiere: TLabel;
    lbl_email_erreur: TLabel;
    lbl_tel_erreur: TLabel;
    lbl_commune_erreur: TLabel;
    lbl_cp_erreur: TLabel;
    lbl_adresse_erreur: TLabel;
    lbl_prenom_erreur: TLabel;
    lbl_nom_erreur: TLabel;
    lbl_num_erreur: TLabel;
    lbl_notes: TLabel;
    lbl_filiere: TLabel;
    lbl_email: TLabel;
    lbl_portable: TLabel;
    lbl_telephone: TLabel;
    lbl_contact: TLabel;
    lbl_adresse: TLabel;
    lbl_prenom: TLabel;
    lbl_nom: TLabel;
    lnl_num: TLabel;
    lbl_ident: TLabel;
    mmo_filiere: TMemo;
    pnl_notes_ajout: TPanel;
    pnl_notes_list: TPanel;
    pnl_notes_titre: TPanel;
    pnl_notes: TPanel;
    pnl_filiere: TPanel;
    pnl_contact: TPanel;
    pnl_adresse: TPanel;
    pnl_ident: TPanel;
    pnl_detail: TPanel;
    pnl_btn: TPanel;
    pnl_titre: TPanel;
    procedure btn_retourClick(Sender: TObject);
    procedure edt_nomExit(Sender: TObject);
    procedure edt_numExit(Sender: TObject);
    procedure init ( idinf : string; affi : boolean);
    procedure detail ( idinf : string);
    procedure edit ( idinf : string);
    procedure add;
    procedure delete ( idinf : string);
    procedure edt_Enter (Sender : TObject );

  private
    { private declarations }
    procedure affi_page;
  public
    { public declarations }
  end;

var
  f_detail_inscrit: Tf_detail_inscrit;

implementation

{$R *.lfm}

  uses u_feuille_style, u_list_inscrit;
{ Tf_detail_inscrit }

Var
   oldvaleur  : string;	// utilisée dans la modification pour comparer l’ancienne valeur avec la saisie
   id  : string;	// variable active dans toute l'unité, contenant l'id infraction affichée

procedure	Tf_detail_inscrit.Init   ( idinf : string;	affi : boolean);
//  ajout nouvelle infraction : id est vide
// affichage détail d'une infraction : affi est vrai sinon affi est faux
begin
   style.panel_travail	(pnl_titre);
   style.panel_travail	(pnl_btn);
   style.panel_travail	(pnl_detail);
	style.panel_travail (pnl_ident);
		style.label_titre  (lbl_ident);
		style.label_erreur (lbl_num_erreur);		lbl_num_erreur.caption    :=  ' ' ;
	style.panel_travail (pnl_adresse);
		//style.label_titre  (lbl_adresse);
		//style.label_erreur (lbl_immat_erreur);		lbl_immat_erreur.caption  :=  ’ ’ ;

	style.panel_travail (pnl_adresse);
	//	style.label_titre  (lbl_conducteur);
		//style.label_erreur (lbl_permis_erreur);		lbl_permis_erreur.caption :=  ’ ’ ;
                //+ d'autres à rajouter je pense
	style.panel_travail (pnl_contact);
		style.label_titre  (lbl_telephone);
	//	style.label_erreur (lbl_nocom_erreur);		lbl_nocom_erreur.caption  :=  ’ ’ ;
                //+ d'autres à rajouter je pense
   style.panel_travail (pnl_filiere);
	style.panel_travail (pnl_notes_titre);
		style.label_titre  (lbl_notes);
	//	style.label_erreur (lbl_amende_erreur);		lbl_amende_erreur.caption :=  ’ ’ ;
	style.panel_travail (pnl_notes_list);
	style.panel_travail (pnl_notes_ajout);
   // à changer aussi
   edt_num.ReadOnly	:=affi;
   edt_dt.NullInputAllowed	:=false;   // valeur nulle interdite : zone obligatoirement renseignée
  // edt_dt.DateMode	:=dmComboBox;   //mode liste déroulante
   edt_dt.ReadOnly	:=affi;

   //+ changer ce qu'il y a en dessous

// initialisation véhicule
   lbl_immat_erreur.caption	:='';
   edt_immat.clear;
   edt_immat.ReadOnly	:=affi;
   mmo_vehicule.clear;
   mmo_vehicule.ReadOnly	:=true;
   lbl_proprio.visible	:=false;   // invisible par défaut
   mmo_proprio.clear;
   mmo_proprio.ReadOnly	:=true;
// initialisation conducteur
   lbl_permis_erreur.caption	:='';
   edt_permis.clear;
   edt_permis.ReadOnly		:=affi;
   mmo_conducteur.clear;
   mmo_conducteur.ReadOnly :=true;
// initialisation commune
   lbl_nocom_erreur.caption	:='';
   edt_nocom.clear;
   edt_nocom.ReadOnly		:=affi;
   mmo_commune.clear;
   mmo_commune.ReadOnly	:=true;
   btn_retour.visible	:=affi;  // visible quand affichage détail
   btn_valider.visible	:=NOT  affi;    // visible quand ajout/modification infraction
   btn_annuler.visible	:=NOT  affi;    // visible quand ajout/modification infraction

// initialisation amende
   lbl_amende_erreur.Caption  :='';

   show;

   id  := idinf;
   IF  NOT  ( id = '')   // affichage/modification infraction
   THEN  affi_page;

end;

// faire page  14 + suite du TP5

procedure Tf_detail_inscrit.btn_retourClick(Sender: TObject);
begin
  close;
end;

procedure Tf_detail_inscrit.edt_nomExit(Sender: TObject);
begin

end;

procedure Tf_detail_inscrit.edt_numExit(Sender: TObject);
begin
                edt_num.text := TRIM(edt_num.text);
end;

procedure Tf_detail_inscrit.init(idinf: string; affi: boolean);
begin

end;

procedure Tf_detail_inscrit.detail(idinf: string);
begin

end;

procedure Tf_detail_inscrit.edit(idinf: string);
begin

end;

procedure Tf_detail_inscrit.add;
begin

end;

procedure Tf_detail_inscrit.delete(idinf: string);
begin

end;

procedure Tf_detail_inscrit.edt_Enter(Sender: TObject);
begin

end;

procedure Tf_detail_inscrit.affi_page;
begin

end;

 procedure Tf_detail_infraction.edt_Enter(Sender :
TObject);
begin
oldvaleur := TEdit(Sender).text;
end;

end.

