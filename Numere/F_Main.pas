unit F_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, U_ThreadNumerePare,
  U_ThreadNumereImpare, U_ThreadNumerePrime;

type
  TForm1 = class(TForm)
    mmoNumere: TMemo;
    btnGenerate: TButton;
    btnStop: TButton;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TNumerePare: TThreadNumerePare;
  TNumereImpare: TThreadNumereImpare;
  TNumerePrime: TThreadNumerePrime;

implementation

{$R *.dfm}

procedure TForm1.btnGenerateClick(Sender: TObject);

begin
  TNumerePare := TThreadNumerePare.Create(False);
  TNumereImpare := TThreadNumereImpare.Create(False);
  TNumerePrime := TThreadNumerePrime.Create(False);
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  TNumerePare.Terminate;
  TNumereImpare.Terminate;
  TNumerePrime.Terminate;
end;

end.
