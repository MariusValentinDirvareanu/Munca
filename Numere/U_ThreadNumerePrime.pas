unit U_ThreadNumerePrime;

interface

uses Classes, System.SysUtils, System.Math, System.SyncObjs;

type
  TThreadNumerePrime = class(TThread)
  protected
    procedure Execute; override;
    procedure AfisareNumere;

  public
    constructor Create(bSuspended: Boolean);

  private
    Numar: Integer;
    function Prim(x: Integer): Boolean;
  end;

implementation

uses F_Main;

procedure TThreadNumerePrime.AfisareNumere;
begin
  Form1.mmoNumere.Lines.Add(Numar.ToString + ' prim');
end;

constructor TThreadNumerePrime.Create(bSuspended: Boolean);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  if not bSuspended then
    Resume;
end;

procedure TThreadNumerePrime.Execute;
var
  i: Integer;

begin
  for i := 2 to MaxInt do
  begin
    if Terminated then
    begin
      Exit;
    end;
    if (Prim(i) = True) then
    begin
      Numar := i;
      Synchronize(AfisareNumere);
    end;
    Sleep(1);
  end;
end;

function TThreadNumerePrime.Prim(x: Integer): Boolean;
var
  limita, j: Integer;
begin
  if x = 2 then
  begin
    Result := True;
    Exit;
  end;
  j := 2;
  limita := Ceil(Sqrt(x)) + 1;
  while j < limita do
  begin
    if (x mod j = 0) then
    begin
      Result := False;
      Exit;
    end;
    j := j + 1;
  end;
  Result := True;
end;

end.
