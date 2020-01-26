Unit G2D;

Interface //////////////////////////////////////////////////////////////////////

procedure Effacer();
Procedure TracerPoint2D (x, y : Real);
Procedure Tracersegment2D (x1, y1, x2, y2 : Real);
Procedure FixerEchelle (e : real);
Procedure TracerAxes2D(x, y : Real);
Procedure FixerOrigine2D(x, y : Real);
Procedure Pivoter2D(var x , y : Real ; alpha : Real);
Procedure Translater2D ( Var x, y : Real ; dx , dy : Real ) ;
Procedure Pivoter2DAutour ( Var x, y : Real ; x0 , y0 , alpha : Real ) ;

Implementation /////////////////////////////////////////////////////////////////

uses Graphics, Unit1;

Var OrigineX : Real = 0; // Variable "globales" locale (interne) à l'unité.
    OrigineY : Real = 0;
    Echelle  : real = 1;

Procedure Traduire_2D_Delphi(x, y : Real; Var xx, yy : integer);//----------------------------------------------------------
Begin
     xx :=  round (  (x*Echelle) + OrigineX);
     yy :=  round ( (Form1.Image1.height- y*echelle) - OrigineY -1);
End;//--------------------------------------------------------------------------
Procedure Effacer();//----------------------------------------------------------
Begin
     Form1.Image1.Canvas.Pen.Color := ClWhite;
     Form1.Image1.Canvas.Brush.Color := ClBlack;
     Form1.Image1.Canvas.Rectangle (0,0, Form1.Image1.width, form1.Image1.Height);

End;//--------------------------------------------------------------------------

Procedure TracerPoint2D (x, y : Real);//----------------------------------------
const Rayon = 10;// Rayon du cercle pour représenter le point à tracer
Var xx, yy,
    xx1,yy1,
    xx2,yy2 : integer; // Coordonnées de l'ellipse du point à tracer
Begin
     Traduire_2D_Delphi(x, y, xx, yy);

     xx1 := xx - rayon; // Traduction en integer
     xx2 := xx + rayon;
     yy1 := yy - rayon;
     yy2 := yy + rayon;



     Form1.Image1.Canvas.Pen.Color := Clwhite;
     Form1.Image1.Canvas.Brush.Color := clblack;
     Form1.Image1.Canvas.ellipse (xx1,yy1,xx2,yy2);
End;//--------------------------------------------------------------------------

Procedure Tracersegment2D (x1, y1, x2, y2 : Real);//----------------------------
Var xx1,yy1,
    xx2,yy2 : integer; // Coordonnées pixel de l'ellipse du point à tracer
Begin
     Traduire_2D_Delphi(x1, y1, xx1, yy1);
     Traduire_2D_Delphi(x2, y2, xx2, yy2);


     Form1.Image1.Canvas.Pen.Color := clwhite;
     Form1.Image1.Canvas.Brush.Color := clwhite;
     Form1.Image1.Canvas.MoveTo (xx1,yy1);
     Form1.Image1.Canvas.LineTo (xx2,yy2);
End;//--------------------------------------------------------------------------



Procedure TracerAxes2D(x, y : Real);//------------------------------------------
Begin
     Tracersegment2D(0, 100, 0, 0);
     Tracersegment2D(0, 0, 100, 0);
End;//--------------------------------------------------------------------------

Procedure FixerOrigine2D(x, y : Real);//----------------------------------------
Begin
     OrigineX := x;
     OrigineY := y;
End;//--------------------------------------------------------------------------

Procedure FixerEchelle (e:real);
begin
  Echelle := e ;
end;//--------------------------------------------------------------------------





 Procedure Pivoter2D(var x , y : Real ; alpha : Real);
 var x1 , y1 : real ;
 Begin
 x1:= x* cos(alpha) - y*sin(alpha);
 y1 := x*sin(alpha) + y*cos(alpha);
 x:= x1;
 y := y1;
 end;

  Procedure Pivoter2DInverse(var x , y : Real ; alpha : Real);
 var x1 , y1 : real ;
 Begin
 x1:= x* cos(alpha) + y*sin(alpha);
 y1 := x*sin(alpha) - y*cos(alpha);
 x:= x1;
 y := y1;
 end;

Procedure Translater2D ( Var x, y : Real ; dx , dy : Real ) ;
Begin
  x := x + dx ;
  y := y + dy ;
End;

Procedure Pivoter2DAutour ( Var x, y : Real ; x0 , y0 , alpha : Real ) ;
Begin
  Translater2D ( x,y , -x0 , -y0 ) ;
  Pivoter2D(x , y ,alpha );
  Translater2D ( x,y , +x0 , +y0 ) ;
End;

Procedure TracerProjection(Var axe:char)
Var i, i1, i2 : Integer ;
Begin
  For i := 1 To NbrPoints_ div 2 Do
  Begin
    i1 := (i-1)*2+1;
    i2 := i1     +1

End;

End.////////////////////////////////////////////////////////////////////////////
