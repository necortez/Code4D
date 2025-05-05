unit Model.Vendas.Dm;

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
  TModelVendasDm = class(TDataModule)
    QVendasCadastrar: TFDQuery;
    QVendasItensCadastrar: TFDQuery;
    QVendasItensListar: TFDQuery;
    QVendasCadastrarID: TIntegerField;
    QVendasCadastrarID_PESSOA: TIntegerField;
    QVendasCadastrarDATA: TDateField;
    QVendasCadastrarHORA: TTimeField;
    QVendasCadastrarTOTAL_BRUTO: TFMTBCDField;
    QVendasCadastrarTOTAL_DESCONTOS: TFMTBCDField;
    QVendasCadastrarTOTAL_ACRESCIMOS: TFMTBCDField;
    QVendasCadastrarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensCadastrarID: TIntegerField;
    QVendasItensCadastrarID_VENDA: TIntegerField;
    QVendasItensCadastrarID_PRODUTO: TIntegerField;
    QVendasItensCadastrarQUANTIDADE: TFMTBCDField;
    QVendasItensCadastrarVALOR_UNITARIO: TFMTBCDField;
    QVendasItensCadastrarDESCONTO: TFMTBCDField;
    QVendasItensCadastrarACRESCIMO: TFMTBCDField;
    QVendasItensCadastrarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensListarID: TIntegerField;
    QVendasItensListarID_VENDA: TIntegerField;
    QVendasItensListarID_PRODUTO: TIntegerField;
    QVendasItensListarQUANTIDADE: TFMTBCDField;
    QVendasItensListarVALOR_UNITARIO: TFMTBCDField;
    QVendasItensListarDESCONTO: TFMTBCDField;
    QVendasItensListarACRESCIMO: TFMTBCDField;
    QVendasItensListarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensListarPRODUTONOME: TStringField;
    QVendasItensCadastrarTOTAL_BRUTO: TFMTBCDField;
    procedure QVendasCadastrarAfterInsert(DataSet: TDataSet);
    procedure QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VendasGet(const AidVenda: Integer = 0);
    procedure VendasItemsGet(const AidItem: Integer = 0);
    procedure VendasItemsListar(const AIdVenda: Integer = 0; const AIdItemVendaFocar: Integer = 0);

  end;

var
  ModelVendasDm: TModelVendasDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelVendasDm }

procedure TModelVendasDm.QVendasCadastrarAfterInsert(DataSet: TDataSet);
begin
  QVendasCadastrarID_PESSOA.AsInteger := 1;
  QVendasCadastrarDATA.AsDateTime := Date;
  QVendasCadastrarHORA.AsDateTime := Time;
  QVendasCadastrarTOTAL_BRUTO.AsFloat := 0;
  QVendasCadastrarTOTAL_DESCONTOS.AsFloat := 0;
  QVendasCadastrarTOTAL_ACRESCIMOS.AsFloat := 0;
  QVendasCadastrarTOTAL_LIQUIDO.AsFloat := 0;

end;

procedure TModelVendasDm.QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
begin
  QVendasItensCadastrarQUANTIDADE.AsFloat := 1;
  QVendasItensCadastrarVALOR_UNITARIO.AsFloat := 0;
  QVendasItensCadastrarTOTAL_BRUTO.AsFloat := 0;
  QVendasItensCadastrarDESCONTO.AsFloat := 0;
  QVendasItensCadastrarACRESCIMO.AsFloat := 0;
  QVendasItensCadastrarTOTAL_LIQUIDO.AsFloat := 0;
end;

procedure TModelVendasDm.VendasGet(const AidVenda: Integer = 0);
begin
  QVendasCadastrar.Close;
  QVendasCadastrar.ParamByName('IDVENDA').AsInteger := AIdVenda;
  QVendasCadastrar.Open;
end;

procedure TModelVendasDm.VendasItemsGet(const AidItem: Integer = 0);
begin
  QVendasItensCadastrar.Close;
  QVendasItensCadastrar.ParamByName('IDITEM').AsInteger := AIdItem;
  QVendasItensCadastrar.Open;
end;



procedure TModelVendasDm.VendasItemsListar(const AIdVenda: Integer = 0;
  const AIdItemVendaFocar: Integer = 0);
begin
  QVendasItensListar.DisableControls;
  try
    QVendasItensListar.Close;
    QVendasItensListar.ParamByName('IDVENDA').AsInteger := AIdVenda;
    QVendasItensListar.Open;

    if(AIdItemVendaFocar > 0)then
      QVendasItensListar.Locate('ID', AIdItemVendaFocar, [loCaseInsensitive]);
  finally
    QVendasItensListar.EnableControls;
  end;
end;

end.
