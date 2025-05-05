unit View.Produtos.Buscar;

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
  View.Herancas.Buscar,
  Data.DB,
  Vcl.Menus,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Model.Produtos.DM,
  View.Produtos.Cadastrar;

type
  TViewProdutosBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const Aid: Integer = 0); override;
  end;

var
  ViewProdutosBuscar: TViewProdutosBuscar;

implementation

{$R *.dfm}

procedure TViewProdutosBuscar.BuscarDados;
var
  Lcondicao, LStrBuscar: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  Lcondicao := '';
  case rdgroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE (PRODUTOS.ID LIKE ' + LStrBuscar + ')';
    1: LCondicao := 'WHERE (upper(PRODUTOS.NOME) LIKE ' + LStrBuscar + ')';
    2: LCondicao := 'WHERE (PRODUTOS.CODIGO_BARRAS) LIKE ' + LStrBuscar + ')';
    3: LCondicao := 'WHERE (upper(SUBGRUPOS.NOME) LIKE ' + LStrBuscar + ')';
  end;

  ModelProdutosDM.ProdutosBuscar(Lcondicao);
  inherited;
end;

procedure TViewProdutosBuscar.ChamarTelaCadastrar(const Aid: Integer = 0);
var
  LViewProdutosCadastrar: TViewProdutosCadastrar;
begin
  inherited;
  LViewProdutosCadastrar := TViewProdutosCadastrar.Create(nil);
  try
    LViewProdutosCadastrar.idRegistroAlterar := AId;
    if(LViewProdutosCadastrar.ShowModal = mrOk) then
    begin
      inherited UltId := LViewProdutosCadastrar.UltId;
      Self.BuscarDados;
    end;
  finally
    LViewProdutosCadastrar.Free;
  end;
end;

procedure TViewProdutosBuscar.Excluir1Click(Sender: TObject);
begin
  if (ModelProdutosDM.QProdutosBuscaID.AsInteger = 1)then
    raise Exception.Create('O Produto com o código 1 não pode ser excluído!');
  inherited;

end;

procedure TViewProdutosBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if(ModelProdutosDM = nil)then
    ModelProdutosDM := TModelProdutosDM.Create(nil);

end;

procedure TViewProdutosBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelProdutosDM);
end;

end.
