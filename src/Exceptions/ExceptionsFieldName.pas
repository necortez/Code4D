unit ExceptionsFieldName;

interface

uses
  System.SysUtils;

type
  ExceptionFieldName = class(Exception)
  private
    FFieldName: string;
  public
    constructor Create(const AMessage, AFieldName: String); reintroduce;
    property FieldName: string read FFieldName write FFieldName;

  end;

implementation

{ ExceptionFieldName }

constructor ExceptionFieldName.Create(const AMessage, AFieldName: String);
begin
  Self.Message := AMessage;
  FFieldName := AFieldName;
end;

end.
