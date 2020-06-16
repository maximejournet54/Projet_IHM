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
f_liste_inscrit.affi_data(modele.inscription_liste_tous);
sg_liste.RowCount:=spedit_ligne.Value+1;
end;

procedure Tf_liste.affi_data(flux_data: TLoadDataSet);
begin
sg_liste.RowCount:=nblignesparpage+1;
flux:=flux_data;
nbpages:=(flux.count+nblignesparpage -1) DIV nblignesparpage;

btn_page_firstClick(btn_page_first);
end;

procedure Tf_liste.btn_page_firstClick(Sender: TObject);
begin
     indicedebut:=1;
     affi_page;
end;

procedure Tf_liste.affi_page;
var
   unenreg : TTableauAssociatif;
   i,j     : integer;
begin
     // vider le contenu de sg_liste sauf la ligne de titre fixe
   sg_liste.Clean([gzNormal]);
   sg_liste.rowcount := 1; // la ligne de titre
   if (indicedebut > 0) then
   begin
      pageencours := indicedebut DIV nblignesparpage +1;
      if pageencours >= nbpages
      then begin
        // dernière page ==> calculer nombre de lignes à afficher
           sg_liste.rowCount := sg_liste.rowCount +flux.count - (nblignesparpage *(nbpages-1))
      end
      else sg_liste.rowCount := sg_liste.rowCount +nblignesparpage;

      i := 1;   // ligne de titres
      flux.Position(indicedebut);

      btn_line_detail.enabled := NOT flux.EndOf;
      btn_line_edit.enabled   := NOT flux.EndOf;
      btn_line_delete.enabled := NOT flux.EndOf;

   // tant que non fin flux et non fin page
      while not(flux.EndOf) and (i < sg_liste.rowCount)
      do begin
   // lecture de la ligne du flux et stockage, positionnement sur la ligne suivante
         unenreg := flux.Read;
         j := 0;
         while (j < sg_liste.colCount)
         do begin
            sg_liste.Cells[j,i] := unenreg[j];
            j := j +1;
         end;
         i := i +1;
      end;
   end
   else begin
        btn_line_detail.enabled := false;
        btn_line_edit.enabled   := false;
        btn_line_delete.enabled := false;
   end;

   pnl_btn_page.caption := 'page ' +inttostr(pageencours)
                           +' / ' +inttostr(nbpages);
   btn_page_last.enabled := (pageencours < nbpages);
   btn_page_next.enabled := (pageencours < nbpages);
   btn_page_first.enabled:= (pageencours > 1);
   btn_page_prior.enabled:= (pageencours > 1);
end;

end.

