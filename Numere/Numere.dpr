program Numere;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  F_Main in 'F_Main.pas' {Form1},
  U_ThreadNumerePrime in 'U_ThreadNumerePrime.pas',
  U_ThreadNumerePare in 'U_ThreadNumerePare.pas',
  U_ThreadNumereImpare in 'U_ThreadNumereImpare.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
