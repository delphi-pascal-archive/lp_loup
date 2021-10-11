unit Principale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles;

type
  TForm_Principale = class(TForm)
    Timer_Prise: TTimer;
    UpDown_Coeff: TUpDown;
    Label_Coeff: TLabel;
    Edit_Coefficient: TEdit;
    GroupBox_Suivi: TGroupBox;
    Check_Suivi_Souris: TCheckBox;
    Check_Suivi_Clavier: TCheckBox;
    Check_Suivi_Texte: TCheckBox;
    GroupBox_Presentation: TGroupBox;
    Check_Inv_Color: TCheckBox;
    Check_Dem_Ico: TCheckBox;
    Check_Aff_Loupe: TCheckBox;
    Button_Close: TButton;
    Button_Help: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer_PriseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpDown_CoeffClick(Sender: TObject; Button: TUDBtnType);
    procedure Check_Aff_LoupeClick(Sender: TObject);
    procedure Check_Suivi_SourisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_CloseClick(Sender: TObject);
    procedure WMChar(var Msg: TWMChar); message WM_KEYDOWN;
    procedure Saisies_Mouse(var Msg:TMessage); message WM_MOUSEMOVE;
    procedure Button_HelpClick(Sender: TObject);
  private
    { Déclarations privées }
    Coefficient:Byte;

  public
    { Déclarations publiques }
  end;

var
  Form_Principale: TForm_Principale;
  File_Ini:TIniFile;

implementation

uses Traitement, Loupe, Propos;

{$R *.DFM}

procedure TForm_Principale.Button1Click(Sender: TObject);
begin
     Traitement.ScreenMate(Form_Loupe, Form_Loupe.Image1.Picture.Bitmap, clWhite);
end;

procedure TForm_Principale.Timer_PriseTimer(Sender: TObject);
begin
     if Check_Suivi_Souris.Checked then
        Traitement.Zoom(Mouse.CursorPos.X, Mouse.CursorPos.Y, Coefficient, Check_Inv_Color.Checked);
end;

procedure TForm_Principale.FormCreate(Sender: TObject);
begin
     Form_Principale.Left := Screen.Width - Form_Principale.Width;
     Form_Principale.Top := Screen.Height - Form_Principale.Height - Traitement.HauteurBarreDeTache();

     File_Ini := TIniFile.Create(IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))) + 'LP_Loupe.ini');

     Coefficient := File_Ini.ReadInteger('Config', 'Coefficient', 1);
     Check_Suivi_Souris.Checked := File_Ini.ReadBool('Config', 'Mouse', True);
     Check_Suivi_Clavier.Checked := File_Ini.ReadBool('Config', 'KeyBoard', False);
     Check_Suivi_Texte.Checked := File_Ini.ReadBool('Config', 'Text', False);

     Check_Inv_Color.Checked := File_Ini.ReadBool('Config', 'Color', False);
     Check_Dem_Ico.Checked := File_Ini.ReadBool('Config', 'Icon', False);
     Check_Aff_Loupe.Checked := File_Ini.ReadBool('Config', 'Visible', True);

     Edit_Coefficient.Text := IntToStr(Coefficient);
     Form_Principale.UpDown_Coeff.Position := Coefficient;
     if Check_Dem_Ico.Checked then
        Form_Principale.WindowState := wsMinimized;
end;

procedure TForm_Principale.UpDown_CoeffClick(Sender: TObject;
  Button: TUDBtnType);
begin
     if Button = btNext then
        Coefficient := Coefficient + 1
     else
         Coefficient := Coefficient - 1;

     if Coefficient <= 0  then
        Coefficient := 1;

     Edit_Coefficient.Text := IntToStr(Coefficient);
end;

procedure TForm_Principale.Saisies_Mouse(var Msg:TMessage);
begin

     if Msg.wParam = WM_LBUTTONUP then//WM_LBUTTONUP then
        Traitement.Zoom(Mouse.CursorPos.X, Mouse.CursorPos.Y, Coefficient, Check_Inv_Color.Checked);
        {
        if Msg.message = WM_MOUSEMOVE then
           done := (Abs(LOWORD(Msg.lParam) - crs.x) > 5) or
            (Abs(HIWORD(Msg.lParam) - crs.y) > 5)
        else
            done := (Msg.message = WM_KEYDOWN) or (Msg.message = WM_ACTIVATE) or
            (Msg.message = WM_ACTIVATEAPP) or (Msg.message = WM_NCACTIVATE);
        }
end;


procedure TForm_Principale.Check_Aff_LoupeClick(Sender: TObject);
begin
     Form_Loupe.Visible := Check_Aff_Loupe.Checked;
end;

procedure TForm_Principale.Check_Suivi_SourisClick(Sender: TObject);
begin
     if Check_Suivi_Souris.Checked then
        Traitement.Zoom(Mouse.CursorPos.X, Mouse.CursorPos.Y, Coefficient, Check_Inv_Color.Checked);
end;

procedure TForm_Principale.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     File_Ini.WriteInteger('Config', 'Coefficient', Coefficient);
     File_Ini.WriteBool('Config', 'Mouse', Check_Suivi_Souris.Checked);
     File_Ini.WriteBool('Config', 'KeyBoard', Check_Suivi_Clavier.Checked);
     File_Ini.WriteBool('Config', 'Text', Check_Suivi_Texte.Checked);

     File_Ini.WriteBool('Config', 'Color', Check_Inv_Color.Checked);
     File_Ini.WriteBool('Config', 'Icon', Check_Dem_Ico.Checked);
     File_Ini.WriteBool('Config', 'Visible', Check_Aff_Loupe.Checked);

     File_Ini.Free;
end;

procedure TForm_Principale.Button_CloseClick(Sender: TObject);
begin
     Form_Principale.Close;
end;

procedure TForm_Principale.WMChar(var Msg: TWMChar);
begin
     //Test
     if Check_Suivi_Clavier.Checked then
        Traitement.Zoom(Mouse.CursorPos.X, Mouse.CursorPos.Y, Coefficient, Check_Inv_Color.Checked);
end;

procedure TForm_Principale.Button_HelpClick(Sender: TObject);
begin
     Application.CreateForm(TForm_Propos, Form_Propos);
     Form_Propos.ShowModal;
end;

end.






