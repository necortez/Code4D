unit View.Herancas.Buscar;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus,
  FireDAC.Comp.Client;

type
  TViewHerancasBuscar = class(TForm)
    pnTopo: TPanel;
    pnRodape: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtBuscar: TEdit;
    rdgroupFiltros: TRadioGroup;
    btnCadastrar: TBitBtn;
    btnUtilizar: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    pnTotal: TPanel;
    lbTotal: TLabel;
    DataSource1: TDataSource;
    btnAlterar: TBitBtn;
    PopupMenu: TPopupMenu;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure btnUtilizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdgroupFiltrosClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    FUltId: integer;
    FIdSelecionado: Integer;
    { Private declarations }

  protected
    procedure BuscarDados; virtual;
    procedure ChamarTelaCadastrar(const Aid: Integer = 0); virtual; abstract;

  public
    property UltId: integer write FUltId;
    property IdSelecionado: Integer read FIdSelecionado write FIdSelecionado;
  end;

var
  ViewHerancasBuscar: TViewHerancasBuscar;

implementation

{$R *.dfm}

procedure TViewHerancasBuscar.Atualizar1Click(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.btnAlterarClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro!');

  FUltId := DataSource1.DataSet.FieldByName('ID').AsInteger;
  Self.ChamarTelaCadastrar(DataSource1.DataSet.FieldByName('ID').AsInteger);
end;

procedure TViewHerancasBuscar.btnCadastrarClick(Sender: TObject);
begin
  FUltId := 0;
  if (not DataSource1.DataSet.IsEmpty) then
    DataSource1.DataSet.FieldByName('ID').AsInteger;

  Self.ChamarTelaCadastrar;
end;

procedure TViewHerancasBuscar.btnFecharClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasBuscar.btnUtilizarClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro!');

  FIdSelecionado := DataSource1.DataSet.FieldByName('ID').AsInteger;
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TViewHerancasBuscar.edtBuscarChange(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.edtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case(key)of
    VK_UP: DataSource1.DataSet.Prior;
    VK_DOWN: DataSource1.DataSet.Next;
  end;
end;

procedure TViewHerancasBuscar.edtBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (not DataSource1.DataSet.IsEmpty)then
    btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.Excluir1Click(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro!');

  if(Application.MessageBox('Confirma exclusão deste registro ?',
    'Confirma Exclusão?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes)
  then
    Exit;

  DataSource1.DataSet.Delete;
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.BuscarDados;
begin
  lbTotal.Caption := 'Registros localizados: 000000';
  if(DataSource1.DataSet.IsEmpty)then
    Exit;

  lbTotal.Caption := 'Registros localizados: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount);

  if(FUltId > 0 )then
    DataSource1.DataSet.Locate('ID', FUltId, []);
end;

procedure TViewHerancasBuscar.DBGrid1DblClick(Sender: TObject);
begin
  btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewHerancasBuscar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key = #13)then
    btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1TitleClick(Column: TColumn);
var
  LCampo, LOrdem: string;

begin
  if (DataSource1.DataSet.IsEmpty)then
    Exit;

  LCampo := Column.FieldName.Trim;
  if(LCampo.IsEmpty)or(Column.Field.FieldKind = fkCalculated)then
    Exit;

  LOrdem := LCampo + ':D';
  if(TFDQuery(DataSource1.DataSet).IndexFieldNames.Contains(':D'))then
    LOrdem := LCampo;
  TFDQuery(DataSource1.DataSet).IndexFieldNames := LOrdem;
end;

procedure TViewHerancasBuscar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case(key)of
    vk_F4:
      begin
        if (ssAlt in Shift) then
          key := 0;
      end;
    VK_ESCAPE:
      btnFechar.Click;
  end;

  if (key in [VK_F1..VK_F12]) then
  begin
    if (rdgroupFiltros.Items.Count >= Key - VK_F1) then
      rdgroupFiltros.ItemIndex := key - VK_F1;
  end;
  
end;

procedure TViewHerancasBuscar.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  FIdSelecionado := 0;
  edtBuscar.SetFocus;
end;

procedure TViewHerancasBuscar.rdgroupFiltrosClick(Sender: TObject);
begin
  edtBuscar.Text := '';
  edtBuscar.SetFocus;
end;

end.
