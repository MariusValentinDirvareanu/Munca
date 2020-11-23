unit U_ThreadNumereImpare;

interface

uses Classes, System.SysUtils, System.SyncObjs;

type
  TThreadNumereImpare = class(TThread)
  protected
    procedure Execute; override;
    procedure AfisareNumere;

  public
    constructor Create(bSuspended: Boolean);

  private
    Numar: Integer;

  end;

implementation

uses F_Main;

procedure TThreadNumereImpare.AfisareNumere;
begin
  Form1.mmoNumere.Lines.Add(Numar.ToString + ' impar');
end;

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
  for i := -MaxInt + 1 to MaxInt do
  begin
    if Terminated then
    begin
      Exit;
    end;
    if (i mod 2 <> 0) then
    begin
      Numar := i;
      Synchronize(AfisareNumere);
    end;
    Sleep(1);
  end;
end;

end.
