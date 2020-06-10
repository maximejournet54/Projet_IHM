unit u_notes_list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, u_liste;

type
  Tf_notes_list = class(TF_liste)
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_notes_list: Tf_notes_list;

implementation

{$R *.lfm}
{ Tf_releve_list }
uses   u_feuille_style;
procedure Tf_releve_list.Init(affi: boolean);
begin
      style.panel_travail(pnl_titre);
      style.panel_travail(pnl_btn);
      style.panel_travail(pnl_affi);
      style.grille (sg_liste);
      pnl_btn.hide;
end;

end.

