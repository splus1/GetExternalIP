unit Unit1;
{* Simple Program that gets the external address (or Nat'd address)
   you are using to get to the internet.

   5-15-2017 SPLUS1

*}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, IdHTTP, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    ComboBox1: TComboBox;
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  get_url, cbxitem : string;
  resp : TMemoryStream;
begin
  if ComboBox1.ItemIndex > -1 then
     cbxitem := ComboBox1.Items[ComboBox1.ItemIndex];
  get_url := 'http://'+cbxitem;
  //get_url := 'http://ipv4bot.whatismyipaddress.com/'; // This was test to bypass the ComboBox1
  resp := TMemoryStream.Create;
  try
    IdHTTP1.Get(get_url, resp);
    resp.Position:=0;
    Memo1.Lines.LoadFromStream(resp);
  finally
    resp.Free;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   ShowMessage('This utility helps to identify the external or internet ip address of the network that you are currently on. Returns only the IP Address.');
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
begin
  Memo1.Clear;
end;



end.

