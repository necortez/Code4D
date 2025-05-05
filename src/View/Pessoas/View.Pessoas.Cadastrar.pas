unit View.Pessoas.Cadastrar;

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
  View.Herancas.Cadastrar,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Model.Pessoas.DM;

type
  TViewPessoasCadastrar = class(TViewHerancasCadastrar)
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblNome: TLabel;
    [FieldName('NOME')]
    edtNome: TDBEdit;
    lblFantasia: TLabel;
    [FieldName('FANTASIA')]
    edtFantasia: TDBEdit;
    chk_ativo: TDBCheckBox;
    chk_cliente: TDBCheckBox;
    chk_fornecedor: TDBCheckBox;
    lblCep: TLabel;
    edtCEP: TDBEdit;
    lblCidade: TLabel;
    [FieldName('ID_CIDADE')]
    edtIdCidade: TDBEdit;
    edtCidade: TEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblNumero: TLabel;
    EdtNumero: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblNascimento: TLabel;
    edtNascimento: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblCelular: TLabel;
    edtCelular: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    rdTipoJuridico: TDBRadioGroup;
    lblCPF: TLabel;
    edtCPF: TDBEdit;
    lblRG: TLabel;
    edtRG: TDBEdit;
    lblCNPJ: TLabel;
    edtCNPJ: TDBEdit;
    lblIE: TLabel;
    edtIE: TDBEdit;
    lblCadastro: TLabel;
    edtCadastro: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtIdCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIdCidadeExit(Sender: TObject);
    procedure rdTipoJuridicoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarTipoJuridico;
  public
    { Public declarations }
  end;

var
  ViewPessoasCadastrar: TViewPessoasCadastrar;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName,
  RTTI.FieldName,
  Utils,
  View.Cidades.Buscar,
  Model.Cidades.DM;

procedure TViewPessoasCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource.DataSet.Post;
  except
    on E: ExceptionFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;

end;

procedure TViewPessoasCadastrar.edtIdCidadeExit(Sender: TObject);
var
  LModelCidadesDM: TModelCidadesDM;
begin
  inherited;

  edtCidade.Clear;

  if(Trim(edtIdCidade.Text).IsEmpty)then
    Exit;

  LModelCidadesDM := TModelCidadesDM.Create(nil);
  try
    LModelCidadesDM.LookCidade(StrtointDef(edtIdCidade.Text, 0));
    if(LModelCidadesDM.QLook.IsEmpty)then
    begin
      edtIdCidade.SetFocus;
      raise Exception.Create('Cidade não localizada!');
    end;

    edtCidade.Text := LModelCidadesDM.QLookNOME.AsString + ' / ' +
                      LModelCidadesDM.QLookUF.AsString;
  finally
    LModelCidadesDM.Free;
  end;
end;

procedure TViewPessoasCadastrar.edtIdCidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F8)then
  begin
    ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
    try
      if(ViewCidadesBuscar.ShowModal = mrOk)then
        edtIdCidade.Text := ViewCidadesBuscar.IdSelecionado.ToString;
    finally;
      FreeAndNil(ViewCidadesBuscar);
    end;
  end;
end;

procedure TViewPessoasCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelPessoasDM.CadastrarGet(inherited idRegistroAlterar);
  if (DataSource.DataSet.IsEmpty) then
    DataSource.DataSet.Append
  else
  begin
    DataSource.DataSet.Edit;
    edtIdcidadeExit(edtIdCidade);
  end;

  Self.ConfigurarTipoJuridico;

  edtNome.SetFocus;

end;

procedure TViewPessoasCadastrar.rdTipoJuridicoClick(Sender: TObject);
begin
  inherited;
  Self.ConfigurarTipoJuridico;
end;

procedure TViewPessoasCadastrar.ConfigurarTipoJuridico;
begin
  edtCPF.Enabled  := True;
  edtRG.Enabled   := True;
  edtCNPJ.Enabled := True;
  edtIE.Enabled   := True;

  if (rdTipoJuridico.ItemIndex = 0) then
  begin
    edtCNPJ.Enabled := False;
    edtCPF.SetFocus;
  end
  else
  begin
    edtCNPJ.SetFocus;
    edtRG.Enabled   := False;
    edtCPF.Enabled  := False;
  end;
end;

end.
