unit U_ThreadNumerePrime;

interface

uses Classes, System.SysUtils, System.Math, System.SyncObjs;

type
  TThreadNumerePrime = class(TThread)
  protected
    procedure Execute; override;

  public
    constructor Create(bSuspended: Boolean);

  private
    function Prim(x: Integer): Boolean;
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

procedure TThreadNumerePrime.Execute;
var
  i: Integer;

begin
  Form1.CS.Enter;
  try
    for i := 2 to MaxInt do
    begin
      if (Prim(i) = True) then
      begin
        Form1.mmoNumere.Lines.Add(i.ToString + ' prim');
      end;
    end;
  finally
    Form1.CS.Leave;
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
