unit View.Subgrupos.Buscar;

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
  Vcl.Menus,
  Model.Subgrupos.DM;

type
  TViewSubgruposBuscar = class(TViewHerancasBuscar)
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
  ViewSubgruposBuscar: TViewSubgruposBuscar;

implementation

{$R *.dfm}

uses
  View.Subgrupos.Cadastrar;

{ TViewCidadesBuscar }

procedure TViewSubgruposBuscar.BuscarDados;
var
  Lcondicao, LStrBuscar: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  Lcondicao := '';
  case rdgroupFiltros.ItemIndex of
    0: LCondicao := 'WHERE (ID LIKE ' + LStrBuscar + ')';
    1: LCondicao := 'WHERE (upper(NOME) LIKE ' + LStrBuscar + ')';

  end;

  ModelSubgruposDM.SubgruposBuscar(Lcondicao);

  inherited;

end;

procedure TViewSubgruposBuscar.ChamarTelaCadastrar(const Aid: Integer = 0);
var
  LViewSubgruposCadastrar: TViewSubgruposCadastrar;
begin
  inherited;
  LViewSubgruposCadastrar := TViewSubgruposCadastrar.Create(nil);
  try
    LViewSubgruposCadastrar.idRegistroAlterar := AId;
    if(LViewSubgruposCadastrar.ShowModal = mrOk) then
    begin
      inherited UltId := LViewSubgruposCadastrar.UltId;
      Self.BuscarDados;
    end;
  finally
    LViewSubgruposCadastrar.Free;
  end;
end;

procedure TViewSubgruposBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelSubgruposDM = nil) then
    ModelSubgruposDM := TModelSubgruposDM.Create(nil);
end;

procedure TViewSubgruposBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelSubgruposDM);
end;

end.
