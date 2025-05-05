unit View.Cidades.Cadastrar;

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
  Model.Cidades.DM,
  Vcl.DBCtrls,
  Vcl.Mask;

type
  TViewCidadesCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;

    [FieldName('NOME')]
    edtNome: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;

    [FieldName('CODIGO_IBGE')]
    edtIBGE: TDBEdit;

    [FieldName('UF')]
    cmbUf: TDBComboBox;
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

procedure TViewCidadesCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource.DataSet.Post;
  except
    on E: ExceptionFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

procedure TViewCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelCidadesDM.CadastrarGet(inherited idRegistroAlterar);
  if (DataSource.DataSet.IsEmpty) then
    DataSource.DataSet.Append
  else
    DataSource.DataSet.Edit;

  edtNome.SetFocus;
end;

end.
