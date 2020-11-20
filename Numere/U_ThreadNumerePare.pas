unit U_ThreadNumerePare;

interface

uses Classes, System.SysUtils, System.SyncObjs;

type
  TThreadNumerePare = class(TThread)
  protected
    procedure Execute; override;

  public
    constructor Create(bSuspended: Boolean);

  end;

implementation

uses U_Main;

constructor TThreadNumerePare.Create(bSuspended: Boolean);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  if not bSuspended then
    Resume;
end;

procedure TThreadNumerePare.Execute;
var
  i: Integer;
begin
  Form1.CS.Enter;
  try
    for i := -MaxInt + 1 to MaxInt do
    begin
      if (i mod 2 = 0) then
      begin

        Form1.mmoNumere.Lines.Add(i.ToString + ' par');

      end;
    end;
  finally
    Form1.CS.Leave;
  end;
end;

end.
