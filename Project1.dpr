program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  G2D in 'G2D.pas',
  G3D in 'G3D.pas',
  Volume3D in '\\serveurfic3\eleves\hochdyl\3D\Volume3D.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
