unit Traitement;

interface

uses Windows, Forms, Graphics;

procedure Zoom(X:Integer; Y: Integer; Size:Integer; Inverse:Boolean);
procedure ScreenMate(Fen:TForm; Img_Bmp:TBitmap; Color_Transparent:TColor);
function HauteurBarreDeTache():Integer;

implementation

uses Loupe;

procedure Zoom(X:Integer; Y:Integer; Size:Integer; Inverse:Boolean);
var
  Cadre1, Cadre2: TRect;
  Left, Right, Top, Bottom:Integer;
begin

  if X > Screen.Width then
     X := Screen.Width;
  if X < 0 then
     X := 0;

  if Y > Screen.Height then
     Y := Screen.Height;
  if Y < 0 then
     Y := 0;

  if X <= ( (Screen.Width div Size) div 2 ) then
  begin
       Left := 0;
       Right := (Screen.Width div Size);
  end
  else
      begin
           if X > ( Screen.Width - (Screen.Width div Size) div 2) then
           begin
                Left := Screen.Width - (Screen.Width div Size);
                Right := Screen.Width;
           end
           else
               begin
                    Left := X - ( (Screen.Width div Size) div 2 );
                    Right := X + ( (Screen.Width div Size) div 2 );
               end;
      end;

  if Y <= ( (Form_Loupe.Height div Size) div 2 ) then
  begin
       Top := 0;
       Bottom := Form_Loupe.Height;
  end
  else
      begin
           if Y > ( Screen.Height - (Form_Loupe.Height div Size) div 2) then
           begin
                Top := Screen.Height - (Form_Loupe.Height div Size);
                Bottom := Screen.Height;
           end
           else
               begin
                    Top := Y - ( (Form_Loupe.Height div Size) div 2 );
                    Bottom := Y + ( (Form_Loupe.Height div Size) div 2 );
               end;
      end;

  // définition d'un carré centré sur la position de la souris
  Cadre1.Top := Top;//Y - ( (Form_Loupe.Height div Size) div 2 );
  Cadre1.Left := Left;
  Cadre1.Right := Right;
  Cadre1.Bottom := Bottom;//Y + ( (Form_Loupe.Height div Size) div 2 );

  // On récupère la taille de l'image pour afficher dedans l'image aggrandie.
  Cadre2.Top := Form_Loupe.Top;
  Cadre2.Left := Form_Loupe.Left;
  Cadre2.Right := Screen.Width;// Left + (Form_Loupe.Width div Size);//Form_Loupe.Image1.Left + Form_Loupe.Image1.Width;
  Cadre2.Bottom := Form_Loupe.Top + Form_Loupe.Height; //2 * (Form_Loupe.Height div Size);//Form_Loupe.Image1.Top + Form_Loupe.Image1.Height;

  if Inverse then
     Form_Loupe.Image1.Canvas.CopyMode := cmNotSrcCopy
  else
      Form_Loupe.Image1.Canvas.CopyMode := cmSrcCopy;

  Form_Loupe.Image1.Canvas.CopyRect(Cadre2, Form_Loupe.Canvas, Cadre1);

end;

procedure ScreenMate(Fen:TForm; Img_Bmp:TBitmap; Color_Transparent:TColor);
var X, Y, Home_Region, End_Region:Integer;
    Hwnd, Hwnd_Temp:Integer;
    Remember_Transparent, Passe_First:Boolean;
begin
   Img_Bmp.TransparentColor := Color_Transparent;

   Fen.Height := Img_Bmp.Height;
   Fen.Width := Img_Bmp.Width;

   Passe_First := True;

   for Y := 1 to Img_Bmp.Height do
       begin
            Home_Region := 1;
            End_Region := 1;
            Remember_Transparent := True;

            for X := 1 to Img_Bmp.Width do
            begin
                 if (Img_Bmp.Canvas.Pixels[X, Y] = Color_Transparent) then
                 begin
                      if (Remember_Transparent = False) then
                      begin
                           End_Region := (X - 1);
                           if (Passe_First = True) then
                           begin
                                Hwnd := CreateRectRgn(Home_Region, Y, (End_Region + 1 ), (Y + 1));
                                Passe_First := False;
                           end
                           else
                               begin
                                    Hwnd_Temp := CreateRectRgn(Home_Region, Y, (End_Region + 1), (Y + 1));
                                    CombineRgn(Hwnd, Hwnd, Hwnd_Temp, Rgn_Or);
                                    Deleteobject(Hwnd_Temp);
                               end;
                      end;
                      Remember_Transparent := True;
                 end
                 else
                     begin
                          if Remember_Transparent = True then
                             Home_Region := X;
                          Remember_Transparent := False;
                          if X = (Img_Bmp.Width-1) then
                             if Passe_First = True then
                             begin
                                  Hwnd := CreateRectRgn(Home_Region, Y, X, (Y + 1));
                                  Passe_First := False;
                             end
                             else
                                 begin
                                      Hwnd_Temp := CreateRectRgn(Home_Region, Y, X, (Y + 1));
                                      CombineRgn(Hwnd, Hwnd, Hwnd_Temp, Rgn_Or);
                                      DeleteObject(Hwnd_Temp);
                                 end;
                     end;
            end;
       end;

   Fen.Show;
   SetWindowRgn(Fen.handle, Hwnd, True);
   Fen.Canvas.Draw(0, 0, Img_Bmp);
   Application.ProcessMessages;

   Fen.BringToFront;
   //Fen.Top := 0;
   //Fen.Left := 0;
end;

function HauteurBarreDeTache():Integer;
var
Tr:Trect;
begin
     SystemParametersInfo(SPI_GETWORKAREA,0, @Tr,0);
     Result := Screen.Height-(Tr.Bottom-Tr.Top);
end;

end.
