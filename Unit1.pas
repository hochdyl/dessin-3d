unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Uses G2D , G3D , Volume3D;
var  c1,c2,c3 :TPoint3D;
Var varcube: TVolume3D;

procedure TForm1.FormCreate(Sender: TObject);
Begin

     varcube := TVolume3D.Create();

     varcube.AjouterSegment( -100, +100,-100, -100, +100,-100 );
     varcube.AjouterSegment( -100, +100, -100, +100, +100,-100 );
     varcube.AjouterSegment( +100, +100, -100, +100, -100,-100 );
     varcube.AjouterSegment( +100, -100, -100, -100, -100,-100 );

     varcube.AjouterSegment( -100, -100, 0, -100, +100,0 );
     varcube.AjouterSegment( -100, +100, 0, +100, +100,0 );
     varcube.AjouterSegment( +100, +100, 0, +100, -100,0 );
     varcube.AjouterSegment( +100, -100, 0, -100, -100,0 );

     varcube.AjouterSegment( -100, -100, 0, -100, -100,-100 );
     varcube.AjouterSegment( -100, +100, 0, -100, +100,-100 );
     varcube.AjouterSegment( +100, -100, 0, +100, -100,-100 );
     varcube.AjouterSegment( +100, +100, 0, +100, +100,-100 );

     c1.x := 50 ; c1.y := 50 ; c1.z := 0 ;
     c2.x := 100 ; c2.y := 100; c2.z := 0 ;
     c3.x := 150 ; c3.y := 150 ; c3.z := 0 ;
end;


procedure TForm1.FormPaint(Sender: TObject);//----------------------------------
begin
     Effacer();
    // FixerOrigine2D(300,200);
 //    TracerAxe2D();
     FixerOrigine2D(250, 250);
     FixerEchelle (1);
     TracerAxes3D(1, 1, 1);
     varcube.Tracer();
     //varcube.PivoterAutour(x,y,z,0.001,'x');

     TracerPoint2D(c1.x,c1.y);
     Pivoter2D(c1.x,c1.y,0.0005);

     TracerPoint2D(c2.x,c2.y);
     Pivoter2D(c2.x,c2.y,0.0005);

     TracerPoint2D(c3.x,c3.y);
     Pivoter2D(c3.x,c3.y,0.0005);



   //  Translater2D(x,y,0.0005,0.0005) ;
      // Pivoter2DAutour( X, Y , 1,1,0.001 ) ;


    //   TracerCube(1);
    //   Pivoter3D(x,y,z,0.001,'z');
     //TracerPoint2D (10,10);
     //TracerCube(1) ;
     //graduer (1);



end;//--------------------------------------------------------------------------

//procedure TForm1.Timer1Timer(Sender: TObject);
//begin
 //DecalX := sin((gettickcount()/1000));
 //DecalY := cos((gettickcount()/1000));
 //FormPaint(sender);
//end;

end.

