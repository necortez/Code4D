unit Model.Produtos.DM;

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
  TModelProdutosDM = class(TDataModule)
    QProdutosCadastro: TFDQuery;
    QProdutosBusca: TFDQuery;
    QLook: TFDQuery;
    QProdutosCadastroID: TIntegerField;
    QProdutosCadastroID_SUBGRUPO: TIntegerField;
    QProdutosCadastroNOME: TStringField;
    QProdutosCadastroDESCRICAO: TStringField;
    QProdutosCadastroPRECO_CUSTO: TFMTBCDField;
    QProdutosCadastroPORCENTAGEM: TFMTBCDField;
    QProdutosCadastroPRECO_VENDA: TFMTBCDField;
    QProdutosCadastroUNIDADE: TStringField;
    QProdutosCadastroCODIGO_BARRAS: TStringField;
    QLookNOME: TStringField;
    QProdutosBuscaID: TIntegerField;
    QProdutosBuscaNOME: TStringField;
    QProdutosBuscaPRECO_CUSTO: TFMTBCDField;
    QProdutosBuscaPORCENTAGEM: TFMTBCDField;
    QProdutosBuscaPRECO_VENDA: TFMTBCDField;
    QProdutosBuscaUNIDADE: TStringField;
    QProdutosBuscaCODIGO_BARRAS: TStringField;
    QProdutosBuscaID_SUBGRUPO: TIntegerField;
    QProdutosBuscaSUBGRUPO_NOME: TStringField;
    QProdutosCadastroIMAGEM: TStringField;
    QLookID: TIntegerField;
    QLookPRECO_VENDA: TFMTBCDField;
    QLookUNIDADE: TStringField;
    procedure QProdutosCadastroAfterInsert(DataSet: TDataSet);
    procedure QProdutosCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function LookProdutos(const ACodBarras: String): Boolean;
    procedure CadastrarGet(const AIdProduto: Integer);
    procedure ProdutosBuscar(const Acondicao: string);
    procedure ValidarDadosQueryCadastro;
    { Public declarations }
  end;

var
  ModelProdutosDM: TModelProdutosDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Exceptions.FieldName;

{$R *.dfm}

{ TModelProdutosDM }

procedure TModelProdutosDM.CadastrarGet(const AIdProduto: Integer);
begin
  QProdutosCadastro.close;
  QProdutosCadastro.SQL.Clear;
  QProdutosCadastro.SQL.Add('SELECT * FROM PRODUTOS');
  QProdutosCadastro.SQL.Add('WHERE(ID = :IDPRODUTO)');
  QProdutosCadastro.ParamByName('IDPRODUTO').AsInteger := AIdProduto;
  QProdutosCadastro.Open;
end;

procedure TModelProdutosDM.ProdutosBuscar(const Acondicao: string);
begin
  QProdutosBusca.close;
  QProdutosBusca.SQL.Clear;
  QProdutosBusca.SQL.Add('SELECT ');
  QProdutosBusca.SQL.Add('PRODUTOS.ID, ');
  QProdutosBusca.SQL.Add('PRODUTOS.NOME, ');
  QProdutosBusca.SQL.Add('PRODUTOS.PRECO_CUSTO, ');
  QProdutosBusca.SQL.Add('PRODUTOS.PORCENTAGEM, ');
  QProdutosBusca.SQL.Add('PRODUTOS.PRECO_VENDA, ');
  QProdutosBusca.SQL.Add('PRODUTOS.UNIDADE, ');
  QProdutosBusca.SQL.Add('PRODUTOS.CODIGO_BARRAS, ');
  QProdutosBusca.SQL.Add('PRODUTOS.ID_SUBGRUPO, ');
  QProdutosBusca.SQL.Add('SUBGRUPOS.NOME AS SUBGRUPO_NOME ');
  QProdutosBusca.SQL.Add('FROM PRODUTOS ');
  QProdutosBusca.SQL.Add('JOIN SUBGRUPOS ON (SUBGRUPOS.ID = PRODUTOS.ID_SUBGRUPO)');
  QProdutosBusca.SQL.Add(Acondicao);
  QProdutosBusca.Open;
end;

function TModelProdutosDM.LookProdutos(const ACodBarras: String): Boolean;
begin
  QLook.close;
  QLook.ParamByName('CodBarras').AsString := ACodBarras;
  QLook.Open;

  Result := not QLook.IsEmpty;
end;

procedure TModelProdutosDM.QProdutosCadastroAfterInsert(DataSet: TDataSet);
begin
  QProdutosCadastroPRECO_CUSTO.AsFloat := 0;
  QProdutosCadastroPORCENTAGEM.AsFloat := 0;
  QProdutosCadastroPRECO_VENDA.AsFloat := 0;
  QProdutosCadastroUNIDADE.AsString := 'UN';
end;

procedure TModelProdutosDM.QProdutosCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelProdutosDM.ValidarDadosQueryCadastro;
begin
  if(QProdutosCadastroNOME.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o Campo Nome!', QProdutosCadastroNOME.FieldName);

  if(QProdutosCadastroID_SUBGRUPO.AsInteger <= 0)then
    raise ExceptionFieldName.Create('Subgrupo não informado!', QProdutosCadastroID_SUBGRUPO.FieldName );

  if(QProdutosCadastroPRECO_CUSTO.AsFloat < 0)then
    raise ExceptionFieldName.Create('Preço de custo inválido!', QProdutosCadastroPRECO_CUSTO.FieldName );

  if(QProdutosCadastroPORCENTAGEM.AsFloat < 0)then
    raise ExceptionFieldName.Create('Porcentagem inválida!', QProdutosCadastroPORCENTAGEM.FieldName );

  if(QProdutosCadastroPRECO_VENDA.AsFloat < 0)then
    raise ExceptionFieldName.Create('Preço de venda inválido!', QProdutosCadastroPRECO_VENDA.FieldName );

  if(QProdutosCadastroPRECO_VENDA.AsFloat < QProdutosCadastroPRECO_CUSTO.AsFloat)then
    raise ExceptionFieldName.Create('Preço de venda não pode ser menor que preço de custo!', QProdutosCadastroPRECO_VENDA.FieldName );

  if(QProdutosCadastroUNIDADE.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Informe a Unidade.', QProdutosCadastroUNIDADE.FieldName);

  if(QProdutosCadastroCODIGO_BARRAS.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Informe o Código de Barras!', QProdutosCadastroCODIGO_BARRAS.FieldName);

end;

end.
