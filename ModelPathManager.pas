unit ModelPathManager;

interface

uses
  System.SysUtils, System.Win.Registry, Vcl.Forms, Vcl.Dialogs, Winapi.Windows, ShlObj, FileCtrl, Winapi.Messages;

type
  TModelPathManager = class
  public
    class procedure resetModelsPath;
    class function changeModelsPath: Boolean;
  end;

implementation

class procedure TModelPathManager.resetModelsPath;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('System\CurrentControlSet\Control\Session Manager\Environment', False);
    Reg.DeleteValue('OLLAMA_MODELS');
    Reg.CloseKey;
    // 发送消息通知其他程序
    SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LPARAM(PChar('Environment')), SMTO_ABORTIFHUNG, 5000, nil);
  finally
    Reg.Free;
  end;
end;

class function TModelPathManager.changeModelsPath: Boolean;
var
  Reg: TRegistry;
  Dir: string;
begin
  Result := False;
  if SelectDirectory('请选择模型下载文件夹', '', Dir, [sdNewUI, sdNewFolder]) then
  begin
    Reg := TRegistry.Create(KEY_WRITE);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey('System\CurrentControlSet\Control\Session Manager\Environment', True) then
      begin
        Reg.WriteString('OLLAMA_MODELS', Dir);
        Reg.CloseKey;
        // 发送消息通知其他程序
        SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LPARAM(PChar('Environment')), SMTO_ABORTIFHUNG, 5000, nil);
        Result := True;
      end;
    finally
      Reg.Free;
    end;
  end;
end;

end.

