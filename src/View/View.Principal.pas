unit View.Principal;

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
  Vcl.Menus,
  Vcl.StdCtrls,
  ShellAPI,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Movimentacoes: TMenuItem;
    Financeiro: TMenuItem;
    Fiscal: TMenuItem;
    Empresas: TMenuItem;
    Cidades: TMenuItem;
    Pessoas: TMenuItem;
    N1: TMenuItem;
    SubgruposdeProdutos: TMenuItem;
    Produtos: TMenuItem;
    Vendas: TMenuItem;
    ContasaReceber: TMenuItem;
    Configuracoes: TMenuItem;
    NFCe: TMenuItem;
    pnl_logo: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    lbGithub: TLabel;
    lbYoutube: TLabel;
    procedure lbGithubClick(Sender: TObject);
    procedure lbGithubMouseEnter(Sender: TObject);
    procedure lbGithubMouseLeave(Sender: TObject);
    procedure CidadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PessoasClick(Sender: TObject);
    procedure SubgruposdeProdutosClick(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure VendasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  View.Cidades.Buscar,
  View.Pessoas.Buscar,
  View.Subgrupos.Buscar,
  View.Produtos.Buscar,
  View.Vendas;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewPrincipal.lbGithubClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(TLabel(Sender).Caption), '', '', SW_SHOWNORMAL);
end;

procedure TViewPrincipal.lbGithubMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clRed;
end;

procedure TViewPrincipal.lbGithubMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWindowText;
end;

procedure TViewPrincipal.CidadesClick(Sender: TObject);
begin
  ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
  try
    ViewCidadesBuscar.ShowModal;
  finally
    FreeAndNil(ViewCidadesBuscar)
  end;
end;

procedure TViewPrincipal.PessoasClick(Sender: TObject);
begin
  ViewPessoasBuscar := TViewPessoasBuscar.Create(nil);
  try
    ViewPessoasBuscar.ShowModal;
  finally
    FreeAndNil(ViewPessoasBuscar)
  end;
end;

procedure TViewPrincipal.ProdutosClick(Sender: TObject);
begin
  ViewProdutosBuscar := TViewProdutosBuscar.Create(nil);
  try
    ViewProdutosBuscar.ShowModal;
  finally
    FreeAndNil(ViewProdutosBuscar)
  end;
end;

procedure TViewPrincipal.SubgruposdeProdutosClick(Sender: TObject);
begin
   ViewSubgruposBuscar := TViewSubgruposBuscar.Create(nil);
  try
    ViewSubgruposBuscar.ShowModal;
  finally
    FreeAndNil(ViewSubgruposBuscar)
  end;
end;

procedure TViewPrincipal.VendasClick(Sender: TObject);
begin
  ViewVendas := TViewVendas.Create(nil);
  try
    ViewVendas.ShowModal;
  finally
    FreeAndNil(ViewVendas)
  end;
end;

end.
