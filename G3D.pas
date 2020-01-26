Unit G3D;

Interface //////////////////////////////////////////////////////////////////////

Procedure TracerPoint3D (x, y, z : Real);
Procedure Tracersegment3D (x1, y1,z1, x2, y2, z2 : Real);
Procedure TracerAxes3D(x, y, z : real);
Procedure TracerCube(x : Real);
Procedure graduer (x:real);
Procedure Traduire_3D_2D(x, y, z : Real; Var xx, yy : Real);
Procedure Pivoter3D(var x , y , z : Real ; zalpha : Real ; axe : Char ) ;
Procedure Translater3D ( Var x,y,z : Real ; dx,dy,dz : Real ) ;
Procedure Pivoter3DAutour ( Var x,y,z,x0,y0,z0 : Real ; alpha : Real ; axe : Char ) ;


Implementation /////////////////////////////////////////////////////////////////

uses Graphics, G2D , Volume3D;

Var OrigineX : Real = 0; // Variable "globales" locale (interne) à l'unité.
    OrigineY : Real = 0;

Procedure Traduire_3D_2D(x, y, z : Real; Var xx, yy : Real);//------------------
Begin
     xx := x - z/3;
     yy := y - z/2;
End;//--------------------------------------------------------------------------

Procedure TracerPoint3D (x, y, z : Real);//-------------------------------------
Var xx, yy : real;

Begin
     Traduire_3D_2D(x, y, z,  xx, yy);
     TracerPoint2D ( xx, yy);
End;//--------------------------------------------------------------------------

Procedure Tracersegment3D (x1, y1, z1, x2, y2, z2 : Real);//--------------------
Var xx1,yy1,
    xx2,yy2 : Real; // Coordonnées pixel de l'ellipse du point à tracer
Begin
     Traduire_3D_2D(x1, y1, z1, xx1, yy1);
     Traduire_3D_2D(x2, y2, z2, xx2, yy2);

     Tracersegment2D (xx1, yy1, xx2, yy2);



End;//--------------------------------------------------------------------------

Procedure TracerAxes3D(x, y, z : real);//---------------------------------------
Begin
     Tracersegment3D(0, 0, 0, 300, 0, 0);
     Tracersegment3D(0, 0, 0, 0, 300, 0);
     Tracersegment3D(0, 0, 0, 0, 0, 300);
End;//--------------------------------------------------------------------------

Procedure TracerCube(x : Real);//---------------------------------------
Begin
     Tracersegment3D (150*x, 0, 0, 150*x, 150*x, 0);
     Tracersegment3D (150*x, 150*x, 0, 300*x, 150*x, 0);
     Tracersegment3D (300*x, 150*x, 0, 300*x, 0, 0);
     Tracersegment3D (300*x, 0, 0, 150*x, 0, 0);
     Tracersegment3D (150*x, 0, 100*x, 150*x, 150*x, 100*x);
     Tracersegment3D (150*x, 150*x, 100*x, 300*x, 150*x, 100*x);
     Tracersegment3D (300*x, 150*x, 100*x, 300*x, 0, 100*x);
     Tracersegment3D (300*x, 0, 100*x, 150*x, 0, 100*x);
     Tracersegment3D (150*x, 150*x, 0, 150*x, 150*x, 100*x);
     Tracersegment3D (300*x, 150*x, 0, 300*x, 150*x, 100*x);
     Tracersegment3D (150*x, 0, 0, 150*x, 0, 100*x);
     Tracersegment3D (300*x, 0, 0, 300*x, 0, 100*x);
End;//--------------------------------------------------------------------------

Procedure graduer (x:real);
begin
         TracerPoint3D(50*x , 0 , 0);
         TracerPoint3D( 0, 50*x , 0);
         TracerPoint3D(0 , 0 , 50*x);
         TracerPoint3D(100*x , 0 , 0);
         TracerPoint3D( 0, 100*x , 0);
         TracerPoint3D( 0, 0 , 100*x);
         TracerPoint3D(150*x , 0 , 0);
         TracerPoint3D( 0, 150*x , 0);
         TracerPoint3D( 0, 0 , 150*x);
         TracerPoint3D(200*x , 0 , 0);
         TracerPoint3D( 0, 200*x , 0);
         TracerPoint3D( 0, 0 , 200*x);
         TracerPoint3D(250*x , 0 , 0);
         TracerPoint3D( 0, 250*x , 0);
         TracerPoint3D( 0, 0 , 250*x);
         TracerPoint3D(300*x , 0 , 0);
         TracerPoint3D( 0, 300*x , 0);
         TracerPoint3D( 0, 0 , 300*x);

end;

Procedure Pivoter3D(var x , y , z : Real ; zalpha : Real ; axe : Char ) ;//-----
//
//  En fonction de axe ...
// ......... Pivoter2D
//------------------------------------------------------------------------------
Begin
  Case axe Of
  'x','X' : Pivoter2D(y,z, zalpha ) ;
  'y','Y' : Pivoter2D(x,z, zalpha ) ;
  'z','Z' : Pivoter2D(x,y, zalpha ) ;
  End;
End;//--------------------------------------------------------------------------

Procedure Pivoter3D(var x , y , z : Real ; zalpha : Real ; axe : Char ) ;//-----
//
//  En fonction de axe ...
// ......... Pivoter2D
//------------------------------------------------------------------------------
Begin
  Case axe Of
  'x','X' : Pivoter2D(y,z, zalpha ) ;
  'y','Y' : Pivoter2D(x,z, zalpha ) ;
  'z','Z' : Pivoter2D(x,y, zalpha ) ;
  End;
End;//--------------------------------------------------------------------------

Procedure Translater3D ( Var x,y,z : Real ; dx,dy,dz : Real ) ; //--------------
//
//------------------------------------------------------------------------------
Begin
  x := x + dx ;
  y := y + dy ;
  z := z + dz ;
End;//--------------------------------------------------------------------------


Procedure Pivoter3DAutour ( Var x,y,z,x0,y0,z0 : Real ; alpha : Real ; axe : Char ) ;
//
//------------------------------------------------------------------------------
Begin
  Pivoter2DAutour(y,z,y0,z0,alpha) ;
  Pivoter2DAutour(x,z,x0,z0,alpha) ;
  Pivoter2DAutour(x,y,x0,y0,alpha) ;
End;//--------------------------------------------------------------------------


End.////////////////////////////////////////////////////////////////////////////
