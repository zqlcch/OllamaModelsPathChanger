unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ModelPathManager;

var
  m : TModelPathManager;

procedure TForm1.Button1Click(Sender: TObject);
begin
  m.resetModelsPath;
  MessageBox(Handle,PWideCHar('Ollama 模型下载文件夹已重置为默认值，即 用户文件夹\.ollama\models') , '提示', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if m.changeModelsPath then
  MessageBox(Handle,'Ollama 模型下载文件夹修改完成，请重启生效', '提示', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  m:= TModelPathManager.Create;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://space.bilibili.com/478972081?spm_id_from=333.1007.0.0' , nil, nil, SW_SHOWNORMAL);
end;

end.
