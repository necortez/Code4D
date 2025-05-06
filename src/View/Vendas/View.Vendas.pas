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
  Model.Vendas.Dm,
  Utils,
  Model.Produtos.DM,
  Vcl.Imaging.jpeg,
  FireDAC.Comp.Client;

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
    procedure edtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DSVendasItensListarDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    FDM : TModelVendasDm;
    procedure ProcessarF2;
    procedure LimparTela;
    procedure ImagemPadrao;
    procedure ProcessarESC;
    procedure CancelarVenda;
    procedure ProcessarF3;
    procedure ProcessarEnterEdtLancamento;
    procedure TotalizarVenda;
    procedure ProcessarDelete;
    procedure DeletarItemSelecionado;
    procedure DeletarVendaAtual;

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
  FDM := ModelVendasDm;

  if(ModelProdutosDM = nil)then
    ModelProdutosDM := TModelProdutosDM.Create(nil);

end;

procedure TViewVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ModelProdutosDM);
  FreeAndNil(ModelVendasDm);
end;

procedure TViewVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (Key) of

    VK_F2:
      Self.ProcessarF2;

    VK_F3:
      Self.ProcessarF3;

    VK_F4:
    begin
      if (ssAlt in Shift) then
        Key := 0;
    end;

    VK_ESCAPE:
      Self.ProcessarESC;

    VK_UP:
    begin
      DBGrid1.DataSource.DataSet.Prior;
      key := 0;
    end;

     VK_DOWN:
    begin
      DBGrid1.DataSource.DataSet.Next;
      key := 0;
    end;

    VK_DELETE:
      Self.ProcessarDelete;
  end;
end;

procedure TViewVendas.ProcessarDelete;
begin
  if(FDM.QVendasCadastrar.State in dsEditModes)then
    Self.DeletarItemSelecionado
  else
    Self.DeletarVendaAtual;
end;

procedure TViewVendas.DeletarItemSelecionado;
begin
  if not(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  if FDM.QVendasItensListar.IsEmpty then
    raise Exception.Create('Selecione um item para ser excluído');

  if(Application.MessageBox('Confirma exclusão do item selecionado?','Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)then
      Exit;

  FDM.QVendasItensListar.Delete;
  Self.TotalizarVenda;
end;

procedure TViewVendas.DeletarVendaAtual;
begin
  //
end;

procedure TViewVendas.ProcessarF2;
begin
  //if(ModelVendasDm.QVendasCadastrar.State in [DsInsert, DsEdit])then
  if(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  Self.LimparTela;
  FDM.QVendasCadastrar.Append;
  lbMSG.Caption := 'inserindo produtos na venda';
  edtLancamento.SetFocus;
end;

procedure TViewVendas.ProcessarF3;
begin
  if not(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  FDM.QVendasCadastrar.Post;
  Self.LimparTela;
  edtLancamento.SetFocus;

end;

procedure TViewVendas.LimparTela;
begin
  FDM.VendasGet;
  FDM.VendasItemsGet;
  FDM.VendasItemsListar;
  Self.ImagemPadrao;
  lbMSG.Caption := 'Tecle F2 para iniciar uma nova venda';
end;

procedure TViewVendas.ProcessarESC;
begin
  if(FDM.QVendasCadastrar.State in dsEditModes)then
    Self.CancelarVenda
  else
    Self.Close;
end;

procedure TViewVendas.CancelarVenda;
begin
  if(Application.MessageBox('Confirma cancelamento desta venda?','Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)then
      Exit;
  FDM.QVendasCadastrar.Cancel;
  Self.LimparTela;
end;

procedure TViewVendas.ImagemPadrao;
begin
  imgFoto.Picture.LoadFromFile(TUtils.GetpastaImg + 'img_padrao.jpeg' );
end;

procedure TViewVendas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not odd(TDBGrid(Sender).DataSource.DataSet.RecNo)) then
    TDBGrid(Sender).Canvas.Brush.Color := $00DDDDDD;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewVendas.DBGrid1TitleClick(Column: TColumn);
var
  LCampo, LOrdem: string;

begin
  if (DSVendasItensListar.DataSet.IsEmpty)then
    Exit;

  LCampo := Column.FieldName.Trim;
  if(LCampo.IsEmpty)or(Column.Field.FieldKind = fkCalculated)then
    Exit;

  LOrdem := LCampo + ':D';
  if(TFDQuery(DSVendasItensListar.DataSet).IndexFieldNames.Contains(':D'))then
    LOrdem := LCampo;
  TFDQuery(DSVendasItensListar.DataSet).IndexFieldNames := LOrdem;
end;

procedure TViewVendas.DSVendasItensListarDataChange(Sender: TObject;
  Field: TField);
var
  LFileImg: String;
begin
  if (FDM.QVendasItensListar.IsEmpty) then
    Exit;

  if (FDM.QVendasItensListarID.AsInteger <= 0) then
    Exit;

  if (FDM.QVendasItensListarIMAGEM.AsString.Trim.IsEmpty) then
  begin
    Self.ImagemPadrao;
    Exit;
  end;

  LFileImg := TUtils.GetPastaImgProdutos + FDM.QVendasItensListarIMAGEM.AsString.Trim;

  if (not FileExists(LFileImg)) then
  begin
    Self.ImagemPadrao;
    Exit;
  end;

  imgFoto.Picture.LoadFromFile(LFileImg);
end;

procedure TViewVendas.edtLancamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Self.ProcessarEnterEdtLancamento;
end;

procedure TViewVendas.ProcessarEnterEdtLancamento;
var
  LCodBarras: String;
  LQtde, LDesconto, LAcrescimo : Double;
begin
  if not(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  if(Trim(edtLancamento.Text).IsEmpty)then
    Exit;

  TUtils.PegarDadosLancamento(edtLancamento.Text, LCodBarras, LQtde, LDesconto, LAcrescimo );

  if(not ModelProdutosDM.LookProdutos(LCodBarras))then
  begin
    edtLancamento.SetFocus;
    raise Exception.Create('Produto não encontrado');
  end;

  if(FDM.QVendasCadastrar.State in [dsInsert])then
  begin
    FDM.QVendasCadastrar.Post;
    FDM.QVendasCadastrar.Edit;
  end;

  FDM.QVendasItensCadastrar.Append;
  FDM.QVendasItensCadastrarID_VENDA.AsInteger :=  FDM.QVendasCadastrarID.AsInteger;
  FDM.QVendasItensCadastrarID_PRODUTO.AsInteger := ModelProdutosDM.QLookID.AsInteger;
  FDM.QVendasItensCadastrarQUANTIDADE.AsFloat := LQtde;
  FDM.QVendasItensCadastrarVALOR_UNITARIO.AsFloat := ModelProdutosDM.QLookPRECO_VENDA.AsFloat;
  FDM.QVendasItensCadastrarTOTAL_BRUTO.AsFloat := FDM.QVendasItensCadastrarQUANTIDADE.AsFloat * FDM.QVendasItensCadastrarVALOR_UNITARIO.AsFloat;
  FDM.QVendasItensCadastrarDESCONTO.AsFloat := LDesconto;
  FDM.QVendasItensCadastrarACRESCIMO.AsFloat := LAcrescimo;
  FDM.QVendasItensCadastrarTOTAL_LIQUIDO.AsFloat := FDM.QVendasItensCadastrarTOTAL_BRUTO.AsFloat - FDM.QVendasItensCadastrarDESCONTO.AsFloat
    + FDM.QVendasItensCadastrarACRESCIMO.AsFloat;
  FDM.QVendasItensCadastrar.Post;

  FDM.VendasItemsListar(FDM.QVendasCadastrarID.AsInteger, FDM.QVendasItensCadastrarID.AsInteger);


  Self.TotalizarVenda;

  edtLancamento.Clear;
  edtLancamento.SetFocus;
end;

procedure TViewVendas.TotalizarVenda;
begin
  if not(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  FDM.VendaTotalizar(FDM.QVendasCadastrarID.AsInteger);
  FDM.QVendasCadastrarTOTAL_BRUTO.AsFloat := FDM.QVendasTotalizarTOTALBRUTO.AsFloat;
  FDM.QVendasCadastrarTOTAL_DESCONTOS.AsFloat := FDM.QVendasTotalizarTOTALDESCONTO.AsFloat;
  FDM.QVendasCadastrarTOTAL_ACRESCIMOS.AsFloat := FDM.QVendasTotalizarTOTALACRESCIMO.AsFloat;
  FDM.QVendasCadastrarTOTAL_LIQUIDO.AsFloat := FDM.QVendasTotalizarTOTALLIQUIDO.AsFloat;
  FDM.QVendasCadastrar.Post;
  FDM.QVendasCadastrar.Edit;

end;



end.
