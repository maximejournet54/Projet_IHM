unit u_list_inscrit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, Grids, Spin, u_liste;

type

  { Tf_list_inscrit }

  Tf_list_inscrit = class(TF_liste)
    spedit_ligne: TSpinEdit;
    procedure Init;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_list_inscrit: Tf_list_inscrit;

implementation

{$R *.lfm}

{Tf_list_inscrit}

uses u_feuille_style, u_detail_inscrit;

procedure Tf_list_inscrit.Init;
begin
style.panel_travail(pnl_titre);
style.panel_travail(pnl_btn);
style.panel_travail(pnl_affi);
style.grille (sg_liste);
//f_liste_inscrit.affi_data(modele.inscription_liste_tous);
sg_liste.RowCount:=spedit_ligne.Value+1;
end;






end.

