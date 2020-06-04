unit u_gabarit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls;

type

  { Tf_gabarit }

  Tf_gabarit = class(TForm)
    mnu_accueil: TMenuItem;
    mnu_main: TMainMenu;
    pnl_ariane: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_gabarit: Tf_gabarit;

implementation

{$R *.lfm}

end.

