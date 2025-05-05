unit View.Subgrupos.Cadastrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  View.Herancas.Cadastrar,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Model.Subgrupos.DM,
  Vcl.DBCtrls,
  Vcl.Mask;

type
  TViewSubgruposCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    [FieldName('NOME')]
    edtNome: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private

  public

end;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName,
  RTTI.FieldName,
  Utils;

procedure TViewSubgruposCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource.DataSet.Post;
  except
    on E: ExceptionFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

procedure TViewSubgruposCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelSubgruposDM.CadastrarGet(inherited idRegistroAlterar);
  if (DataSource.DataSet.IsEmpty) then
    DataSource.DataSet.Append
  else
    DataSource.DataSet.Edit;

  edtNome.SetFocus;
end;

end.
