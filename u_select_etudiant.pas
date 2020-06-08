unit u_select_etudiant;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_select_inscrit }

  Tf_select_inscrit = class(TForm)
    edt_code: TEdit;
    edt_numero: TEdit;
    edt_nom: TEdit;
    lbl_code: TLabel;
    lbl_numero: TLabel;
    lbl_nom: TLabel;
    pnl_filiere_edit: TPanel;
    pnl_filiere_btn: TPanel;
    pnl_filiere: TPanel;
    pnl_etudiant_edit: TPanel;
    pnl_etudiant_btn: TPanel;
    pnl_tous_btn: TPanel;
    pnl_tous: TPanel;
    pnl_etudiant: TPanel;
    pnl_choix: TPanel;
    pnl_titre: TPanel;
    procedure Init;
    procedure NonSelectionPanel (pnl : TPanel);
    procedure pnl_choix_btnClick (Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_select_inscrit: Tf_select_inscrit;

implementation

{$R *.lfm}
uses u_feuille_style;
     var
 pnl_actif : TPanel;

{ Tf_select_inscrit }

      procedure Tf_select_inscrit.Init;
begin
 style.panel_defaut(pnl_choix);
 style.panel_selection(pnl_titre);
 pnl_choix_btnClick (pnl_tous_btn);
end;
     procedure Tf_select_inscrit.pnl_choix_btnClick (Sender : TObject);
var pnl : TPanel;
begin

 pnl := TPanel(Sender) ;
 style.panel_selection (pnl);
 pnl := TPanel(pnl.Parent); // récupération du panel parent "pnl_xxx"
 style.panel_selection (pnl);
 pnl := TPanel(f_select_inscrit.FindComponent(pnl.name +'_edit'));
 style.panel_selection (pnl);
 pnl.show;
 pnl_actif := pnl; pnl_actif.enabled := true;
end;
procedure Tf_select_inscrit.NonSelectionPanel (pnl : TPanel);
var pnl_enfant : TPanel;
begin
 style.panel_defaut(pnl); // affectation des paramètres Fonte et Couleur du panel pnl_choix
 // récupération du panel '_btn'
 pnl_enfant := TPanel(f_select_inscrit.FindComponent(pnl.name +'_btn'));
 style.panel_bouton(pnl_enfant);
 // récupération du panel '_edit'
 pnl_enfant := TPanel(f_select_inscrit.FindComponent(pnl.name +'_edit'));
 pnl_enfant.Hide;
end;


end.

