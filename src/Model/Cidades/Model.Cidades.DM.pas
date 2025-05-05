unit Model.Cidades.DM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Model.Conexao.DM;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TFDQuery;
    QCidadesBusca: TFDQuery;
    QCidadesCadastroID: TIntegerField;
    QCidadesCadastroNOME: TStringField;
    QCidadesCadastroUF: TStringField;
    QCidadesCadastroCODIGO_IBGE: TIntegerField;
    QCidadesBuscaID: TIntegerField;
    QCidadesBuscaNOME: TStringField;
    QCidadesBuscaUF: TStringField;
    QCidadesBuscaCODIGO_IBGE: TIntegerField;
    QLook: TFDQuery;
    QLookNOME: TStringField;
    QLookUF: TStringField;
    procedure QCidadesCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure CidadesBuscar(const Acondicao: string);
    procedure CadastrarGet(const AIdCidade: Integer);
    procedure ValidarDadosQueryCadastro;
    procedure LookCidade(const AIdCidade: Integer);
    { Public declarations }
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Exceptions.FieldName;

{$R *.dfm}

{ TModelCidadesDM }

procedure TModelCidadesDM.CadastrarGet(const AIdCidade: Integer);
begin
  QCidadesCadastro.close;
  QCidadesCadastro.SQL.Clear;
  QCidadesCadastro.SQL.Add('SELECT * FROM CIDADES');
  QCidadesCadastro.SQL.Add('WHERE(ID = :IDCIDADE)');
  QCidadesCadastro.ParamByName('IDCIDADE').AsInteger := AIdCidade;
  QCidadesCadastro.Open;
end;

procedure TModelCidadesDM.CidadesBuscar(const Acondicao: string);
begin
  QCidadesBusca.close;
  QCidadesBusca.SQL.Clear;
  QCidadesBusca.SQL.Add('SELECT * FROM CIDADES');
  QCidadesBusca.SQL.Add(Acondicao);
  QCidadesBusca.Open;
end;

procedure TModelCidadesDM.LookCidade(const AIdCidade: Integer);
begin
  QLook.close;
  QLook.ParamByName('IDCIDADE').AsInteger := AIdCidade;
  QLook.Open;
end;

procedure TModelCidadesDM.QCidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelCidadesDM.ValidarDadosQueryCadastro;
begin
  if(QCidadesCadastroNOME.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o campo NOME','NOME');

  if(QCidadesCadastroUF.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o campo UF', 'UF');

  if(QCidadesCadastroCODIGO_IBGE.AsInteger > 0)then
  begin
    if (Length(QCidadesCadastroCODIGO_IBGE.AsString) <> 7) then
      raise ExceptionFieldName.Create('Código do IBGE deve conter 7 dígitos', 'CODIGO_IBGE');
  end;

end;


end.
