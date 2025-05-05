unit View.Cidades.Buscar;

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
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Menus;

type
  TViewCidadesBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const Aid: Integer = 0); override;
  public
    { Public declarations }
  end;

var
  ViewCidadesBuscar: TViewCidadesBuscar;

implementation

{$R *.dfm}

uses
  Model.Cidades.DM,
  View.Cidades.Cadastrar;

{ TViewCidadesBuscar }

procedure TViewCidadesBuscar.BuscarDados;
var
  Lcondicao, LStrBuscar: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  Lcondicao := '';
  case rdgroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE (CODIGO_IBGE LIKE ' + LStrBuscar + ')';
    1: LCondicao := 'WHERE (upper(NOME) LIKE ' + LStrBuscar + ')';
    2: LCondicao := 'WHERE (upper(UF) LIKE ' + LStrBuscar + ')';
  end;

  ModelCidadesDM.CidadesBuscar(Lcondicao);

  inherited;

end;

procedure TViewCidadesBuscar.ChamarTelaCadastrar(const Aid: Integer = 0);
var
  LViewCidadesCadastrar: TViewCidadesCadastrar;
begin
  inherited;
  LViewCidadesCadastrar := TViewCidadesCadastrar.Create(nil);
  try
    LViewCidadesCadastrar.idRegistroAlterar := AId;
    if(LViewCidadesCadastrar.ShowModal = mrOk) then
    begin
      inherited UltId := LViewCidadesCadastrar.UltId;
      Self.BuscarDados;
    end;
  finally
    LViewCidadesCadastrar.Free;
  end;
end;

procedure TViewCidadesBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelCidadesDM = nil) then
    ModelCidadesDM := TModelCidadesDM.Create(nil);
end;

procedure TViewCidadesBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelCidadesDM);
end;

end.
