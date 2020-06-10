program projet_tp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, u_gabarit, u_feuille_style, u_select_etudiant, u_list_inscrit,
  zcomponent, u_detail_inscrit, u_notes_list, u_modele
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tf_gabarit, f_gabarit);
  Application.CreateForm(Tf_select_inscrit, f_select_inscrit);
  Application.CreateForm(Tf_list_inscrit, f_list_inscrit);
  Application.CreateForm(Tf_list_inscrit, f_list_inscrit);
  Application.CreateForm(Tf_detail_inscrit, f_detail_inscrit);
  Application.CreateForm(Tf_notes_list, f_notes_list);
  Application.CreateForm(Tmodele, modele);
  Application.Run;
end.

