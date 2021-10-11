unit Loupe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TForm_Loupe = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_Loupe: TForm_Loupe;

implementation

uses Principale;

{$R *.DFM}

procedure TForm_Loupe.FormCreate(Sender: TObject);
begin
     Form_Principale.Check_Aff_LoupeClick(Form_Principale.Check_Aff_Loupe);

     Form_Loupe.Top := 0;
     Form_Loupe.Left := 0;
     Form_Loupe.Height := 100;
     Form_Loupe.Width := Screen.Width;

     Form_Loupe.Image1.Top := Form_Loupe.Top;
     Form_Loupe.Image1.Left := Form_Loupe.Left;
     Form_Loupe.Image1.Height := Form_Loupe.Height;
     Form_Loupe.Image1.Width := Form_Loupe.Width;
end;

end.
