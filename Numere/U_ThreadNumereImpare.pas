unit U_ThreadNumereImpare;

interface

uses Classes, System.SysUtils, System.SyncObjs;

type
  TThreadNumereImpare = class(TThread)
  protected
    procedure Execute; override;

  public
    constructor Create(bSuspended: Boolean);

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

procedure TThreadNumereImpare.Execute;
var
  i: Integer;
begin
  Form1.CS.Enter;
  try
    for i := -MaxInt + 1 to MaxInt do
    begin
      if (i mod 2 <> 0) then
      begin
        Form1.mmoNumere.Lines.Add(i.ToString + ' impar');
      end;
    end;
  finally
    Form1.CS.Leave;
  end;
end;

end.
