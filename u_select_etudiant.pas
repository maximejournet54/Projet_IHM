unit u_select_etudiant;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_select_etudiant }

  Tf_select_etudiant = class(TForm)
    btn_rechercher: TButton;
    edt_code: TEdit;
    edt_num: TEdit;
    edt_nom: TEdit;
    lbl_code: TLabel;
    lbl_nom: TLabel;
    lbl_num: TLabel;
    pnl_rechercher: TPanel;
    pnl_filiere_edit: TPanel;
    pnl_filiere_btn: TPanel;
    pnl_filiere: TPanel;
    pnl_etudiant_edit: TPanel;
    pnl_etudiant_btn: TPanel;
    pnl_etudiant: TPanel;
    pnl_tous_edit: TPanel;
    pnl_tous_btn: TPanel;
    pnl_tous: TPanel;
    pnl_choix: TPanel;
    pnl_titre: TPanel;
    procedure pnl_choixClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_select_etudiant: Tf_select_etudiant;

implementation

{$R *.lfm}

{ Tf_select_etudiant }

procedure Tf_select_etudiant.pnl_choixClick(Sender: TObject);
begin

end;

end.

