unit View.Vendas;

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
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Imaging.pngimage,
  Model.Vendas.Dm, Utils;

type
  TViewVendas = class(TForm)
    pnBackTudo: TPanel;
    pn_msgTopo: TPanel;
    lbMSG: TLabel;
    pnCorpo: TPanel;
    pnCorpoEsquerda: TPanel;
    pnCorpoDireita: TPanel;
    Lançamento: TLabel;
    edtLancamento: TEdit;
    pnBackValores: TPanel;
    Label2: TLabel;
    edtQuantidade: TDBEdit;
    Label3: TLabel;
    edtValorUnitario: TDBEdit;
    Label4: TLabel;
    edtDesconto: TDBEdit;
    Label5: TLabel;
    edtAcrescimo: TDBEdit;
    Label6: TLabel;
    edtTotalLiquido: TDBEdit;
    pnImagemItem: TPanel;
    Panel2: TPanel;
    imgFoto: TImage;
    pn_rodape_direita: TPanel;
    DBGrid1: TDBGrid;
    pn_rodape_esquerda: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel3: TPanel;
    Label12: TLabel;
    edtTotaldaVenda: TDBEdit;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    DSVendasCadastrar: TDataSource;
    DSVendasItensListar: TDataSource;
    DSVendasItensCadastrar: TDataSource;
    lbDbVendasNumero: TDBText;
    lbDBDataVenda: TDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ProcessarF2;
    procedure LimparTela;
    procedure ImagemPadrao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewVendas: TViewVendas;

implementation

{$R *.dfm}

procedure TViewVendas.FormCreate(Sender: TObject);
begin
  if(ModelVendasDM = nil)then
  ModelVendasDm := TModelVendasDm.Create(nil);
end;

procedure TViewVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ModelVendasDm);
end;

procedure TViewVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of
    VK_F2:
      Self.ProcessarF2;
    VK_F4:
    begin
      if (ssAlt in Shift) then
        Key := 0;
    end;


  end;
end;

procedure TViewVendas.ProcessarF2;
begin
  //if(ModelVendasDm.QVendasCadastrar.State in [DsInsert, DsEdit])then
  if(ModelVendasDm.QVendasCadastrar.State in dsEditModes)then
    Exit;

  Self.LimparTela;
end;

procedure TViewVendas.LimparTela;
begin
  ModelVendasDm.VendasGet;
  ModelVendasDm.VendasItemsGet;
  ModelVendasDm.VendasItemsListar;
  Self.ImagemPadrao;
  lbMSG.Caption := 'Tecle F2 para iniciar uma nova venda';

procedure TViewVendas.ImagemPadrao;
begin
  imgFoto.Picture.LoadFromFile(TUtils.GetpastaImg + 'img_padrao.png' );
end;

end.
