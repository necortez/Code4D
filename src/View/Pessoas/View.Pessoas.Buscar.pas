unit View.Pessoas.Buscar;

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
  Model.Pessoas.DM,
  View.Pessoas.Cadastrar;
type
  TViewPessoasBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
  private

  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const Aid: Integer = 0); override;
  end;

var
  ViewPessoasBuscar: TViewPessoasBuscar;

implementation

{$R *.dfm}



{ TViewPessoasBuscar }

procedure TViewPessoasBuscar.BuscarDados;
var
  Lcondicao, LStrBuscar: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  Lcondicao := '';
  case rdgroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE (PESSOAS.ID LIKE ' + LStrBuscar + ')';
    1: LCondicao := 'WHERE (upper(PESSOAS.NOME) LIKE ' + LStrBuscar + ')or(upper(PESSOAS.FANTASIA) LIKE ' + LStrBuscar + ')';
    2: LCondicao := 'WHERE (upper(CIDADE.NOME) LIKE ' + LStrBuscar + ')';
  end;

  ModelPessoasDM.PessoasBuscar(Lcondicao);

  inherited;

end;

procedure TViewPessoasBuscar.ChamarTelaCadastrar(const Aid: Integer = 0);
var
  LViewPessoasCadastrar: TViewPessoasCadastrar;
begin
  inherited;
  LViewPessoasCadastrar := TViewPessoasCadastrar.Create(nil);
  try
    LViewPessoasCadastrar.idRegistroAlterar := AId;
    if(LViewPessoasCadastrar.ShowModal = mrOk) then
    begin
      inherited UltId := LViewPessoasCadastrar.UltId;
      Self.BuscarDados;
    end;
  finally
    LViewPessoasCadastrar.Free;
  end;
end;

procedure TViewPessoasBuscar.Excluir1Click(Sender: TObject);
begin
    if (ModelPessoasDM.QPessoasBuscaID.AsInteger = 1)then
    raise Exception.Create('A pessoa com o código 1 não pode ser excluído!');

  inherited;

end;

procedure TViewPessoasBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelPessoasDM = nil) then
    ModelPessoasDM := TModelPessoasDM.Create(nil);
end;

procedure TViewPessoasBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelPessoasDM);
end;

end.
