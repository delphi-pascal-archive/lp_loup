program LP_Loupe;

uses
  Forms,
  Principale in 'Principale.pas' {Form_Principale},
  Traitement in 'Traitement.pas',
  Loupe in 'Loupe.pas' {Form_Loupe},
  Propos in 'Propos.pas' {Form_Propos};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'LP_Loupe';
  Application.CreateForm(TForm_Principale, Form_Principale);
  Application.CreateForm(TForm_Loupe, Form_Loupe);
  Application.CreateForm(TForm_Propos, Form_Propos);
  Form_Propos.Demarre := True;
  Form_Propos.ShowModal;
  Application.Run;
end.
