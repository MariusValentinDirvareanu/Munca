unit U_ThreadNumerePrime;

interface

uses Classes, System.SysUtils, System.Math;

type
  TThreadNumerePrime = class(TThread)
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

constructor TThreadNumerePrime.Create(bSuspended: Boolean);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  if not bSuspended then
    Resume;
end;

procedure TThreadNumerePrime.AfiseazaNumar;
begin
  Form1.mmoNumere.Text := Form1.mmoNumere.Text + FNumar.ToString + sLineBreak;
end;

procedure TThreadNumerePrime.Execute;
var
  i, j: Integer;
  limita: Integer;
  prim: Boolean;

begin
  while not Terminated do
  begin
    for i := 1 to 100 do
    begin
      prim := False;
      limita := trunc(Sqrt(i)) + 1;
      for j := 2 to limita do
        if (i mod j = 0) then
        begin
          prim := True;
          Break;
        end;
      if (prim = True) then
      begin
        FNumar := i;
        Synchronize(AfiseazaNumar);
        Sleep(1);
      end;
    end;
  end;
end;

end.
