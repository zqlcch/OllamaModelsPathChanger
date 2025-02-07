Unit OllamaUnit;

interface

uses
  System.SysUtils, System.Win.Registry, Vcl.Dialogs, Winapi.Windows, Vcl.FileCtrl;

type
  TOLLAMAModels = class
  private
    const OLLAMA_MODELS_KEY = 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment';
    const OLLAMA_MODELS_VALUE = 'OLLAMA_MODELS';
  public
    class function isDefaultPath: Boolean;
    class function getModelsPath: string;
    class procedure changeModelsPath;
    class procedure resetModelsPath;
  end;

implementation

class function TOLLAMAModels.isDefaultPath: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Result := not Reg.ValueExists(OLLAMA_MODELS_VALUE);
  finally
    Reg.Free;
  end;
end;

class function TOLLAMAModels.getModelsPath: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly(OLLAMA_MODELS_KEY) and Reg.ValueExists(OLLAMA_MODELS_VALUE) then
      Result := Reg.ReadString(OLLAMA_MODELS_VALUE)
    else
      Result := IncludeTrailingPathDelimiter(GetEnvironmentVariable('USERPROFILE')) + '.ollama\models';
  finally
    Reg.Free;
  end;
end;

class procedure TOLLAMAModels.changeModelsPath;
var
  Reg: TRegistry;
  Folder: string;
begin
  if SelectDirectory('Select Models Path', '', Folder) then
  begin
    Reg := TRegistry.Create(KEY_WRITE);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(OLLAMA_MODELS_KEY, True) then
        Reg.WriteString(OLLAMA_MODELS_VALUE, Folder);
    finally
      Reg.Free;
    end;
  end;
end;

class procedure TOLLAMAModels.resetModelsPath;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(OLLAMA_MODELS_KEY, True) then
      Reg.DeleteValue(OLLAMA_MODELS_VALUE);
  finally
    Reg.Free;
  end;
end;

end.

