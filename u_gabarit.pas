unit u_gabarit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls;

type

  { Tf_gabarit }


  Tf_gabarit = class(TForm)
    item_liste1: TMenuItem;
    item_archive: TMenuItem;
    item_inscit: TMenuItem;
    item_filiere: TMenuItem;
    item_quitter: TMenuItem;
    item_accueil: TMenuItem;
    item_liste2: TMenuItem;
    item_archive_n1: TMenuItem;
    item_archive_n2: TMenuItem;
    item_statistiques: TMenuItem;
    mnu_main: TMainMenu;
    pnl_selection: TPanel;
    pnl_travail: TPanel;
    pnl_info: TPanel;
    pnl_ariane: TPanel;
    procedure FormShow(Sender: TObject);
    procedure item_quitterClick(Sender: TObject);
    procedure mnu_item_Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_gabarit: Tf_gabarit;

implementation

{$R *.lfm}

{ Tf_gabarit }
USES u_feuille_style;

procedure Tf_gabarit.mnu_item_Click(Sender: TObject);
var
   item : TMenuItem;
begin
   pnl_selection.show;

   pnl_ariane.Caption := '';
   item := TmenuItem(Sender);
   repeat
         pnl_ariane.caption := ' >' + item.caption +pnl_ariane.Caption;
         item := item.parent;
   until item.parent = nil;
end;


procedure Tf_gabarit.FormShow(Sender: TObject);
begin
 style.panel_selection (pnl_ariane);
 style.panel_defaut (pnl_selection);
 style.panel_travail (pnl_travail);
 style.panel_defaut (pnl_info);
 f_gabarit.width := 1200;
 f_gabarit.height := 800;
 // item accueil sélectionné par défaut

 //fiche d'accueil affichée

end;

procedure Tf_gabarit.item_quitterClick(Sender: TObject);
begin
     close;
end;

end.

