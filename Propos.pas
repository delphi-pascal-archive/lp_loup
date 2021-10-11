unit Propos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm_Propos = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Name_App: TLabel;
    Lp: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
    Passe: Integer;
  public
    { Déclarations publiques }
    Demarre: boolean;
  end;

var
  Form_Propos: TForm_Propos;

implementation

uses Traitement;

{$R *.DFM}

procedure Feuille_Move(Handle:Integer);
begin
     DeleteMenu(GetSystemMenu(Handle, FALSE), SC_MOVE, MF_BYCOMMAND);
end;

procedure Feuille_Close(Handle:Integer);
begin
     DeleteMenu(GetSystemMenu(Handle, FALSE), SC_CLOSE, MF_BYCOMMAND);
end;

procedure TForm_Propos.FormCreate(Sender: TObject);
begin
     Form_Propos.Left := Screen.Width - Form_Propos.Width;
     Form_Propos.Top := Screen.Height - Form_Propos.Height - Traitement.HauteurBarreDeTache();

     Feuille_Move(Form_Propos.Handle);
     Demarre := False;
     Passe := 0;
     Timer1.OnTimer(Timer1);
end;

procedure TForm_Propos.Timer1Timer(Sender: TObject);
begin
     if Demarre = True then
     begin
          Feuille_Close(Form_Propos.Handle);
          if Passe < 5 then
             Passe := Passe + 1
          else
             begin
             Form_Propos.Close;
             end;
     end;
end;

procedure TForm_Propos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Demarre := False;
     Action := caFree;
end;

end.
