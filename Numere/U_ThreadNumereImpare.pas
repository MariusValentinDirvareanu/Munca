unit U_ThreadNumereImpare;

interface

uses Classes, System.SysUtils;

type
  TThreadNumereImpare = class(TThread)
  protected
    procedure Execute; override;

  public
    constructor Create(bSuspended: Boolean);

  private
    FNumar: Integer;
    procedure AfiseazaNumar;
  end;

implementation

uses U_Main;

constructor TThreadNumereImpare.Create(bSuspended: Boolean);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  if not bSuspended then
    Resume;
end;

procedure TThreadNumereImpare.AfiseazaNumar;
begin
  Form1.mmoNumere.Text := Form1.mmoNumere.Text + FNumar.ToString + sLineBreak;
end;

procedure TThreadNumereImpare.Execute;
var
  i: Integer;
begin
  while not Terminated do
  begin
    for i := -MaxInt + 1 to MaxInt do
      if (i mod 2 <> 0) then
      begin
        FNumar := i;
        Synchronize(AfiseazaNumar);
        Sleep(1);
      end;
  end;
end;

end.
