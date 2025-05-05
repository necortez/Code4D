unit Model.Pessoas.DM;

interface

uses
  System.SysUtils,
  System.Classes,
  Model.Conexao.DM,
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
  FireDAC.Comp.Client;

type
  TModelPessoasDM = class(TDataModule)
    QPessoasCadastro: TFDQuery;
    QPessoasBusca: TFDQuery;
    QPessoasCadastroID: TIntegerField;
    QPessoasCadastroNOME: TStringField;
    QPessoasCadastroFANTASIA: TStringField;
    QPessoasCadastroCLIENTE: TStringField;
    QPessoasCadastroFORNECEDOR: TStringField;
    QPessoasCadastroCEP: TStringField;
    QPessoasCadastroID_CIDADE: TIntegerField;
    QPessoasCadastroENDERECO: TStringField;
    QPessoasCadastroNUMERO: TStringField;
    QPessoasCadastroBAIRRO: TStringField;
    QPessoasCadastroCOMPLEMENTO: TStringField;
    QPessoasCadastroTELEFONE: TStringField;
    QPessoasCadastroCELULAR: TStringField;
    QPessoasCadastroEMAIL: TStringField;
    QPessoasCadastroTIPO_JURIDICO: TIntegerField;
    QPessoasCadastroCPF: TStringField;
    QPessoasCadastroRG: TStringField;
    QPessoasCadastroCNPJ: TStringField;
    QPessoasCadastroIE: TStringField;
    QPessoasCadastroATIVO: TStringField;
    QPessoasCadastroNASCIMENTO: TDateField;
    QPessoasCadastroDH_CADASTRO: TSQLTimeStampField;
    QPessoasBuscaID: TIntegerField;
    QPessoasBuscaNOME: TStringField;
    QPessoasBuscaFANTASIA: TStringField;
    QPessoasBuscaCLIENTE: TStringField;
    QPessoasBuscaFORNECEDOR: TStringField;
    QPessoasBuscaID_CIDADE: TIntegerField;
    QPessoasBuscaCIDADENOME: TStringField;
    QPessoasBuscaUF: TStringField;
    QPessoasBuscaENDERECO: TStringField;
    QPessoasBuscaTELEFONE: TStringField;
    QPessoasBuscaCELULAR: TStringField;
    procedure QPessoasCadastroAfterInsert(DataSet: TDataSet);
    procedure QPessoasCadastroBeforePost(DataSet: TDataSet);
  private
    procedure ValidarDadosQueryCadastro;
    { Private declarations }
  public
    procedure CadastrarGet(const AIdPessoa: Integer);
    procedure PessoasBuscar(const Acondicao: string);
  end;

var
  ModelPessoasDM: TModelPessoasDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Exceptions.FieldName;


{$R *.dfm}

procedure TModelPessoasDM.CadastrarGet(const AIdPessoa: Integer);
begin
  QPessoasCadastro.close;
  QPessoasCadastro.SQL.Clear;
  QPessoasCadastro.SQL.Add('SELECT * FROM PESSOAS');
  QPessoasCadastro.SQL.Add('WHERE(ID = :IDPESSOAS)');
  QPessoasCadastro.ParamByName('IDPESSOAS').AsInteger := AIdPessoa;
  QPessoasCadastro.Open;
end;

procedure TModelPessoasDM.PessoasBuscar(const Acondicao: string);
begin
  QpessoasBusca.close;
  QpessoasBusca.SQL.Clear;
  QpessoasBusca.SQL.Add('SELECT ');
  QpessoasBusca.SQL.Add('PESSOAS.ID, ');
  QpessoasBusca.SQL.Add('PESSOAS.NOME, ');
  QpessoasBusca.SQL.Add('PESSOAS.FANTASIA, ');
  QpessoasBusca.SQL.Add('PESSOAS.CLIENTE, ');
  QpessoasBusca.SQL.Add('PESSOAS.FORNECEDOR, ');
  QpessoasBusca.SQL.Add('PESSOAS.ID_CIDADE, ');
  QpessoasBusca.SQL.Add('CIDADES.NOME as CIDADENOME, ');
  QpessoasBusca.SQL.Add('CIDADES.UF, ');
  QpessoasBusca.SQL.Add('PESSOAS.ENDERECO, ');
  QpessoasBusca.SQL.Add('PESSOAS.TELEFONE, ');
  QpessoasBusca.SQL.Add('PESSOAS.CELULAR ');
  QpessoasBusca.SQL.Add('FROM PESSOAS ');
  QpessoasBusca.SQL.Add('INNER JOIN CIDADES ON (CIDADES.ID = PESSOAS.ID_CIDADE)');
  QpessoasBusca.SQL.Add(Acondicao);
  QpessoasBusca.Open;
end;

procedure TModelPessoasDM.QPessoasCadastroAfterInsert(DataSet: TDataSet);
begin
  QPessoasCadastroATIVO.AsString := 'S';
  QPessoasCadastroCLIENTE.AsString := 'S';
  QPessoasCadastroFORNECEDOR.AsString := 'S';
  QPessoasCadastroDH_CADASTRO.AsDateTime := Now;
  QPessoasCadastroTIPO_JURIDICO.AsInteger := 1;
end;

procedure TModelPessoasDM.QPessoasCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelPessoasDM.ValidarDadosQueryCadastro;
begin
  if(QPessoasCadastroNOME.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o campo: Nome ','NOME');

  if(QPessoasCadastroFANTASIA.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o campo: Fantasia', 'FANTASIA');

  if(QPessoasCadastroID_CIDADE.AsInteger <= 0)then
    raise ExceptionFieldName.Create('Preencha o campo: Código da cidade', 'ID_CIDADE');

end;

end.
